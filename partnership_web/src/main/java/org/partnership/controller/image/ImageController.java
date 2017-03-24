package org.partnership.controller.image;

import org.partnership.company.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ImageController {
	
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping(value = "/imageCompany/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] showImage(@PathVariable long id) {
		byte[] logo = companyService.findOne(id).getLogo();
		if(logo != null)
			return logo;
		return null;
	}
}
