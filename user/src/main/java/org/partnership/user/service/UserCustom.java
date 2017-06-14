package org.partnership.user.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class UserCustom extends org.springframework.security.core.userdetails.User{

	private static final long serialVersionUID = 1L;
	
	private long id;
	
	public UserCustom(long id, String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public UserCustom(String username, String password,
			Collection<? extends GrantedAuthority> authorities, long id) {
		super(username, password, authorities);
		this.id = id;
	}
	
	
}
