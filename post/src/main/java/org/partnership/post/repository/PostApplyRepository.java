package org.partnership.post.repository;

import java.util.List;

import org.partnership.post.model.PostApply;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostApplyRepository extends JpaRepository<PostApply, Long>{

	List<PostApply> findByPostIdOrderByDaycreateDesc(long postId);

	
	
}
