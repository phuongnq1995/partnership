package org.partnership.controller.company;

import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.validation.Valid;
import org.partnership.category.model.Category;
import org.partnership.company.model.Company;
import org.partnership.company.service.CompanyService;
import org.partnership.converter.CategoryConverter;
import org.partnership.converter.LocationConverter;
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
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
		binder.registerCustomEditor(Category.class, new CategoryConverter());
		binder.registerCustomEditor(Location.class, new LocationConverter());
	}

	Company newCompany(Principal principal) {
		Company company = new Company();
		company.setUserId(userService.findUserByEmail(principal.getName()).getId());
		return company;
	}

	boolean checkCompanyPresent(Principal principal) {
		if (companyService.findByUserId(userService.findUserByEmail(principal.getName()).getId()) == null)
			return false;
		return true;
	}

	@RequestMapping(value = "/new")
	private String register(Model model, Principal principal) {
		if (!checkCompanyPresent(principal)) {
			model.addAttribute("company", newCompany(principal));
			model.addAttribute("listLocation", locationService.findAll());
			return "newcompany";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private String create(RedirectAttributes redirectAttributes, @Valid Company company,
			@RequestParam("location") String location, BindingResult bindingResult,
			@RequestParam("fileUpload") MultipartFile fileUpload) throws IOException {
		if (bindingResult.hasErrors())
			return "newcompany";
		else {
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE",
					companyService.newCompany(company, fileUpload, location));
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "")
	public String profileCompany(Principal principal, Model model) {
		User user = userService.findUserByEmail(principal.getName());
		return companyService.findProfile(user, model);
	}

	@RequestMapping(value = "/{id}")
	public String profileCompany(@PathVariable("id") long id, Model model, RedirectAttributes redirectAttributes) {
		return companyService.showProfile(id, model, redirectAttributes);
	}
}
