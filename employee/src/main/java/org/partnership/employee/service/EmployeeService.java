package org.partnership.employee.service;

import org.partnership.employee.model.Employee;
import org.springframework.web.multipart.MultipartFile;

public interface EmployeeService {

	String newEmployee(Employee employee, MultipartFile[] fileUpload);

}
