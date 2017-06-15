package org.partnership.user.service;

import java.util.Date;

import org.partnership.user.model.Contact;
import org.partnership.user.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

@Service
public class ContactServiceImpl implements ContactService{
	
	@Autowired
	ContactRepository contactRepository;
	
	public String saveContact(Contact contact){
		contact.setSendTime(new Date());
		contactRepository.save(contact);
		return "Save success !";
	}
	
	
}
