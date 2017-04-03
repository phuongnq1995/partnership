package org.partnership.controller.company;

import java.io.IOException;
import java.security.Principal;

import javax.validation.Valid;

import org.partnership.company.model.Company;
import org.partnership.company.service.CompanyService;
import org.partnership.location.service.LocationService;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
	Company newCompany(Principal principal){
		Company company = new Company();
		company.setUserId(userService.findUserByEmail(principal.getName()).getId());
		return company;
	}
	
	@RequestMapping(value = "/new")
	private String register(Model model, Principal principal) {
		model.addAttribute("company", newCompany(principal));
		model.addAttribute("listLocation", locationService.findAll());
		return "newcompany";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private String create(RedirectAttributes redirectAttributes, @Valid Company company,
			@RequestParam("location") String location, BindingResult bindingResult,
			@RequestParam("fileUpload") MultipartFile fileUpload) throws IOException {
		if (bindingResult.hasErrors())
			return "newcompany";
		else {
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", companyService.newCompany(company, fileUpload, location));
		}
		return "redirect:/";
	}
}
