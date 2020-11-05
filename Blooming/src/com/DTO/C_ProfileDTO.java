package com.DTO;

public class C_ProfileDTO {

	private String pro_email;
	private String pro_name;
	private String pro_location;
	private String background;
	private String introduce;
	
	public C_ProfileDTO(String pro_email, String pro_name, String pro_location, String background, String introduce) {
		super();
		this.pro_email = pro_email;
		this.pro_name = pro_name;
		this.pro_location = pro_location;
		this.background = background;
		this.introduce = introduce;
	}

	public String getPro_email() {
		return pro_email;
	}

	public void setPro_email(String pro_email) {
		this.pro_email = pro_email;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_location() {
		return pro_location;
	}

	public void setPro_location(String pro_location) {
		this.pro_location = pro_location;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	
	
}
