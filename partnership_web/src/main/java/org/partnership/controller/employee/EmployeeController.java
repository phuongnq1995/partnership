package org.partnership.controller.employee;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;

import javax.validation.Valid;

import org.partnership.category.model.Category;
import org.partnership.category.service.CategoryService;
import org.partnership.container.PartnershipFlash;
import org.partnership.converter.CategoryConverter;
import org.partnership.converter.CustomDateConverter;
import org.partnership.converter.LocationConverter;
import org.partnership.converter.UserConverter;
import org.partnership.employee.model.Employee;
import org.partnership.employee.service.EmployeeService;
import org.partnership.location.model.Location;
import org.partnership.location.service.LocationService;
import org.partnership.user.model.Contact;
import org.partnership.user.model.User;
import org.partnership.user.service.ContactService;
import org.partnership.user.service.UserCustom;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	@Autowired
	private ContactService contactService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateConverter());
		binder.registerCustomEditor(Category.class, new CategoryConverter());
		binder.registerCustomEditor(Location.class, new LocationConverter());
		binder.registerCustomEditor(User.class, new UserConverter());
	}

	Employee newEmployee() {
		UserCustom user = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Employee employee = new Employee();
		employee.setUserId(user.getId());
		return employee;
	}

	boolean checkEmployeePresent() {
		UserCustom user = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(user == null){
			return false;
		}
		if (employeeService.findByUserId(user.getId()) == null)
			return false;
		return true;
	}
	
	@RequestMapping(value = "/index")
	private String index(Model model, @RequestParam(defaultValue="1") int page){
		model.addAttribute("pages", employeeService.findPage(page));
		model.addAttribute("categories", categoryService.findAll());
		/*return employeeService.getIndex(model);*/
		return "indexemployee";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	private String register(Model model) {
		if (!checkEmployeePresent()) {
			model.addAttribute("employee", newEmployee());
			model.addAttribute("categories", categoryService.findAllParent());
			model.addAttribute("listLocation", locationService.findAll());
			model.addAttribute("MESSAGE", PartnershipFlash.getFlashSuccess("Please update your profile !"));		 
			return "newemployee";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private String createEmployee(RedirectAttributes redirectAttributes,
			@Valid Employee employee, BindingResult bindingResult,
			@RequestParam("fileUpload") MultipartFile[] fileUpload, Model model) throws IOException {
		if (bindingResult.hasErrors()) {
			model.addAttribute("categories", categoryService.findAllParent());
			model.addAttribute("listLocation", locationService.findAll());
			return "newemployee";
		} else {
			redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashSuccess(employeeService.newEmployee(employee, fileUpload)));
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "")
	public String profileEmployee(Model model) {
		UserCustom user = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return employeeService.findProfile(user.getId(), model);
	}

	@RequestMapping(value = "/{id}")
	public String profileEmployee(@PathVariable("id") long id, Model model, RedirectAttributes redirectAttributes) {
		return employeeService.showProfile(id, model, redirectAttributes);
	}
	
	@RequestMapping(value="/applyPost", method = RequestMethod.GET)
	public @ResponseBody Employee applyPost() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		if(authorities.contains(new SimpleGrantedAuthority("ROLE_EMPLOYEE"))){
			UserCustom user = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (user != null) {
				Employee employee1 = employeeService.findByUserId(user.getId());
				Employee employee2 = new Employee();
				employee2.setFullname(employee1.getFullname());
				employee2.setId(employee1.getId());
				employee2.setCv(employee1.getCv());
				return employee2;
			}
		}
		return null;
	}
	
	@RequestMapping(value="/sendMessage", method = RequestMethod.POST)
	public String sendMessage(@Valid Contact contact, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()){
			redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashError("ERROR"));
		}
		redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashSuccess(contactService.saveContact(contact)));
		return "redirect:/employee/"+employeeService.findByUserId(contact.getUserReceive().getId()).getId();
	}
}
