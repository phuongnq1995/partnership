package org.partnership.employee.service;

import java.io.IOException;
import java.util.List;
import org.partnership.container.PartnershipFlash;
import org.partnership.container.PartnershipStatic;
import org.partnership.employee.model.Employee;
import org.partnership.employee.repository.EmployeeRepository;
import org.partnership.user.model.Contact;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Autowired
	private UserService userService;
	
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
		return "Update profile success !";
	}

	public Employee findOne(long id) {
		return employeeRepository.findOne(id);
	}
	
	public String findProfile(long userId, Model model) {
		if (!employeeRepository.checkEmployeePresent(userId)){
			return "redirect:/employee/new";
		}else{
			long id = employeeRepository.findByUserId(userId).getId();
			model.addAttribute("employee", employeeRepository.findOne(id));
			model.addAttribute("contact", new Contact());
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
		model.addAttribute("contact", new Contact());
		model.addAttribute("userReceive", userService.findOne(employee.getUserId()));
		return "showemployee";
	}

	public Employee findByUserId(long userId) {
		return employeeRepository.findByUserId(userId);
	}

	public String getIndex(Model model) {
		model.addAttribute("employees", employeeRepository.findAll());
		return "indexemployee";
	}
	
	public Page<Employee> findPage(int page){
		Pageable pageable = createPageRequest(page);
		return employeeRepository.findAll(pageable);
	}

	public List<Employee> findAll() {
		return employeeRepository.findAll();
	}
	
	private Pageable createPageRequest(int page) {
	    return new PageRequest(page-1, PartnershipStatic.PER_PAGE);
	}
	
	public String delete(long id) {
		Employee employee = employeeRepository.findOne(id);
		if (employee != null) {
			employeeRepository.delete(id);
			return "Delete success !";
		}
		return "Delete fail !";
	}
	
}
