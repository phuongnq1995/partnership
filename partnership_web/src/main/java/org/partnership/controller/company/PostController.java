package org.partnership.controller.company;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.validation.Valid;
import org.partnership.category.model.Category;
import org.partnership.category.service.CategoryService;
import org.partnership.company.service.CompanyService;
import org.partnership.converter.CategoryConverter;
import org.partnership.converter.LevelConverter;
import org.partnership.converter.LocationConverter;
import org.partnership.converter.WorkTypeConverter;
import org.partnership.location.model.Location;
import org.partnership.location.service.LocationService;
import org.partnership.post.model.Level;
import org.partnership.post.model.Post;
import org.partnership.post.model.WorkType;
import org.partnership.post.service.PostService;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private PostService postService;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
		binder.registerCustomEditor(Category.class, new CategoryConverter());
		binder.registerCustomEditor(Location.class, new LocationConverter());
		binder.registerCustomEditor(WorkType.class, new WorkTypeConverter());
		binder.registerCustomEditor(Level.class, new LevelConverter());
	}

	boolean checkCompanyPresent(Principal principal) {
		if (companyService.findByUserId(userService.findUserByEmail(principal.getName()).getId()) == null)
			return false;
		return true;
	}

	private String modelNewPost(Model model) {
		model.addAttribute("types", postService.findListType());
		model.addAttribute("levels", postService.findListLevel());
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("locations", locationService.findAll());
		return "newpost";
	}

	Post newPost(Principal principal) {
		Post post = new Post();
		post.setCompany(companyService.findByUserId(userService.findUserByEmail(principal.getName()).getId()));
		return post;
	}

	@RequestMapping(value = "/index")
	private String index(Model model) {
		return postService.getIndex(model);
	}

	@RequestMapping(value = "/new")
	private String newPost(Model model, Principal principal, RedirectAttributes redirectAttributes) {
		if (!checkCompanyPresent(principal)) {
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGES", "Register your company !");
			return "redirect:/company/new";
		}
		model.addAttribute("post", newPost(principal));
		return modelNewPost(model);
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private String createPost(@Valid Post post, BindingResult bindingResult, RedirectAttributes redirectAttributes,
			Model model) {
		Calendar daypost = Calendar.getInstance();
		Calendar dayend = daypost;
		dayend.add(Calendar.MONTH, 1);
		if (post.getDayend().after(dayend.getTime())) {
			bindingResult.rejectValue("dayend", "Post.dayend.size");
		}
		if (bindingResult.hasErrors()) {
			return modelNewPost(model);
		}
		return postService.createPost(post, redirectAttributes);
	}

	@RequestMapping(value = "/{id}")
	private String showPost(@PathVariable("id") long id, Model model, RedirectAttributes redirectAttributes) {
		return postService.show(id, redirectAttributes, model);
	}
}
