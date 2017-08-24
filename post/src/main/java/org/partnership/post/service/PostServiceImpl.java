package org.partnership.post.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.partnership.category.model.Category;
import org.partnership.container.PartnershipFlash;
import org.partnership.container.PartnershipStatic;
import org.partnership.post.model.Level;
import org.partnership.post.model.Post;
import org.partnership.post.model.PostApply;
import org.partnership.post.model.WorkType;
import org.partnership.post.repository.LevelRepository;
import org.partnership.post.repository.PostApplyRepository;
import org.partnership.post.repository.PostRepository;
import org.partnership.post.repository.WorkTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostRepository postRepository;

	@Autowired
	private LevelRepository levelRepository;

	@Autowired
	private WorkTypeRepository workTypeRepository;

	@Autowired
	private PostApplyRepository postApplyRepository;

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
		redirectAttributes.addFlashAttribute("MESSAGE",
				PartnershipFlash.getFlashSuccess("Create Success !"));
		return "redirect:/post/" + post.getId();
	}

	public String show(long id, RedirectAttributes redirectAttributes,
			Model model) {
		Post post = postRepository.findOne(id);
		if (post == null) {
			redirectAttributes.addFlashAttribute("MESSAGE",
					PartnershipFlash.getFlashError("Not found !"));
			return "redirect:/";
		}
		model.addAttribute("post", post);
		model.addAttribute("posts", postRepository.findByCompanyIdAndDayendAfterAndStatus(
				post.getCompany().getId(), new Date(), 1));
		model.addAttribute("postApply", new PostApply());
		String parentNameCategory = "";
		List<Integer> idsParentCategory = new ArrayList<Integer>();
		for(Category category : post.getCategories()){
			if(!idsParentCategory.contains(category.getParent().getId())){
				idsParentCategory.add(category.getParent().getId());
				parentNameCategory += (category.getParent().getName() + "/");
			}
		}
		
		model.addAttribute("parentNameCategory", parentNameCategory.substring(0, parentNameCategory.length()-1));
		return "showpost";
	}

	public String getIndex(Model model, int page) {
		Pageable pageable = createPageRequest(page);
		model.addAttribute("pages",
				postRepository.findByDayendAfterAndStatus(new Date(), 1, pageable));
		return "indexpost";
	}
	
	@Transactional
	public String getAdminPost(Model model, int page) {
		Pageable pageable = createPageRequest(page);
		model.addAttribute("pages", postRepository.findByDayendAfterAndStatus(new Date(), 0, pageable));
		return "adminposts";
	}
	
	@Transactional
	public String acceptPost(Model model, int page, RedirectAttributes redirectAttributes, long[] list){
		for(int i = 0 ; i < list.length; i++){
			Post post = postRepository.getOne(list[i]);
			post.setStatus(1);//Da duyet
			postRepository.save(post);
		}
		return getAdminPost(model, page);
	}
	
	@Transactional
	public String deletedPost(Model model, int page, RedirectAttributes redirectAttributes, long[] list){
		for(int i = 0 ; i < list.length; i++){
			Post post = postRepository.getOne(list[i]);
			post.setStatus(2);//Da xoa
			postRepository.save(post);
		}
		return getAdminPost(model, page);
	}

	@Transactional
	public String findByKeyWordsAndLocation(Model model, int page, String keywords,
			int location_id, Integer[] categoriesId) {
		Pageable pageable = createPageRequest(page);
		if(location_id == 0 && categoriesId == null){
			model.addAttribute("pages", postRepository.findByKeyWords(keywords, pageable));
		} else if(location_id == 0){
			model.addAttribute("pages", postRepository.findByKeyWordsAndCategory(
					keywords, categoriesId, pageable));
		} else if(categoriesId == null){
			model.addAttribute("pages", postRepository.findByKeyWordsAndLocation(keywords, location_id, pageable));
		} else {
			model.addAttribute("pages", postRepository.findByKeyWordsAndLocationAndCategory(
					keywords, location_id, categoriesId, pageable));
		}
			
		model.addAttribute("categoriesId", categoriesId);
		model.addAttribute("keywords", keywords);
		model.addAttribute("locationId", location_id);
		return "indexpost";
	}

	@SuppressWarnings("null")
	public String newApplyPost(PostApply postApply, MultipartFile fileUpload,
			RedirectAttributes redirectAttributes) {
		try {
			if (postApply == null) {
				postApply.setCv(fileUpload.getBytes());
			}
		} catch (IOException e) {
			postApply.setCv(null);
		}
		if (postApply.getCv() != null) {
			postApply.setDaycreate(new Date());
			postApplyRepository.save(postApply);
			redirectAttributes.addFlashAttribute("MESSAGE",
					PartnershipFlash.getFlashSuccess("Apply success !"));
		}else{
			redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashError("Please choice your cv !"));
		}
		return "redirect:/post/" + postApply.getPostId();
	}

	public String getPostsOfCompany(long companyId, Model model) {
		List<Post> posts = postRepository.findByCompanyIdAndDayendAfterAndStatus(companyId, new Date(), 1);
		model.addAttribute("posts", posts);
		return "indexapply";
	}

	public List<PostApply> findPostsApply(long postId) {
		return postApplyRepository.findByPostIdOrderByDaycreateDesc(postId);
	}

	private Pageable createPageRequest(int page) {
		return new PageRequest(page - 1, PartnershipStatic.PER_PAGE,
				Sort.Direction.DESC, "daypost");
	}

	public List<Post> findTop4ByOrderByDaypostDesc() {
		Pageable pageable = createPageRequest(1);
		return postRepository.findFirst4ByStatusOrderByDaypostDesc(1, pageable);
	}
	
	public List<Post> findTop4PostRecent() {
		return postRepository.findTop4ByOrderByApplyAsc();
	}
	
	public long countPostForEmployee(){
		return postRepository.countByStatusAndDayendAfter(1, new Date());
	}

	@Transactional
	public String deletePostByCompanyId(long companyId) {
		List<Post> posts = postRepository.findByCompanyId(companyId);
		for(Post post : posts){
			postRepository.delete(post);
		}
		return "Deleted success !";
	}

}
