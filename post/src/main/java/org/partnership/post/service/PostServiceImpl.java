package org.partnership.post.service;
import java.util.List;

import org.partnership.post.model.Level;
import org.partnership.post.model.WorkType;
import org.partnership.post.repository.LevelRepository;
import org.partnership.post.repository.PostRepository;
import org.partnership.post.repository.WorkTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private LevelRepository levelRepository;
	
	@Autowired
	private WorkTypeRepository workTypeRepository;

	public List<WorkType> findListType() {
		return workTypeRepository.findAll();
	}

	public List<Level> findListLevel() {
		return levelRepository.findAll();
	}
}
