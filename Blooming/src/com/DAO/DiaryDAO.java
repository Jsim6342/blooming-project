package com.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.DTO.DiaryDTO;

public class DiaryDAO {

	//전역변수 선언
	//conn의 경우 static변수로 선언
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;
	
	Connect dao = new Connect();
	
	//일기 작성(수정필요. 시퀀스 부분, 생성자 부분과 그에 따른 매개변수 설정 부분)
	public int insertDiary(String nickname, String di_date,String di_title, String di_contents) {
		
		int cnt = 0;
		
		try {
	        
	         dao.getConn();
	         // --------------------- DB 연결(고정된 문법)
	         
	         String sql = "insert into diary values(DI_SEQ.nextval,?,?,?,?,1)"; //sysdate는 SQL문이 가지고 있는 함수
	         pst = Connect.conn.prepareStatement(sql);
	         
	         pst.setString(1, nickname);
	         pst.setString(2, di_date);
	         pst.setString(3, di_title);
	         pst.setString(4, di_contents);
	         
	         
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
	        	 double di_score = rs.getDouble(6);
 	        	 

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
