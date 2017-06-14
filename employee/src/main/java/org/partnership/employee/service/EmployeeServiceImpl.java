package org.partnership.employee.service;

import java.io.IOException;

import org.partnership.container.PartnershipFlash;
import org.partnership.employee.model.Employee;
import org.partnership.employee.repository.EmployeeRepository;
import org.partnership.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Transactional
	public String newEmployee(Employee employee, MultipartFile[] fileUpload) {
		try {
			if (!fileUpload[0].isEmpty())
				employee.setAvatar(fileUpload[0].getBytes());
			if (!fileUpload[1].isEmpty())
				employee.setCv(fileUpload[1].getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		employeeRepository.save(employee);
		return "Create Success !";
	}

	public Employee findOne(long id) {
		return employeeRepository.findOne(id);
	}
	
	public String findProfile(User user, Model model) {
		if (!employeeRepository.checkEmployeePresent(user.getId())){
			return "redirect:/employee/new";
		}else{
			long id = employeeRepository.findByUserId(user.getId()).getId();
			model.addAttribute("employee", employeeRepository.findOne(id));
			return "showemployee";
		}
	}

	public String showProfile(long id, Model model, RedirectAttributes redirectAttributes) {
		Employee employee = employeeRepository.findOne(id);
		if(employee == null){
			redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashError("Not found !"));
			return "redirect:/";
		}
		model.addAttribute("employee", employee);
		return "showemployee";
	}

	public Employee findByUserId(long userId) {
		return employeeRepository.findByUserId(userId);
	}

	public String getIndex(Model model) {
		model.addAttribute("employees", employeeRepository.findAll());
		return "indexemployee";
	}

}
