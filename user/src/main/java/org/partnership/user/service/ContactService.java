package org.partnership.user.service;

import java.util.List;

import org.partnership.user.model.Contact;

public interface ContactService {
	
	public String saveContact(Contact contact);

	public long countCountactByNotSeen(long userId,int i);

	public List<Object[]> findAllInbox(long userId);
	
	public long countByNotDeleted(long userId);
	
	public Object[] findContactById(long contactId);
	
	public Contact findOne(long id);
}
