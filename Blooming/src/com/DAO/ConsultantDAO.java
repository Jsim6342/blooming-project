package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DTO.ConsultantDTO;

public class ConsultantDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	//DB연결 기능
	public void connection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";
			
			
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	//DB연결 종료
	public void close() {
		try {
			if(pst != null) {pst.close();}
			if(conn != null) {conn.close();}
			if(rs != null) {rs.close();}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int consultant_join(ConsultantDTO consultant) {
		int cnt = 0;
		connection();
		
		
		try {  
			String sql = "insert into consultant values(?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, consultant.getCon_email());
			pst.setString(2, consultant.getCon_pw());
			pst.setString(3, consultant.getCon_name());
			pst.setString(4, consultant.getCon_tel());
			pst.setString(4, consultant.getLicense());
			pst.setString(4, consultant.getLocation());
			cnt = pst.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}


	public ConsultantDTO consultant_login(String email, String pw) {
		ConsultantDTO consultant = null;
		connection();
		
		
		try {
			String sql = "select * from consultant Where email = ? and pw = ?";
			pst = conn.prepareStatement(sql);
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
			close();
		}
		return consultant;
	}
	
}
