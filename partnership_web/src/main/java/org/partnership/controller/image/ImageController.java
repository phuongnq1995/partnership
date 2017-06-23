package org.partnership.controller.image;

import org.partnership.company.service.CompanyService;
import org.partnership.employee.service.EmployeeService;
import org.partnership.post.repository.PostApplyRepository;
import org.partnership.user.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ImageController {
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private PostApplyRepository postApplyService;
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = "/imageCompany/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] showImageCompany(@PathVariable long id) {
		byte[] logo = companyService.findOne(id).getLogo();
		if(logo != null)
			return logo;
		return null;
	}
	
	@RequestMapping(value = "/imageEmployee/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] showImageEmployee(@PathVariable long id) {
		byte[] avatar = employeeService.findOne(id).getAvatar();
		if(avatar != null)
			return avatar;
		return null;
	}
	
	@RequestMapping(value = "/cvEmployee/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public ResponseEntity<byte[]> start(@PathVariable long id) throws Exception{
		byte[] cv = employeeService.findOne(id).getCv();
		HttpHeaders headers = new HttpHeaders();
	      headers.setContentLength(cv.length);
	      headers.setContentType(MediaType.parseMediaType("application/pdf"));
	        headers.set("Content-Disposition", "inline; filename=test.pdf");
	        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	        ResponseEntity<byte[]> responseE = new ResponseEntity<byte[]>(cv, headers, HttpStatus.OK);
	        return responseE;
	}
	
	@RequestMapping(value = "/cvApply/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public ResponseEntity<byte[]> apply(@PathVariable long id) throws Exception{
		byte[] cv = postApplyService.findOne(id).getCv();
		HttpHeaders headers = new HttpHeaders();
	      headers.setContentLength(cv.length);
	      headers.setContentType(MediaType.parseMediaType("application/pdf"));
	        headers.set("Content-Disposition", "inline; filename=test.pdf");
	        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	        ResponseEntity<byte[]> responseE = new ResponseEntity<byte[]>(cv, headers, HttpStatus.OK);
	        return responseE;
	}
}
