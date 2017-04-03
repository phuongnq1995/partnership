package org.partnership.company.repository;

import org.partnership.company.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CompanyRepository extends JpaRepository<Company, Long>{

	@Query("SELECT CASE  WHEN count(c)> 0 THEN true ELSE false END FROM Company c WHERE c.userId =:userId")
	public boolean checkCompanyPresent(@Param("userId")long id);
	
	@Query("select c from Company c where c.userId =:userId")
	public Company findByUserId(@Param("userId") long userId);
}
