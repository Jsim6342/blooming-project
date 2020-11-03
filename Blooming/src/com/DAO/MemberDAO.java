package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DTO.MemberDTO;

public class MemberDAO {

	//전역변수 선언
	//conn의 경우 static변수로 선언
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;
	
	Connect dao = new Connect();
	
	//회원가입기능
	public int member_join(String email, String pw, String tel, String nickname) {
		
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "insert into member values(?,?,?,?)";
			
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			
			pst.setString(1, email);
			pst.setString(2, pw);
			pst.setString(3, tel);
			pst.setString(4, nickname);
			
			cnt = pst.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		return cnt;
	}
	
	//로그인 기능
	public boolean member_login(String email, String pw) {

		boolean check = true;
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from member where email = ? and pw = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, email);
			pst.setString(2, pw);
			
			rs = pst.executeQuery();
			
			if(rs.next()) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
				check = true;
			}else {
				check = false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		
		return check;
	}

}
