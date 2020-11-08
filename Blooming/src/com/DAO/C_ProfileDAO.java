package com.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DTO.C_ProfileDTO;
import com.DTO.ReservationDTO;
import com.DTO.ReviewDTO;

public class C_ProfileDAO {

	//전역변수 선언
	//conn의 경우 static변수로 선언
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;
			
	Connect dao = new Connect();
	
	
	//프로필 등록 기능
	public int profile_join(String pro_email, String pro_name, String pro_location, String background, String introduce, int max_people) {
		
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "insert into c_profile values(?,?,?,?,?,?)";
			
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			
			pst.setString(1, pro_email);
			pst.setString(2, pro_name);
			pst.setString(3, pro_location);
			pst.setString(4, background);
			pst.setString(5, introduce);
			pst.setInt(6, max_people);
			
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
	
	//상담사 프로필 출력
	public ArrayList<C_ProfileDTO> showProfile() {
		
		C_ProfileDTO profile = null;
		ArrayList<C_ProfileDTO> profileList = new ArrayList<>();
		
		try {
			
			dao.getConn();
			
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "select * from c_profile";
	         pst = Connect.conn.prepareStatement(sql);
	         // --------------------- DB에 SQL문 명령준비
	         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
	         // --------------------- SQL문 실행/ 실행 후 처리
	         
	         while(rs.next()) {
	        	 
	        	//전체 후기 데이터를 출력
	        	 String pro_email = rs.getString(1);
	        	 String pro_name = rs.getString(2);
	        	 String pro_date = rs.getString(3);
	        	 String background = rs.getString(4);
	        	 String introduce = rs.getString(5);
	        	 int max_people = rs.getInt(6);

 	        	 //ReviewDTO 객체를 1개씩 DB에서 받은 후, ArrayList인 reviewList에 저장
	        	 profile = new C_ProfileDTO(pro_email, pro_name, pro_date, background, introduce, max_people);
	        	 profileList.add(profile);
	         
	         }
	         
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return profileList;
	}
	
	//최대인원 -1 기능(상담예약시)
	public int down_people(String pro_email, int max_people) {

		int update = max_people-1;
		
		try {
			
			 dao.getConn();
			 
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "update c_profile set max_people=? where pro_email = ?"; 
	         pst = Connect.conn.prepareStatement(sql);
	         
	         pst.setInt(1, update);
	         pst.setString(2, pro_email);

	         cnt = pst.executeUpdate(); //성공 시 1을 반환
	      // --------------------- SQL문 실행/ 실행 후 처리
	         
	      // --------------------- DB에 SQL문 명령준비	
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return update;
	}
	
	//최대인원 +1 기능(상담예약시)
		public int up_people(String pro_email, int max_people) {

			int update = max_people+1;
			
			try {
				
				 dao.getConn();
				 
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "update c_profile set max_people=? where pro_email = ?"; 
		         pst = Connect.conn.prepareStatement(sql);
		         
		         pst.setInt(1, update);
		         pst.setString(2, pro_email);

		         cnt = pst.executeUpdate(); //성공 시 1을 반환
		      // --------------------- SQL문 실행/ 실행 후 처리
		         
		      // --------------------- DB에 SQL문 명령준비	
			} catch (Exception e) {
				e.printStackTrace();
			}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
				dao.close();
			}
			return update;
		}
	
	//예약한 상담사 프로필 출력
	public ArrayList<C_ProfileDTO> res_ShowProfile(ArrayList<ReservationDTO> reservationList) {
		
		C_ProfileDTO profile = null;
		ArrayList<C_ProfileDTO> profileList = new ArrayList<>();
		
		    try {
			
		    	
			dao.getConn();
			
			for(int i = 0;i<reservationList.size();i++) {
			String consultant = reservationList.get(i).getConsultant();
			
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "select * from c_profile where pro_name = ?";
	         pst = Connect.conn.prepareStatement(sql);
	         
	         pst.setString(1, consultant);
	         // --------------------- DB에 SQL문 명령준비
	         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
	         // --------------------- SQL문 실행/ 실행 후 처리
	         
	         if(rs.next()) {
	        	 
	        	//전체 후기 데이터를 출력
	        	 String pro_email = rs.getString(1);
	        	 String pro_name = rs.getString(2);
	        	 String pro_date = rs.getString(3);
	        	 String background = rs.getString(4);
	        	 String introduce = rs.getString(5);
	        	 int max_people = rs.getInt(6);

 	        	 //ReviewDTO 객체를 1개씩 DB에서 받은 후, ArrayList인 reviewList에 저장
	        	 profile = new C_ProfileDTO(pro_email, pro_name, pro_date, background, introduce, max_people);
	        	 profileList.add(profile);
	         
	         }
		    }
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return profileList;
		
	}
	
	
}
