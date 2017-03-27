package org.partnership.employee.service;

import java.io.IOException;

import org.partnership.employee.model.Employee;
import org.partnership.employee.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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

}
