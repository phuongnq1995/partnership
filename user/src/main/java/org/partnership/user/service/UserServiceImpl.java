package org.partnership.user.service;

import java.util.HashSet;
import java.util.Set;

import org.partnership.container.PartnershipFlash;
import org.partnership.user.model.Role;
import org.partnership.user.model.User;
import org.partnership.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private RoleService roleService;

	@Autowired
	private SecurityService securityService;

	@Transactional
	public String save(User user, BindingResult bindingResult, String role, RedirectAttributes redirectAttributes) {
		if (!user.getPassword().equals(user.getPasswordConfirm()))
			bindingResult.rejectValue("passwordConfirm", "These passwords don't match.");
		if (userRepository.findUserPresent(user.getEmail())){
			bindingResult.rejectValue("email", "Someone already has that email.");
		}
		if (bindingResult.hasErrors()){
			String messages = "";
			for (Object object : bindingResult.getAllErrors()) {
			    if(object instanceof ObjectError) {
			    	FieldError objectError = (FieldError) object;
			        if(objectError.getDefaultMessage() != null)
			        	messages += objectError.getDefaultMessage() + "<br> ";
			        else
			        	messages += objectError.getCode() + "<br>";
			    }
			}
			redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashError(messages));
			return "redirect:/";
		}
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		Set<Role> roles = new HashSet<Role>();
		roles.add(roleService.findByName(role));
		user.setRoles(roles);
		userRepository.save(user);
		securityService.autologin(user.getEmail(), user.getPasswordConfirm());
		redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashSuccess("Register success, please update your profile to be found"));
		return "redirect:/";
	}

	public User findOne(long id) {
		return userRepository.findOne(id);
	}

	public boolean findUserPresent(String email) {
		return userRepository.findUserPresent(email);
	}

	public User findUserByEmail(String email) {
		return userRepository.findUserByEmail(email);
	}

}
