package org.partnership.converter;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomDateConverter extends PropertyEditorSupport {
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Date date = null;
		SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
		if(!text.isEmpty()){
			try {
				date = sf.parse(text);
			} catch (ParseException e) {
				date = null;
				e.printStackTrace();
			}
		}
		this.setValue(date);
		
	}
	
	@Override
	public String getAsText() {
		if(super.getAsText() != null){
			Date date = null;
			try {
				SimpleDateFormat sf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
				date = sf.parse(super.getAsText());
				return new SimpleDateFormat("dd/MM/yyyy").format(date);
				} catch (ParseException e) {
					date = null;
				}
			try {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				date = sf.parse(super.getAsText());
				return new SimpleDateFormat("dd/MM/yyyy").format(date);
				} catch (ParseException e) {
					date = null;
				}
			return "";
		}else{
			return null;
		}
	}
}
