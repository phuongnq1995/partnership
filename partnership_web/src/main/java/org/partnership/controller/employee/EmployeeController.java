package org.partnership.controller.employee;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.partnership.category.model.Category;
import org.partnership.category.service.CategoryService;
import org.partnership.converter.CategoryConverter;
import org.partnership.converter.LocationConverter;
import org.partnership.employee.model.Employee;
import org.partnership.employee.service.EmployeeService;
import org.partnership.location.model.Location;
import org.partnership.location.service.LocationService;
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
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private CategoryService categoryService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
		binder.registerCustomEditor(Category.class, new CategoryConverter());
		binder.registerCustomEditor(Location.class, new LocationConverter());
	}

	@RequestMapping(value = "/register/new")
	private String register(Model model) {
		model.addAttribute("employee", new Employee());
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("listLocation", locationService.findAll());
		return "newemployee";
	}

	@RequestMapping(value = "/register/new", method = RequestMethod.POST)
	private String createEmployee(RedirectAttributes redirectAttributes, @Valid Employee employee,
			BindingResult bindingResult, @RequestParam("fileUpload") MultipartFile[] fileUpload, Model model)
			throws IOException {
		if (bindingResult.hasErrors()) {
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("listLocation", locationService.findAll());
			return "newemployee";
		} else {
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", employeeService.newEmployee(employee, fileUpload));
		}
		return "redirect:/";
	}
}
