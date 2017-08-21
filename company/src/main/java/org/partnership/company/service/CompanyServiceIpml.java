package org.partnership.company.service;

import java.io.IOException;
import java.util.List;
import org.partnership.company.model.Company;
import org.partnership.company.repository.CompanyRepository;
import org.partnership.container.PartnershipFlash;
import org.partnership.user.model.Contact;
import org.partnership.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class CompanyServiceIpml implements CompanyService {

	@Autowired
	private CompanyRepository companyRepository;

	@Transactional
	public String newCompany(Company company, MultipartFile fileUpload, String location) {
		try {
			if (!fileUpload.isEmpty())
				company.setLogo(fileUpload.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(!location.isEmpty())
			company.setAddress(company.getAddress()+", "+location);
		if(!company.getVideo().isEmpty()){
			company.setVideo(company.getVideo().replace("watch?v=", "embed/"));
		}
		companyRepository.save(company);
		return "Create Success !";
	}

	public List<Company> findAll() {
		return companyRepository.findAll();
	}

	public Company findOne(long id) {
		return companyRepository.findOne(id);
	}

	public String delete(long id) {
		Company company = companyRepository.findOne(id);
		if (company != null) {
			companyRepository.delete(id);
			return "Delete success !";
		}
		return "Delete fail !";
	}

	public String findProfile(User user, Model model) {
		if (!companyRepository.checkCompanyPresent(user.getId()))
			return "redirect:/company/new";
		return "redirect:/company/" + (companyRepository.findByUserId(user.getId()).getId());
	}

	public String showProfile(long id, Model model, RedirectAttributes redirectAttributes) {
		Company company = companyRepository.findOne(id);
		if(company == null){
			redirectAttributes.addFlashAttribute("MESSAGE", PartnershipFlash.getFlashError("Not found !"));
			return "redirect:/";
		}
		model.addAttribute("contact", new Contact());
		model.addAttribute("company", company);	
		return "showcompany";
	}

	public Company findByUserId(long userId) {
		return companyRepository.findByUserId(userId);
	}
	
	public String getTop10Company(Model model){
		List<Object[]> companies =  companyRepository.getTop10Company();
		model.addAttribute("companies", companies);
		return "statistic";
	}
	
}
