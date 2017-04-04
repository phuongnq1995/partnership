package org.partnership.post.service;

import java.util.List;

import org.partnership.post.model.Level;
import org.partnership.post.model.WorkType;

public interface PostService {

	List<WorkType> findListType();

	List<Level> findListLevel();
	
}
