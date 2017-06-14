package org.partnership.controller.home;


import javax.validation.Valid;

import org.partnership.container.PartnershipFlash;
import org.partnership.user.model.User;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/")
	private String home() {
		return "home";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@Valid User user, BindingResult bindingResult, Model model,
			@RequestParam("role") String role, RedirectAttributes redirectAttributes) {
		return userService.save(user, bindingResult, role, redirectAttributes);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("MESSAGE", PartnershipFlash.getFlashError("Your email and password is invalid."));
		if (logout != null)
			model.addAttribute("MESSAGE", PartnershipFlash.getFlashSuccess("You have been logged out successfully."));
		return "home";
	}
	

}
