package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DTO.ConsultantDTO;

public class ConsultantDAO {

	//주로 많이 전역적으로 사용하는 것들을 멤버변수로 빼놓는다. 
		PreparedStatement pst = null;
		ResultSet rs = null;
	
	Connect dao = new Connect();
	
	
	public int consultant_join(String email, String pw, String name, String tel, String license, String location) {
		int cnt = 0;
		
		//DB연결 기능
		dao.getConn();
		
		
		try {  
			String sql = "insert into consultant values(?,?,?,?,?,?)";
			pst = Connect.conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pw);
			pst.setString(3, name);
			pst.setString(4, tel);
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


	public ConsultantDTO consultant_login(String email, String pw) {
		
		ConsultantDTO consultant = null;
		//DB연결 기능
		dao.getConn();
		
		
		try {
			String sql = "select * from consultant Where email = ? and pw = ?";
			pst = Connect.conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pw);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				consultant = new ConsultantDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
				
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
	
}
