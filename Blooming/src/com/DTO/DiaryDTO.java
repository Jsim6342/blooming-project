package com.DTO;

public class DiaryDTO {

	private int di_num;
	private String nickname;
	private String di_date;
	private String di_title;
	private String di_contents;
	private double di_score;
	
	public DiaryDTO(int di_num, String nickname, String di_date, String di_title, String di_contents, double di_score) {
		super();
		this.di_num = di_num;
		this.nickname = nickname;
		this.di_date = di_date;
		this.di_title = di_title;
		this.di_contents = di_contents;
		this.di_score = di_score;
	}

	public int getDi_num() {
		return di_num;
	}

	public void setDi_num(int di_num) {
		this.di_num = di_num;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getDi_date() {
		return di_date;
	}

	public void setDi_date(String di_date) {
		this.di_date = di_date;
	}

	public String getDi_title() {
		return di_title;
	}

	public void setDi_title(String di_title) {
		this.di_title = di_title;
	}

	public String getDi_contents() {
		return di_contents;
	}

	public void setDi_contents(String di_contents) {
		this.di_contents = di_contents;
	}

	public double getDi_score() {
		return di_score;
	}

	public void setDi_score(double di_score) {
		this.di_score = di_score;
	}
	
	
	
	
	
}
