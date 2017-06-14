package org.partnership.controller.employee;

import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.partnership.category.model.Category;
import org.partnership.category.service.CategoryService;
import org.partnership.container.PartnershipFlash;
import org.partnership.converter.CategoryConverter;
import org.partnership.converter.LocationConverter;
import org.partnership.employee.model.Employee;
import org.partnership.employee.service.EmployeeService;
import org.partnership.location.model.Location;
import org.partnership.location.service.LocationService;
import org.partnership.user.model.User;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
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

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
		binder.registerCustomEditor(Category.class, new CategoryConverter());
		binder.registerCustomEditor(Location.class, new LocationConverter());
	}

	Employee newEmployee(Principal principal) {
		Employee employee = new Employee();
		employee.setUserId(userService.findUserByEmail(principal.getName()).getId());
		return employee;
	}

	boolean checkEmployeePresent(Principal principal) {
		if(principal == null){
			return false;
		}
		if (employeeService.findByUserId(userService.findUserByEmail(principal.getName()).getId()) == null)
			return false;
		return true;
	}
	
	@RequestMapping(value = "/index")
	private String index(Model model){
		model.addAttribute("categories", categoryService.findAll());
		return employeeService.getIndex(model);
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	private String register(Model model, Principal principal) {
		if (!checkEmployeePresent(principal)) {
			model.addAttribute("employee", newEmployee(principal));
			model.addAttribute("categories", categoryService.findAllParent());
			model.addAttribute("listLocation", locationService.findAll());
			model.addAttribute("MESSAGE", PartnershipFlash.getFlashSuccess("Please update your profile !"));		 
			return "newemployee";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private String createEmployee(RedirectAttributes redirectAttributes,
			@ModelAttribute("employee") @Valid Employee employee, BindingResult bindingResult,
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
	public String profileEmployee(Principal principal, Model model) {
		User user = userService.findUserByEmail(principal.getName());
		return employeeService.findProfile(user, model);
	}

	@RequestMapping(value = "/{id}")
	public String profileEmployee(@PathVariable("id") long id, Model model, RedirectAttributes redirectAttributes) {
		return employeeService.showProfile(id, model, redirectAttributes);
	}
	
	@RequestMapping(value="/applyPost", method = RequestMethod.GET)
	public @ResponseBody Employee applyPost(Principal principal) {
		if (checkEmployeePresent(principal)) {
			Employee employee1 = employeeService.findByUserId(userService.findUserByEmail(principal.getName()).getId());
			Employee employee2 = new Employee();
			employee2.setFullname(employee1.getFullname());
			employee2.setId(employee1.getId());
			employee2.setCv(employee1.getCv());
			return employee2;
		}
		System.out.println("Null");
		return null;
	}
}
