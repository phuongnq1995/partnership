package org.partnership.employee.repository;

import org.partnership.employee.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EmployeeRepository extends JpaRepository<Employee, Long>{

	@Query("SELECT CASE  WHEN count(e)> 0 THEN true ELSE false END FROM Employee e WHERE e.userId =:userId")
	public boolean checkEmployeePresent(@Param("userId")long id);

	@Query("select e from Employee e where e.userId =:userId")
	Employee findByUserId(@Param("userId") long userId);
	
}
