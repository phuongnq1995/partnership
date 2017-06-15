package org.partnership.converter;

import java.beans.PropertyEditorSupport;

import org.partnership.user.model.User;

public class UserConverter extends PropertyEditorSupport{
	@Override
	public void setAsText(String id) throws IllegalArgumentException {
		User user = null;
		if(!id.isEmpty()){
			user = new User(Long.parseLong(id), "email@gmail.com");
		}
		this.setValue(user);
	}
}
