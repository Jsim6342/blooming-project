package com.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDAO {

	//전역변수 선언
	//conn의 경우 static변수로 선언
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;
		
	Connect dao = new Connect();
	
	//예약 하기
		public int reserve_insert(String nickname, String res_date, String consultant) {
			
			
			try {
				
				//DB연결 기능
				dao.getConn();
				
				String sql = "insert into reservation values(res_seq.nextval,?,?,?)";
				
				pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
				
				pst.setString(1, nickname);
				pst.setString(2, res_date);
				pst.setString(3, consultant);
				
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
