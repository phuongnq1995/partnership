package org.partnership.user.service;

import org.partnership.user.model.Role;
import org.partnership.user.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	RoleRepository roleRepository;

	public Role findByName(String role) {
		return roleRepository.findByName(role);
	}
}
