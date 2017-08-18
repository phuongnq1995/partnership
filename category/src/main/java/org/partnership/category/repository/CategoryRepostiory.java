package org.partnership.category.repository;

import java.util.List;

import org.partnership.category.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CategoryRepostiory extends JpaRepository<Category, Integer>{

	@Query("select c from Category c where c.parent IS NULL")
	List<Category> findAllParent();

}
