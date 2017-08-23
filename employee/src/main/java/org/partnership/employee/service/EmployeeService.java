package org.partnership.employee.service;

import java.util.List;

import org.partnership.employee.model.Employee;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface EmployeeService {

	String newEmployee(Employee employee, MultipartFile[] fileUpload);
	
	Employee findOne(long id);

	String findProfile(long userId, Model model);

	String showProfile(long id, Model model, RedirectAttributes redirectAttributes);
	
	Employee findByUserId(long id);
	
	Page<Employee> findPage(int page);
	
	List<Employee> findAll();
	
	String delete(long id);
	
	String findByKeyWordsAndCategories(Model model, int page, String keywords,Integer[] skills);

	String findByJobId(int categoryId, int page, Model model);

	String updateEmployee(Employee employee, MultipartFile[] fileUpload);

}
