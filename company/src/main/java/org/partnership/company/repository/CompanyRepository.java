package org.partnership.company.repository;

import java.util.List;

import org.partnership.company.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CompanyRepository extends JpaRepository<Company, Long>{

	@Query("SELECT CASE  WHEN count(c)> 0 THEN true ELSE false END FROM Company c WHERE c.userId =:userId")
	public boolean checkCompanyPresent(@Param("userId")long id);
	
	@Query("select c from Company c where c.userId =:userId")
	public Company findByUserId(@Param("userId") long userId);
	
	@Query(value="SELECT c.id as id, c.name as name, count(p.id) as quantity "
			+ " FROM company c LEFT JOIN post p on c.id = p.company_id WHERE p.status = 1 "
			+ " GROUP BY id, name "
			+ " ORDER BY quantity DESC limit 10", nativeQuery=true)
	public List<Object[]> getTop10Company();
}
