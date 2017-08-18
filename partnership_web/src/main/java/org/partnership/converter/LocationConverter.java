package org.partnership.converter;

import java.beans.PropertyEditorSupport;

import org.partnership.location.model.Location;

public class LocationConverter extends PropertyEditorSupport{
	@Override
    public void setAsText(String id) 
    {
    	Location location = null;
    	
    	location = new Location(Integer.parseInt(id), "name");
    	
    	this.setValue(location);
    }
}
