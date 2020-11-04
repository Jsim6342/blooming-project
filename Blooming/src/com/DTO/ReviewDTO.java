package com.DTO;

public class ReviewDTO {

	private int rev_num;
	private String nickname;
	private String rev_title;
	private String rev_contents;
	
	
	
	
	public ReviewDTO() {
		super();
	}


	public ReviewDTO(int rev_num, String nickname, String rev_title, String rev_contents) {
		super();
		this.rev_num = rev_num;
		this.nickname = nickname;
		this.rev_title = rev_title;
		this.rev_contents = rev_contents;
	}


	public int getRev_num() {
		return rev_num;
	}


	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getRev_title() {
		return rev_title;
	}


	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}


	public String getRev_contents() {
		return rev_contents;
	}


	public void setRev_contents(String rev_contents) {
		this.rev_contents = rev_contents;
	}
	
	
	
}
