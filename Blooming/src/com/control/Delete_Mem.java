package com.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.C_ProfileDAO;
import com.DAO.ConsultantDAO;
import com.DAO.DiaryDAO;
import com.DAO.MemberDAO;
import com.DAO.ReservationDAO;
import com.DAO.ReviewDAO;
import com.DTO.ReservationDTO;

@WebServlet("/Delete_Mem")
public class Delete_Mem extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 //한글 인코딩
	      request.setCharacterEncoding("UTF-8");
	      
	      //사용자가 입력한 값을 가져오기
	      String incode_nickname = request.getParameter("nickname");
		  String nickname = java.net.URLDecoder.decode(incode_nickname,"UTF-8");
		  
	            
		  System.out.println("입력이메일"+nickname);   
		  	  
  
		  //Member nickname과 일치하는 일기 지우기
		  DiaryDAO dao_di = new DiaryDAO();
		  int check1 = dao_di.delete_diary(nickname);
		  System.out.println("1출력시 일기 지우기 성공: "+check1);
		  
		  //Member nickname과 일치하는 예약현황 지우기
		  //지워진 예약현황 값을 가져와 예약현황에 저장된 상담사 이메일값 가져오기 -> 예약현황 +1하기 위함
		  ReservationDAO dao_res = new ReservationDAO();
		  ArrayList<ReservationDTO> reservationList = new ArrayList<>();
		  reservationList = dao_res.delete_mem_Reservation(nickname);
		  
		  //Member nickname과 일치하는 예약현황 +1
		  C_ProfileDAO dao_pro = new C_ProfileDAO();
		  if(reservationList!=null) {
		  for(int i=0; i<reservationList.size(); i++) {
			  //예약 리스트에 있는 상담사 이메일 값을 가지고 상담사  프로필에서 max_people값 가져오기
			  String pro_email = reservationList.get(i).getPro_email();
			  int max_people = dao_pro.return_maxpeople(pro_email);
			  //상담사 이메일 값과 가져온 max_people값을 가지고 예약현황 +1
			  int check2 = dao_pro.up_people(pro_email, max_people);
			  System.out.println("예약현황+1");
		  }
		  }
		  
		  //Member nickname과 일치하는 후기 지우기
		  ReviewDAO dao_rev = new ReviewDAO();
		  int check3 = dao_rev.delete_mem_review(nickname);
		  System.out.println("1출력시 후기 지우기 성공: "+check3);
		  
		  //Member table 조회 후 nickname과 일치하는 회원 값 삭제
		  MemberDAO dao_mem = new MemberDAO();
		  int check = dao_mem.delete_Member(nickname);
		  System.out.println("1출력시 멤버 지우기 성공: "+check1);
		  
		  //session값 지우기
			//세션 객체 생성
			HttpSession session = request.getSession();
			//세션 값 삭제
			session.removeAttribute("nickname");
	      
	      if(check>0) { //지우기 성공 시 메인페이지로 이동
	    	  response.sendRedirect("index.jsp"); //비밀번호 업데이트 페이지
	      }
		
	}

}
