package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Connect {

	//주로 많이 전역적으로 사용하는 것들을 멤버변수로 빼놓는다. 
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		//DB연동 메소드
		public void getConn() {
			try {
				
				 Class.forName("oracle.jdbc.driver.OracleDriver");
		         
		         String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		         String dbid = "hr";
		         String dbpw = "hr";
		         conn = DriverManager.getConnection(url, dbid, dbpw);
		         
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//DB종료
		//rs, psmt, conn순으로 연결을 끊어준다.(연결순서 conn, psmt, rs의 역순)
		public void close() {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(psmt!=null) {
					psmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	
}
