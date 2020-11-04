package com.DTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDTO {

	private String email;
	private String pw;
	private String tel;
	private String nickname;

	public MemberDTO() {
		super();
	}
	
	public MemberDTO(String email, String pw, String tel, String nickname) {
		super();
		this.email = email;
		this.pw = pw;
		this.tel = tel;
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	

}
