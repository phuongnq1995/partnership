package org.partnership.category.service;

import java.util.List;

import org.partnership.category.model.Category;
import org.partnership.category.repository.CategoryRepostiory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepostiory categoryRepostiory;

	public List<Category> findAll() {
		return categoryRepostiory.findAll();
	}

	public List<Category> findAllParent() {
		return categoryRepostiory.findAllParent();
	}
	
	
}
