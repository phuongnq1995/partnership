package org.partnership.company.service;

import java.io.IOException;
import java.util.List;

import org.partnership.company.model.Company;
import org.partnership.company.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
			company.setAddress(company.getAddress()+" - "+location);
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

}
