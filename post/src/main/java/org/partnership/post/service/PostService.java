package org.partnership.post.service;

import java.util.List;

import org.partnership.post.model.Level;
import org.partnership.post.model.Post;
import org.partnership.post.model.PostApply;
import org.partnership.post.model.WorkType;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface PostService {

	List<WorkType> findListType();

	List<Level> findListLevel();

	String createPost(Post post, RedirectAttributes redirectAttributes);

	String show(long id, RedirectAttributes redirectAttributes, Model model);

	String getIndex(Model model, int page);
	
	String getAdminPost(Model model, int page);

	List<Post> findByKeyWordsAndLocation(String keywords, int location_id);

	String newApplyPost(PostApply postApply, MultipartFile fileUpload, RedirectAttributes redirectAttributesredirectAttributes);

	String getPostsOfCompany(long companyId, Model model);

	List<PostApply> findPostsApply(long postId);
	
	List<Post> findTop4ByOrderByDaypostDesc();
	
}
