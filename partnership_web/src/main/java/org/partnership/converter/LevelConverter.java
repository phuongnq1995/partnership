package org.partnership.converter;

import java.beans.PropertyEditorSupport;

import org.partnership.post.model.Level;


public class LevelConverter extends PropertyEditorSupport{
	@Override
    public void setAsText(String id) 
    {
    	Level category = null;
    	
    	category = new Level(Integer.parseInt(id), "name");
    	
    	this.setValue(category);
    }
}
