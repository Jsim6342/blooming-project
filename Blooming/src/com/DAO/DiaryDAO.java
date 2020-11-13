package com.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.DTO.DiaryDTO;
import com.DTO.ReviewDTO;

public class DiaryDAO {

	//전역변수 선언
	//conn의 경우 static변수로 선언
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;
	
	Connect dao = new Connect();
	
	//일기 작성(수정필요. 시퀀스 부분, 생성자 부분과 그에 따른 매개변수 설정 부분)
	public int insertDiary(String nickname, String di_date,String di_title, String di_contents, int di_score) {
		
		int cnt = 0;
		
		try {
	        
	         dao.getConn();
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "insert into diary values(DI_SEQ.nextval,?,TO_DATE(?,'YY-MM-DD'),?,?,?)"; //sysdate는 SQL문이 가지고 있는 함수

	         pst = Connect.conn.prepareStatement(sql);
	         
	         pst.setString(1, nickname);
	         pst.setString(2, di_date);
	         pst.setString(3, di_title);
	         pst.setString(4, di_contents);
	         pst.setInt(5, di_score);
	         
	         
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
	
	//일기 목록 출력
	public ArrayList<DiaryDTO> show_diaryList(String nickname, String strat_date, String end_date) {
		
		DiaryDTO diary = null;
		ArrayList<DiaryDTO> diaryList = new ArrayList<>();
		
		try {
			
			dao.getConn();
			
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "select * from diary where nickname=? and di_date between ? and ?";
	         pst = Connect.conn.prepareStatement(sql);
	         pst.setString(1, nickname);
	         pst.setString(2, strat_date);
	         pst.setString(3, end_date);
	         
	        
	         // --------------------- DB에 SQL문 명령준비
	         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
	         // --------------------- SQL문 실행/ 실행 후 처리
	         
	         while(rs.next()) {
	        	 
	        	//전체 일기 데이터를 출력
	        	 int di_num = rs.getInt(1);
	        	 String di_nickname = rs.getString(2);
	        	 String di_date = rs.getString(3);
	        	 String di_title = rs.getString(4);
	        	 String di_contents = rs.getString(5);
	        	 int di_score = rs.getInt(6);
 	        	 

 	        	 //VO(DTO): 모듈끼리 데이터를 송/수신할 때 사용하는 새로운 데이터 타입
	        	 diary = new DiaryDTO(di_num, di_nickname, di_date, di_title, di_contents,di_score);
	        	 diaryList.add(diary);
	         
	         }
	         
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return diaryList;
	}
	
	//해당 일기 1개의 값만 가져오는 함수(일기 클릭하면 일기 보여주는 페이지 들어가는거)
	public DiaryDTO showDiary(int di_num) {
		
		DiaryDTO diaryshow = null;
		
		try {
			
			dao.getConn();
			
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "select di_num,nickname,TO_CHAR(di_date,'YYYY-MM-DD'),di_title,di_contents,di_score from diary where di_num = ?";
	         pst = Connect.conn.prepareStatement(sql);
	         
	         pst.setInt(1, di_num);
	         
	         // --------------------- DB에 SQL문 명령준비
	         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
	         // --------------------- SQL문 실행/ 실행 후 처리
	         
	         if(rs.next()) {
	        	 
	        	//전체 후기 데이터를 출력
	        	 int di_nums = rs.getInt(1);
	        	 String nickname = rs.getString(2);
	        	 String di_date = rs.getString(3);
	        	 String di_title = rs.getString(4);
	        	 String di_contents = rs.getString(5);
	        	 int di_score = rs.getInt(6);
	        	 

 	        	 //ReviewDTO 객체를 1개씩 DB에서 받은 후, ArrayList인 reviewList에 저장
	        	 diaryshow = new DiaryDTO(di_nums, nickname, di_date, di_title, di_contents, di_score);
 	        	 
	         }
	         
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return diaryshow;
	}

	//일기 긍/부정 점수를 합하는 함수
	public int diaryScore(String nickname) {
		
		
		int sum = 0; // 긍/부정 점수의 합계를 더할 변수
		
		try {
			
			dao.getConn();
			
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "select * from diary where nickname=?";
	         pst = Connect.conn.prepareStatement(sql);
	         pst.setString(1, nickname);
	         
	        
	         // --------------------- DB에 SQL문 명령준비
	         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
	         // --------------------- SQL문 실행/ 실행 후 처리
	         
	         while(rs.next()) {
	        	 
	        	//
	        	 
	        	 int di_score = rs.getInt(6);
	        	 
	        	 if(sum==-1 && di_score < 0) {
	        		 sum = -1;
	        	 }else {
	        	 sum = sum + di_score;
	        	 }

	         }
	         
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return sum;
	}

	//일기 그래프를 그리기 위한 함수
	public ArrayList<DiaryDTO> showDiaryDateScore(String nickname) {
		
		DiaryDTO diary = null;
		ArrayList<DiaryDTO> diaryList = new ArrayList<>();
		
		try {
			
			dao.getConn();
			
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "select di_num,nickname,TO_CHAR(di_date,'YY-MM-DD'),di_title,di_contents,di_score from diary where nickname=? order by di_date";
	         pst = Connect.conn.prepareStatement(sql);
	         pst.setString(1, nickname);
	         
	        
	         // --------------------- DB에 SQL문 명령준비
	         rs = pst.executeQuery(); //select문은 DB에서 data를 반환받기 때문에 excuteQuery함수를 사용
	         // --------------------- SQL문 실행/ 실행 후 처리
	         
	         while(rs.next()) {
	        	 
	        	//전체 일기 데이터를 출력
	        	 int di_num = rs.getInt(1);
	        	 String di_nickname = rs.getString(2);
	        	 String di_date = rs.getString(3);
	        	 String di_title = rs.getString(4);
	        	 String di_contents = rs.getString(5);
	        	 int di_score = rs.getInt(6);
 	        	 

 	        	 //VO(DTO): 모듈끼리 데이터를 송/수신할 때 사용하는 새로운 데이터 타입
	        	 diary = new DiaryDTO(di_num, di_nickname, di_date, di_title, di_contents,di_score);
	        	 diaryList.add(diary);
	         
	         }
	         
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally는 정상실행이 되도, 오류가 나도 무조건 실행되는 부분.
			dao.close();
		}
		return diaryList;
	}
}

