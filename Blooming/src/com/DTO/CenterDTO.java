package com.DTO;

public class CenterDTO {

	private String center_name;
	private String center_addr;
	private String center_tel;
	private String center_email;
	private String center_time;
	
	
	
	public CenterDTO() {
		super();
	}


	public CenterDTO(String center_name, String center_addr, String center_tel, String center_email,
			String center_time) {
		super();
		this.center_name = center_name;
		this.center_addr = center_addr;
		this.center_tel = center_tel;
		this.center_email = center_email;
		this.center_time = center_time;
	}


	public String getCenter_name() {
		return center_name;
	}


	public void setCenter_name(String center_name) {
		this.center_name = center_name;
	}


	public String getCenter_addr() {
		return center_addr;
	}


	public void setCenter_addr(String center_addr) {
		this.center_addr = center_addr;
	}


	public String getCenter_tel() {
		return center_tel;
	}


	public void setCenter_tel(String center_tel) {
		this.center_tel = center_tel;
	}


	public String getCenter_email() {
		return center_email;
	}


	public void setCenter_email(String center_email) {
		this.center_email = center_email;
	}


	public String getCenter_time() {
		return center_time;
	}


	public void setCenter_time(String center_time) {
		this.center_time = center_time;
	}

	
	
	
	
	
}
