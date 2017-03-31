package org.partnership.employee.service;

import org.partnership.employee.model.Employee;

public interface EmployeeService {

	String newEmployee(Employee employee);
	
	Employee findOne(long id);

}
