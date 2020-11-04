package com.DTO;

public class ConsultantDTO {
	private String con_email;
	private String con_pw;
	private String con_name;
	private String con_tel;
	private String license;
	private String location;
	
	
	
	public ConsultantDTO() {
		super();
	}

	public ConsultantDTO(String con_email, String con_pw, String con_name, String con_tel, String license,
			String location) {
		super();
		this.con_email = con_email;
		this.con_pw = con_pw;
		this.con_name = con_name;
		this.con_tel = con_tel;
		this.license = license;
		this.location = location;
	}

	public String getCon_email() {
		return con_email;
	}

	public void setCon_email(String con_email) {
		this.con_email = con_email;
	}

	public String getCon_pw() {
		return con_pw;
	}

	public void setCon_pw(String con_pw) {
		this.con_pw = con_pw;
	}

	public String getCon_name() {
		return con_name;
	}

	public void setCon_name(String con_name) {
		this.con_name = con_name;
	}

	public String getCon_tel() {
		return con_tel;
	}

	public void setCon_tel(String con_tel) {
		this.con_tel = con_tel;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
