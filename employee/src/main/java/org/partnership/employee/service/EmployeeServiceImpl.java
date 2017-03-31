package org.partnership.employee.service;

import org.partnership.employee.model.Employee;
import org.partnership.employee.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

}
