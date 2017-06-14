package org.partnership.converter;

import java.beans.PropertyEditorSupport;

import org.partnership.category.model.Category;

public class CategoryConverter extends PropertyEditorSupport{

	@Override
    public void setAsText(String id) 
    {
    	Category category = null;
    	if(!id.isEmpty()){
    		category = new Category(Integer.parseInt(id), "name");
    	}
    	this.setValue(category);
    }
}
