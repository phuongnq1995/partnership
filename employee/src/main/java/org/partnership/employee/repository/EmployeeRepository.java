package org.partnership.employee.repository;


import org.partnership.employee.model.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

	@Query("SELECT CASE  WHEN count(e)> 0 THEN true ELSE false END FROM Employee e WHERE e.userId =:userId")
	public boolean checkEmployeePresent(@Param("userId") long id);

	@Query("select e from Employee e where e.userId =:userId")
	Employee findByUserId(@Param("userId") long userId);
	
	@Query("select e from Employee e where (lower(e.fullname) like %:keywords% or lower(e.description) like %:keywords%) ")
	Page<Employee> findByKeyWords(@Param("keywords") String keywords, Pageable pageable);

	@Query("select distinct e from Employee e LEFT JOIN e.categories c where c.id "
			+ "in (:categoriesId) "
			+ "and (lower(e.fullname) like %:keywords% or lower(e.description) like %:keywords%) ")
	Page<Employee> findByKeyWordsAndCategory(@Param("keywords") String keywords,
				@Param("categoriesId") Integer[] categoriesId, Pageable pageable);

	@Query("select e from Employee e JOIN e.categories c where c.id in "
			+ "(select c1.id from Category c1 where c1.parent.id = :categoryId) ")
	public Page<Employee> findByJobId(@Param("categoryId") int categoryId, Pageable pageable);
}

