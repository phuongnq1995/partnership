package org.partnership.controller.company;

import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.validation.Valid;

import org.partnership.category.model.Category;
import org.partnership.category.service.CategoryService;
import org.partnership.company.model.Company;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private PostService postService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
		binder.registerCustomEditor(Category.class, new CategoryConverter());
		binder.registerCustomEditor(Location.class, new LocationConverter());
		binder.registerCustomEditor(WorkType.class, new WorkTypeConverter());
		binder.registerCustomEditor(Level.class, new LevelConverter());
	}

	Company newCompany(Principal principal) {
		Company company = new Company();
		company.setUserId(userService.findUserByEmail(principal.getName()).getId());
		return company;
	}

	boolean checkCompanyPresent(Principal principal) {
		if (companyService.findByUserId(userService.findUserByEmail(principal.getName()).getId()) == null)
			return false;
		return true;
	}
	
	Post newPost(Principal principal){
		Post post = new Post();
		post.setCompany(companyService.findByUserId(userService.findUserByEmail(principal.getName()).getId()));
		return post;
	}

	@RequestMapping(value = "/new")
	private String register(Model model, Principal principal) {
		if (!checkCompanyPresent(principal)) {
			model.addAttribute("company", newCompany(principal));
			model.addAttribute("listLocation", locationService.findAll());
			return "newcompany";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private String create(RedirectAttributes redirectAttributes, @Valid Company company,
			@RequestParam("location") String location, BindingResult bindingResult,
			@RequestParam("fileUpload") MultipartFile fileUpload) throws IOException {
		if (bindingResult.hasErrors())
			return "newcompany";
		else {
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE",
					companyService.newCompany(company, fileUpload, location));
		}
		return "redirect:/";
	}

	private String modelNewPost(Model model){
		model.addAttribute("types", postService.findListType());
		model.addAttribute("levels", postService.findListLevel());
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("locations", locationService.findAll());
		return "newpost";
	}
	
	@RequestMapping(value = "/post")
	private String newPost(Model model, Principal principal) {
		if (!checkCompanyPresent(principal)) {
			return "redirect:/company/new";
		}
		model.addAttribute("post", newPost(principal));
		return modelNewPost(model);
	}
	
	@RequestMapping(value = "/post", method = RequestMethod.POST)
	private String createPost(@Valid Post post, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model){
		Calendar daypost = Calendar.getInstance();
		Calendar dayend = daypost;
		dayend.add(Calendar.MONTH, 1);
		if (post.getDayend().after(dayend.getTime())) {
			bindingResult.rejectValue("dayend", "post.dayend.size");
		}
		if (bindingResult.hasErrors()) {
			return modelNewPost(model);
		}
		return postService.createPost(post, redirectAttributes);
	}
}
