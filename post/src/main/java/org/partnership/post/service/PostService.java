package org.partnership.post.service;

import java.util.List;

import org.partnership.post.model.Level;
import org.partnership.post.model.Post;
import org.partnership.post.model.WorkType;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface PostService {

	List<WorkType> findListType();

	List<Level> findListLevel();

	String createPost(Post post, RedirectAttributes redirectAttributes);

	String show(long id, RedirectAttributes redirectAttributes, Model model);
	
}
