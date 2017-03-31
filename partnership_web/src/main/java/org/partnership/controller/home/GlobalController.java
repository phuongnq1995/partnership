package org.partnership.controller.home;

import java.security.Principal;

import org.partnership.user.model.User;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalController {
	
	@ModelAttribute("user")
	public User newUser(Principal principal){
		if (principal == null)
			return new User();
		return null;
	}
	
}
