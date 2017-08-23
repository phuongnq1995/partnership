package org.partnership.company.service;

import org.partnership.company.model.Company;
import org.partnership.user.model.User;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface CompanyService {

	String newCompany(Company company, MultipartFile fileUpload, String location);

	Page<Company> findAll(int page);

	Company findOne(long id);

	String delete(long id);

	String findProfile(User user, Model model);

	String showProfile(long id, Model model, RedirectAttributes redirectAttributes);
	
	Company findByUserId(long id);
	
	String getTop10Company(Model model);
}
