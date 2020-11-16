package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DTO.ConsultantDTO;
import com.DTO.MemberDTO;

public class ConsultantDAO {

	//주로 많이 전역적으로 사용하는 것들을 멤버변수로 빼놓는다. 
		PreparedStatement pst = null;
		ResultSet rs = null;
		int cnt = 0;
	
	Connect dao = new Connect();
	
	//상담사 가입
	public int consultant_join(String con_email, String con_pw, String con_name, String con_tel, String license, String location) {
		int cnt = 0;
		
		try { 
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "insert into consultant values(?,?,?,?,?,?)";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, con_email);
			pst.setString(2, con_pw);
			pst.setString(3, con_name);
			pst.setString(4, con_tel);
			pst.setString(5, license);
			pst.setString(6, location);
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

	//상담사 로그인 기능
	public ConsultantDTO consultant_login(String con_email, String con_pw) {
		
		ConsultantDTO consultant = new ConsultantDTO();
		
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from consultant where con_email = ? and con_pw = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, con_email);
			pst.setString(2, con_pw);
			
			rs = pst.executeQuery();
			
			if(rs.next()) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
				consultant = new ConsultantDTO(rs.getNString(1), rs.getNString(2), rs.getNString(3), rs.getNString(4), rs.getNString(5),rs.getNString(6));
	         }else {
	        	consultant = null;
	         }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		return consultant;
	}
	
	//상담사 객체 반환 기능(상담사 프로필 등록에 사용)+my page 출력에 사용
	public ConsultantDTO return_name_location(String con_email) {
		
		ConsultantDTO consultant = new ConsultantDTO();
		
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from consultant where con_email = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, con_email);
			
			rs = pst.executeQuery();
			
			if(rs.next()) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
				consultant = new ConsultantDTO(rs.getNString(1), rs.getNString(2), rs.getNString(3), rs.getNString(4), rs.getNString(5),rs.getNString(6));
	         }else {
	        	consultant = null;
	         }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		return consultant;
	}

	public boolean consultant_email_check(String email) {
		
		
		boolean check = false;
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from consultant where con_email = ?";
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
	
	//상담사 이메일 찾기
	public String search_email(String tel) {
		
		String email = "";
		

		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from consultant where con_tel = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, tel);
			
			
			rs = pst.executeQuery();
			
			if(rs.next()) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
				
				email = rs.getString(1);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		
		return email;
	}
	
	//상담사 비밀번호 찾기
	public String search_pw(String email, String tel) {
		
		
		String get_email = "";
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "select * from consultant where con_email = ? and con_tel = ?";
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			pst.setString(1, email);
			pst.setString(2, tel);
			
			
			rs = pst.executeQuery();
			
			if(rs.next()) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
				get_email = rs.getString(1);
     
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//DB연결 종료
			dao.close();
		}
		
		return get_email;
	}
	
	//비밀번호 업데이트
	public int update_pw(String email, String pw) {

		
		try {
			
			 dao.getConn();
			 
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "update consultant set con_pw=? where con_email = ?"; 
	         pst = Connect.conn.prepareStatement(sql);
	         
	         pst.setString(1, pw);
	         pst.setString(2, email);

	         cnt = pst.executeUpdate(); //성공 시 1을 반환
	      // --------------------- SQL문 실행/ 실행 후 처리
	         
	      // --------------------- DB에 SQL문 명령준비	
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return cnt;
	}
	
	
	
}
