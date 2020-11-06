package com.DTO;

public class C_ProfileDTO {

	private String pro_email;
	private String pro_name;
	private String pro_date;
	private String background;
	private String introduce;
	private int max_people;
	
	
	public C_ProfileDTO(String pro_email, String pro_name, String pro_date, String background, String introduce,
			int max_people) {
		super();
		this.pro_email = pro_email;
		this.pro_name = pro_name;
		this.pro_date = pro_date;
		this.background = background;
		this.introduce = introduce;
		this.max_people = max_people;
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


	public String getPro_date() {
		return pro_date;
	}


	public void setPro_date(String pro_date) {
		this.pro_date = pro_date;
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


	public int getMax_people() {
		return max_people;
	}


	public void setMax_people(int max_people) {
		this.max_people = max_people;
	}
	
	
	
	
	
	
	
}
