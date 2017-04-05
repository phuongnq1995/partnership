package org.partnership.converter;

import java.beans.PropertyEditorSupport;

import org.partnership.post.model.WorkType;

public class WorkTypeConverter extends PropertyEditorSupport{
	@Override
    public void setAsText(String id) 
    {
    	WorkType category = null;
    	
    	category = new WorkType(Integer.parseInt(id), "name");
    	
    	this.setValue(category);
    }
}
