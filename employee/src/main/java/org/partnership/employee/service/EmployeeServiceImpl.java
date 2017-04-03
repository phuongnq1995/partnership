package org.partnership.employee.service;

import org.partnership.employee.model.Employee;
import org.partnership.employee.repository.EmployeeRepository;
import org.partnership.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Transactional
	public String newEmployee(Employee employee) {
		employeeRepository.save(employee);
		return "Create Success !";
	}

	public Employee findOne(long id) {
		return employeeRepository.findOne(id);
	}
	
	public String findProfile(User user, Model model) {
		if (!employeeRepository.checkEmployeePresent(user.getId()))
			return "redirect:/employee/new";
		return "redirect:/employeeprofile/" + (employeeRepository.findByUserId(user.getId()).getId());
	}

	public String showProfile(long id, Model model, RedirectAttributes redirectAttributes) {
		Employee employee = employeeRepository.findOne(id);
		if(employee == null){
			redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "Not found !");
			return "redirect:/";
		}
		model.addAttribute("employee", employee);	
		return "employeeprofile";
	}

}
