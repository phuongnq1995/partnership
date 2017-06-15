package org.partnership.user.repository;

import org.partnership.user.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactRepository extends JpaRepository<Contact, Long>{
	
	
	
}
