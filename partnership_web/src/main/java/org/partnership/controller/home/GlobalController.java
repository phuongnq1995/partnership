package org.partnership.controller.home;

import java.security.Principal;

import org.partnership.user.model.User;
import org.partnership.user.service.ContactService;
import org.partnership.user.service.UserCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	ContactService contactService;
	
	@ModelAttribute("user")
	public User newUser(Principal principal){
		if (principal == null){
			return new User();
		}
		return null;
	}
	
	@ModelAttribute("notseensize")
	public long nofication(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserCustom user = (UserCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(user != null){
				return contactService.countCountactByNotSeen(user.getId(), 0);
			}
		}
		return 0;
	}
	
}
