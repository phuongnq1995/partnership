package org.partnership.employee.service;

import org.partnership.employee.model.Employee;
import org.partnership.user.model.User;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface EmployeeService {

	String newEmployee(Employee employee);
	
	Employee findOne(long id);

	String findProfile(User user, Model model);

	String showProfile(long id, Model model, RedirectAttributes redirectAttributes);
	
}
