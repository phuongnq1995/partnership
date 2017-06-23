package org.partnership.user.repository;

import java.util.List;

import org.partnership.user.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ContactRepository extends JpaRepository<Contact, Long>{

	@Query(value="Select count(id) From contact Where user_receive = ?1 And status = ?2", nativeQuery=true)
	long countByUserReceiveAndStatus(long userId, int i);
	
	@Query(value="Select count(id) From contact Where user_receive = ?1 And status != 2", nativeQuery=true)
	long countByUserReceiveAndStatusNotDeled(long userId);
	
	@Query(value="SELECT c.id,c.user_send,c.message,c.send_time,c.status,u.email FROM partnership_building.contact as c "
			+"left join partnership_building.user as u on u.id = c.user_send " 
			+"Where user_receive = ?1 And status != 2 ORDER BY status ASC, send_time DESC ", nativeQuery=true)
	List<Object[]> findContactsByUserReceiveAndNotDeleted(long userId);

	@Query(value="SELECT c.id,c.user_send,c.message,c.send_time,c.status,u.email FROM partnership_building.contact as c "
			+"left join partnership_building.user as u on u.id = c.user_send " 
			+"Where c.id = ?1 ", nativeQuery=true)
	Object[] findContactById(long contactId);
	
}
