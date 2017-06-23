package org.partnership.container;

public class PartnershipFlash {
	
	public static final String MESSAGE = "$message$";
	
	public static final String SCRIPT = "<script>$(document).ready(function() {"+
		"$('#flash').delay(10000).fadeOut('slow');});</script>"	;
	
	public static final String SUCCESS_FLASH = "<div class='message'><br><div class='row-fluid'>"+
			"<div class='flash flash-info' id='flash'>"+
			"<strong style='color: green'>$message$</strong></div></div></div>";
	public static final String ERROR_FLASH = "<div class='message'><br><div class='row-fluid'>"+
			"<div class='flash flash-error' id='flash'>"+
			"<strong style='color: red'>$message$</strong></div></div></div>";
	
	public static String getFlashSuccess(String message){
		return SUCCESS_FLASH.replace(MESSAGE, message)+SCRIPT;
	}
	
	public static String getFlashError(String message){
		return ERROR_FLASH.replace(MESSAGE, message)+SCRIPT;
	}
}
