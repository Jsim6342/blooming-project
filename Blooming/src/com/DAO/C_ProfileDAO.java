package com.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class C_ProfileDAO {

	//전역변수 선언
	//conn의 경우 static변수로 선언
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;
			
	Connect dao = new Connect();
	
	
	//프로필 등록 기능
	public int profile_join(String pro_email, String pro_name, String pro_location, String background, String introduce) {
		
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "insert into c_profile values(?,?,?,?,?)";
			
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			
			pst.setString(1, pro_email);
			pst.setString(2, pro_name);
			pst.setString(3, pro_location);
			pst.setString(4, background);
			pst.setString(5, introduce);
			
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
	
}
