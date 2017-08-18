package org.partnership.user.service;

import org.partnership.user.model.Role;

public interface RoleService {
	
	Role findByName(String role);
}
