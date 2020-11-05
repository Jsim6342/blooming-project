package com.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.DTO.ReviewDTO;

public class ReviewDAO {

	//전역변수 선언
	//conn의 경우 static변수로 선언
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;
		
	Connect dao = new Connect();
	
	//후기 작성
	public int review_post(String nickname, String rev_title, String rev_contents) {
		
		
		try {
			
			//DB연결 기능
			dao.getConn();
			
			String sql = "insert into review values(rev_seq.nextval,?,?,?)";
			
			pst = Connect.conn.prepareStatement(sql); //static변수 Connect.conn 사용
			
			pst.setString(1, nickname);
			pst.setString(2, rev_title);
			pst.setString(3, rev_contents);
			
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
	
	
	//후기 게시판 출력
		public ArrayList<ReviewDTO> showReview() {
			
			ReviewDTO review = null;
			ArrayList<ReviewDTO> reviewList = new ArrayList<>();
			
			try {
				
				dao.getConn();
				
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "select * from review";
		         pst = Connect.conn.prepareStatement(sql);
		         // --------------------- DB에 SQL문 명령준비
		         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
		         // --------------------- SQL문 실행/ 실행 후 처리
		         
		         while(rs.next()) {
		        	 
		        	//전체 후기 데이터를 출력
		        	 int rev_num = rs.getInt(1);
		        	 String nickname = rs.getString(2);
		        	 String rev_title = rs.getString(3);
		        	 String rev_contents = rs.getString(4);
		        	 

	 	        	 //ReviewDTO 객체를 1개씩 DB에서 받은 후, ArrayList인 reviewList에 저장
		        	 review = new ReviewDTO(rev_num, nickname, rev_title, rev_contents);
	 	        	 reviewList.add(review);
		         
		         }
		         
			} catch (Exception e) {
				e.printStackTrace();
			}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
				dao.close();
			}
			return reviewList;
		}
	
}
