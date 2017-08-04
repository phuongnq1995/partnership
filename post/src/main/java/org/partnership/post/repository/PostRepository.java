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
	
	Page<Post> findByDayendAfter(Date current, Pageable pageable);

	List<Post> findTop4ByOrderByDaypostDesc();
	
	@Query(value="select * from partnership_building.post p inner join ("
	+"select count(id) as quantity, a.post_id as a_post_id from partnership_building.post_apply a"
		+"group by a.post_id 	"
			+") b on b.a_post_id = p.id order by quantity desc", nativeQuery=true)
	List<Post> findTop4ByOrderByApplyAsc();
}
