package org.partnership.user.service;


import org.partnership.user.model.User;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface UserService {
	
	User findOne(long id);
	
	String save(User user, BindingResult bindingResult, String role, RedirectAttributes redirectAttributes);

	boolean findUserPresent(String email);

}
