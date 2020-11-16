package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DTO.MemberDTO;
import com.DTO.ReservationDTO;

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
	public MemberDTO member_login(String email, String pw) {
		
		
		MemberDTO member = new MemberDTO();
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from member where email = ? and pw = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, email);
			pst.setString(2, pw);
			
			rs = pst.executeQuery();
			
			if(rs.next()) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
				member = new MemberDTO(rs.getNString(1), rs.getNString(2), rs.getNString(3), rs.getNString(4));
			}else {
				member = null;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		
		return member;
	}
	
	//닉네임에 맞는 회원 정보 출력
	public MemberDTO return_member(String nickname) {
		
		MemberDTO member = null;
		
		
		try {
			
			dao.getConn();
			
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "select * from member where nickname=?";
	         pst = Connect.conn.prepareStatement(sql);
	         
	         pst.setString(1, nickname);
	         
	         // --------------------- DB에 SQL문 명령준비
	         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
	         // --------------------- SQL문 실행/ 실행 후 처리
	         
	         if(rs.next()) {
	        	 
	        	//전체 맴버 데이터를 출력
	        	 String nicknames = rs.getString(1);
	        	 String email = rs.getString(2);
	        	 String pw = rs.getString(3);
	        	 String tel = rs.getString(4);

 	        	 //MemberDTO 객체를 1개씩 DB에서 받은 후, ArrayList인 reviewList에 저장
	        	 member = new MemberDTO(nicknames, email, pw, tel);
	        	 
	         
	         }
	         
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return member;
	}

	public boolean email_check(String email) {
		
		
		boolean check = false;
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from member where email = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, email);
			
			
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


	public boolean nickname_check(String nickname) {
		
		
		boolean check = false;
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from member where nickname = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, nickname);
			
			
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

	//아이디 찾기 기능
	public MemberDTO search_email(String tel) {
		
		MemberDTO member = new MemberDTO();
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from member where tel = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, tel);
			
			
			rs = pst.executeQuery();
			
			if(rs.next()) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
				//전체 맴버 데이터를 출력
	        	 String nicknames = rs.getString(1);
	        	 String email = rs.getString(2);
	        	 String pw = rs.getString(3);
	        	 String get_tel = rs.getString(4);
	        	 
	        	 member = new MemberDTO(nicknames, email, pw, get_tel); 
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		
		return member;
	}
	
	
	//비밀번호 찾기 기능
	public MemberDTO search_pw(String email, String tel) {
		
		MemberDTO member = new MemberDTO();
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from member where email = ? and tel = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, email);
			pst.setString(2, tel);
			
			
			rs = pst.executeQuery();
			
			if(rs.next()) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
				//전체 맴버 데이터를 출력
	        	 String nicknames = rs.getString(1);
	        	 String get_email = rs.getString(2);
	        	 String pw = rs.getString(3);
	        	 String get_tel = rs.getString(4);
	        	 
	        	 member = new MemberDTO(nicknames, get_email, pw, get_tel); 
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		
		return member;
	}
	
}
