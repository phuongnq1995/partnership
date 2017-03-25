package org.partnership.company.service;

import java.util.List;

import org.partnership.company.model.Company;
import org.springframework.web.multipart.MultipartFile;

public interface CompanyService {

	String newCompany(Company company, MultipartFile fileUpload, String location);

	List<Company> findAll();

	Company findOne(long id);

	String delete(long id);

}
