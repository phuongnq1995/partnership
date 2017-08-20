package org.partnership.post.repository;
import java.util.Date;
import java.util.List;

import org.partnership.post.model.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PostRepository extends JpaRepository<Post, Long>{

	@Query("select distinct p from Post p JOIN p.locations l where l.id = :locationId "  
		+ " and (lower(p.title) like %:keywords% or lower(p.company.name) like %:keywords%) "
		+ " and p.status = 1 and CURRENT_DATE() <= p.dayend " )
	Page<Post> findByKeyWordsAndLocation(@Param("keywords") String keywords, @Param("locationId") int location_id,
			Pageable pageable);
	
	@Query("select distinct p from Post p LEFT JOIN p.categories c where c.id "
			+ "in (:categoriesId) "
			+ "and (lower(p.title) like %:keywords% or lower(p.company.name) like %:keywords%) "
			+ "and p.status = 1 and CURRENT_DATE() <= p.dayend " )
		Page<Post> findByKeyWordsAndCategory(@Param("keywords") String keywords,
				@Param("categoriesId") Integer[] categoriesId, Pageable pageable);
	
	@Query("select distinct p from Post p LEFT JOIN p.categories c LEFT JOIN p.locations l where c.id "
			+ "in (:categoriesId) and l.id = :locationId "
			+ "and (lower(p.title) like %:keywords% or lower(p.company.name) like %:keywords%) "
			+ "and p.status = 1 and CURRENT_DATE() <= p.dayend " )
		Page<Post> findByKeyWordsAndLocationAndCategory(@Param("keywords") String keywords, @Param("locationId") int location_id,
				@Param("categoriesId") Integer[] categoriesId, Pageable pageable);
	
	@Query("select p from Post p where (lower(p.title) like %:keywords% or lower(p.company.name) like %:keywords%) "
			+" and p.status = 1 and CURRENT_DATE() <= p.dayend " )
	Page<Post> findByKeyWords(@Param("keywords") String keywords, Pageable pageable);
		//where lowcase(p.title) like %:keywords% or lowcase(p.company.name) like %:keyword%
	
	@Query("select p from Post p INNER JOIN p.locations l where l.id = :locationId and p.status = 1 and CURRENT_DATE() <= p.dayend ")
	Page<Post> findByLocation(@Param("locationId") int location_id, Pageable pageable);
	
	List<Post> findByCompanyIdAndDayendAfterAndStatus(long companyId, Date current, int status);
	
	Page<Post> findByDayendAfterAndStatus(Date current, int status, Pageable pageable);

	List<Post> findTop4ByStatusOrderByDaypostDesc(int status);
	
	@Query(value="select * from post p left join ("
		+" select count(id) as quantity, a.post_id as idpostapplycount from post_apply a  "
		+" group by a.post_id ) b on b.idpostapplycount = p.id where p.status = 1 and CURRENT_DATE() <= p.dayend "
		+" order by b.quantity desc ", nativeQuery=true)
	List<Post> findTop4ByOrderByApplyAsc();
	
}
