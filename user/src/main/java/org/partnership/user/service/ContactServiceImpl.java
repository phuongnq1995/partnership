package org.partnership.user.service;

import java.util.Date;
import java.util.List;

import org.partnership.user.model.Contact;
import org.partnership.user.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ContactServiceImpl implements ContactService{
	
	@Autowired
	ContactRepository contactRepository;
	
	@Transactional
	public String saveContact(Contact contact){
		contact.setSendTime(new Date());
		contactRepository.save(contact);
		return "Send success !";
	}

	public long countCountactByNotSeen(long userId, int i) {
		return contactRepository.countByUserReceiveAndStatus(userId, i);
	}

	public List<Object[]> findAllInbox(long userId) {
		return contactRepository.findContactsByUserReceiveAndNotDeleted(userId);
	}
	
	public long countByNotDeleted(long userId){
		return contactRepository.countByUserReceiveAndStatusNotDeled(userId);
	}

	public Object[] findContactById(long contactId) {
		return contactRepository.findContactById(contactId);
	}

	public Contact findOne(long id) {
		return contactRepository.findOne(id);
	}
	
}
