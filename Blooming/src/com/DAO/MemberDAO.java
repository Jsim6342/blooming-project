package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DTO.MemberDTO;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;
	
	Connect dao = new Connect();
	
	public int member_join(String email, String pw, String tel, String nickname) {
		
		
		//DB연결 기능
		dao.getConn();
		
		try {
			String sql = "insert into member values(?,?,?,?)";
			
			pst = conn.prepareStatement(sql);
			
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
	
	public MemberDTO member_login(String email, String pw) {
		MemberDTO member = null;

		//DB연결 기능
		dao.getConn();
		
		
		try {
			String sql = "select * from member Where email = ? and pw = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pw);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				
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
