package org.partnership.controller.company;

import java.io.IOException;
import java.util.Date;

import javax.validation.Valid;

import org.partnership.category.model.Category;
import org.partnership.company.model.Company;
import org.partnership.company.service.CompanyService;
import org.partnership.container.PartnershipFlash;
import org.partnership.converter.CategoryConverter;
import org.partnership.converter.CustomDateConverter;
import org.partnership.converter.LocationConverter;
import org.partnership.converter.UserConverter;
import org.partnership.location.model.Location;
import org.partnership.location.service.LocationService;
import org.partnership.user.model.Contact;
import org.partnership.user.model.User;
import org.partnership.user.service.ContactService;
import org.partnership.user.service.UserCustom;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private LocationService locationService;

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

	Company newCompany() {
		Company company = new Company();
		UserCustom user = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		company.setUserId(user.getId());
		return company;
	}

	boolean checkCompanyPresent() {
		UserCustom user = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (companyService.findByUserId(user.getId()) == null)
			return false;
		return true;
	}

	@RequestMapping(value = "/new")
	private String register(Model model) {
		if (!checkCompanyPresent()) {
			model.addAttribute("company", newCompany());
			model.addAttribute("listLocation", locationService.findAll());
			return "newcompany";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private String create(RedirectAttributes redirectAttributes, @Valid Company company, @RequestParam("location") String location, 
			BindingResult bindingResult, @RequestParam("fileUpload") MultipartFile fileUpload) throws IOException {
		if (bindingResult.hasErrors())
			return "newcompany";
		else {
			redirectAttributes.addFlashAttribute("MESSAGE",
					PartnershipFlash.getFlashSuccess(companyService.newCompany(company, fileUpload, location)) );
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/edit")
	private String edit(Model model) {
		UserCustom user = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(user != null){
			Company company = companyService.findByUserId(user.getId());
			model.addAttribute("company", company);
			model.addAttribute("listLocation", locationService.findAll());
			return "editcompany";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	private String update(RedirectAttributes redirectAttributes, @Valid Company company, @RequestParam("location") String location, 
			BindingResult bindingResult, @RequestParam("fileUpload") MultipartFile fileUpload) throws IOException {
		if (bindingResult.hasErrors())
			return "editcompany";
		else {
			redirectAttributes.addFlashAttribute("MESSAGE",
					PartnershipFlash.getFlashSuccess(companyService.newCompany(company, fileUpload, location)) );
		}
		return "redirect:/";
	}

	@RequestMapping(value = "")
	public String profileCompany(Model model) {
		UserCustom userCustom = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userService.findOne(userCustom.getId());
		return companyService.findProfile(user, model);
	}
	
	@RequestMapping(value = "/index")
	private String index(Model model){
		model.addAttribute("companies", companyService.findAll());
		return "indexcompany";
	}

	@RequestMapping(value = "/{id}")
	public String profileCompany(@PathVariable("id") long id, Model model, RedirectAttributes redirectAttributes) {
		return companyService.showProfile(id, model, redirectAttributes);
	}
	
	@RequestMapping(value="/sendMessage", method = RequestMethod.POST)
	public String sendMessage(@Valid Contact contact, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()){
			redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashError("ERROR"));
		}
		redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashSuccess(contactService.saveContact(contact)));
		return "redirect:/employee/"+companyService.findByUserId(contact.getUserReceive().getId()).getId();
	}
}
