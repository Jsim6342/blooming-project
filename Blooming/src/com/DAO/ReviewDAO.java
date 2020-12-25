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
		public ArrayList<ReviewDTO> showReviewList() {
			
			ReviewDTO review = null;
			ArrayList<ReviewDTO> reviewList = new ArrayList<>();
			
			try {
				
				dao.getConn();
				
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "select * from review order by rev_num desc";
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
	
		//후기 출력
		public ReviewDTO showReview(int rev_num) {
			
			ReviewDTO review = null;
			
			try {
				
				dao.getConn();
				
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "select * from review where rev_num = ?";
		         pst = Connect.conn.prepareStatement(sql);
		         
		         pst.setInt(1, rev_num);
		         
		         // --------------------- DB에 SQL문 명령준비
		         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
		         // --------------------- SQL문 실행/ 실행 후 처리
		         
		         if(rs.next()) {
		        	 
		        	//전체 후기 데이터를 출력
		        	 int rev_nums = rs.getInt(1);
		        	 String nickname = rs.getString(2);
		        	 String rev_title = rs.getString(3);
		        	 String rev_contents = rs.getString(4);
		        	 

	 	        	 //ReviewDTO 객체를 1개씩 DB에서 받은 후, ArrayList인 reviewList에 저장
		        	 review = new ReviewDTO(rev_nums, nickname, rev_title, rev_contents);
	 	        	 
		         }
		         
			} catch (Exception e) {
				e.printStackTrace();
			}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
				dao.close();
			}
			return review;
		}
		
		//후기번호와 닉네임에 해당되는 게시글일 경우 true반환.
		public boolean check_Review(int rev_num, String nickname) {
			
			boolean check = false;
			
			try {
				
				dao.getConn();
				
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "select * from review where rev_num = ? and nickname = ?";
		         pst = Connect.conn.prepareStatement(sql);
		         
		         pst.setInt(1, rev_num);
		         pst.setString(2, nickname);
		         
		         // --------------------- DB에 SQL문 명령준비
		         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
		         // --------------------- SQL문 실행/ 실행 후 처리
		         
		         if(rs.next()) {
		        	check = true;	 
		         }else {
		            check = false;
		         }
		         
			} catch (Exception e) {
				e.printStackTrace();
			}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
				dao.close();
			}
			return check;
		}
		
		//전체 리뷰 갯수 반환
		public int count_Review() {
			
			int result = 0;
			
			
			try {
				
				dao.getConn();
				
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "select count(*) from review";
		         pst = Connect.conn.prepareStatement(sql);
		         // --------------------- DB에 SQL문 명령준비
		         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
		         // --------------------- SQL문 실행/ 실행 후 처리
		         
		         if(rs.next()) {
		        	 
		        	 result = rs.getInt(1);
		         
		         }
		         
			} catch (Exception e) {
				e.printStackTrace();
			}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
				dao.close();
			}
			return result;
		}
		
		//후기 게시판 출력(페이징)
		public ArrayList<ReviewDTO> selectReviewList(int start, int pageCnt) {
			
			ReviewDTO review = null;
			ArrayList<ReviewDTO> reviewList = new ArrayList<>();
			
			try {
				
				dao.getConn();
				
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "SELECT * FROM (SELECT a.*,ROW_NUMBER() OVER(ORDER BY rev_num DESC) AS rnum FROM review a) WHERE rnum >? and rnum<=?";
		         pst = Connect.conn.prepareStatement(sql);
		         pst.setInt(1, start);
		         pst.setInt(2, pageCnt);
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
		
		
		//nickname과 일치하는 후기 지우기(회원탈퇴 시)
		public int delete_mem_review(String nickname) {
			
			
			try {
		        
		         dao.getConn();
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "delete from review where nickname=?";
		         pst = Connect.conn.prepareStatement(sql);
		         
		         pst.setString(1, nickname);

		      // --------------------- DB에 SQL문 명령준비
		         
		         cnt = pst.executeUpdate(); //성공 시 1을 반환
		      // --------------------- SQL문 실행/ 실행 후 처리
			
		        
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		 return cnt;
		}
		
		
		//후기 수정 시, 자신의 후기 출력
		public ReviewDTO showMyReview(int rev_num) {
			
			ReviewDTO review = null;
			
			try {
				
				dao.getConn();
				
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "select * from review where rev_num = ?";
		         pst = Connect.conn.prepareStatement(sql);
		         
		         pst.setInt(1, rev_num);
		         
		         // --------------------- DB에 SQL문 명령준비
		         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
		         // --------------------- SQL문 실행/ 실행 후 처리
		         
		         if(rs.next()) {
		        	 
		        	//전체 후기 데이터를 출력
		        	 int rev_nums = rs.getInt(1);
		        	 String nickname = rs.getString(2);
		        	 String rev_title = rs.getString(3);
		        	 String rev_contents = rs.getString(4);
		        	 

	 	        	 //ReviewDTO 객체를 1개씩 DB에서 받은 후, ArrayList인 reviewList에 저장
		        	 review = new ReviewDTO(rev_nums, nickname, rev_title, rev_contents);
	 	        	 
		         }
		         
			} catch (Exception e) {
				e.printStackTrace();
			}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
				dao.close();
			}
			return review;
		}
		
		//후기 수정
		public int update_review(int rev_num, String title, String content) {

			
			try {
				
				 dao.getConn();
				 
		         // --------------------- DB 연결(고정된 문법)
		         
		         String sql = "update review set rev_title=?, rev_contents=? where rev_num = ?"; 
		         pst = Connect.conn.prepareStatement(sql);
		         
		         pst.setString(1, title);
		         pst.setString(2, content);
		         pst.setInt(3, rev_num);

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
