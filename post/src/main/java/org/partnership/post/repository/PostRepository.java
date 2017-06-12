package org.partnership.post.repository;

import java.util.List;

import org.partnership.post.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PostRepository extends JpaRepository<Post, Long>{

	@Query("select p from Post p INNER JOIN p.locations l where l.id = :locationId "
		+ "and lower(p.title) like %:keywords% or lower(p.company.name) like %:keywords%" )
	List<Post> findByKeyWordsAndLocation(@Param("keywords") String keywords, @Param("locationId") int location_id);
	//where lowcase(p.title) like %:keywords% or lowcase(p.company.name) like %:keyword%
	
	@Query("select p from Post p where lower(p.title) like %:keywords% or lower(p.company.name) like %:keywords%" )
		List<Post> findByKeyWords(@Param("keywords") String keywords);
		//where lowcase(p.title) like %:keywords% or lowcase(p.company.name) like %:keyword%
	
	@Query("select p from Post p INNER JOIN p.locations l where l.id = :locationId ")
		List<Post> findByLocation(@Param("locationId") int location_id);
	
	List<Post> findByCompanyId(long companyId);
}
