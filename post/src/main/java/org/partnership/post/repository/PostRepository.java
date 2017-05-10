package org.partnership.post.repository;

import java.util.List;

import org.partnership.post.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PostRepository extends JpaRepository<Post, Long>{

	@Query("select p from Post p INNER JOIN p.locations l where l.name like %:location% "
		+ "and lowcase(p.title) like %:keywords% or lowcase(p.company.name) like %:keyword%" )
	List<Post> findByKeyWordAndLocation(@Param("keywords") String keywords, @Param("location")String location);
	//where lowcase(p.title) like %:keywords% or lowcase(p.company.name) like %:keyword%

	List<Post> findByCompanyId(long companyId);
}
