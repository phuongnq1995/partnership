package org.partnership.post.service;

import java.util.Calendar;
import java.util.List;

import org.partnership.post.model.Level;
import org.partnership.post.model.Post;
import org.partnership.post.model.WorkType;
import org.partnership.post.repository.LevelRepository;
import org.partnership.post.repository.PostRepository;
import org.partnership.post.repository.WorkTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class PostServiceImpl implements PostService {

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

	public String createPost(Post post, RedirectAttributes redirectAttributes) {
		Calendar daypost = Calendar.getInstance();
		post.setDaypost(daypost.getTime());
		if (post.getDayend() == null) {
			Calendar dayend = daypost;
			dayend.add(Calendar.MONTH, 1);
			post.setDayend(dayend.getTime());
		}
		postRepository.save(post);
		redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", "Create Success !");
		return "redirect:/";
	}

	public String show(long id, RedirectAttributes redirectAttributes, Model model) {
		Post post = postRepository.findOne(id);
		if(post == null){
			redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "Not found !");
			return "redirect:/";
		}
		model.addAttribute("post", post);
		model.addAttribute("company", post.getCompany());
		model.addAttribute("posts", postRepository.findAll());
		return "showpost";
	}

	public String getIndex(Model model) {
		model.addAttribute("posts", postRepository.findAll());
		return "indexpost";
	}
}
