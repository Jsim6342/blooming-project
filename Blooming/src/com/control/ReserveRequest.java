package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.C_ProfileDAO;
import com.DAO.ReservationDAO;
import com.DAO.ReviewDAO;

@WebServlet("/ReserveRequest")
public class ReserveRequest extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//한글 인코딩
		 request.setCharacterEncoding("UTF-8");
			
	     //Session영역에 값 저장
	     HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	     String nickname = (String)session.getAttribute("nickname");
		 
		 //상담회기 정보 가져오기
	     String incode_date = request.getParameter("res_date");
	     String res_date = java.net.URLDecoder.decode(incode_date,"UTF-8");
	     String incode_consultant = request.getParameter("consultant");
	     String consultant = java.net.URLDecoder.decode(incode_consultant,"UTF-8");
		 
		 //최대 예약 인원 업데이트를 위한 정보 가져오기
	     String incode_pro_email = request.getParameter("pro_email");
	     String pro_email = java.net.URLDecoder.decode(incode_pro_email,"UTF-8");
		 //String pro_email = request.getParameter("pro_email");
	     
		 int max_people = Integer.parseInt(request.getParameter("max_people"));
	   	 
		 System.out.println(nickname);
		 System.out.println(res_date);
		 System.out.println(consultant);
		 System.out.println(max_people);
		 System.out.println(pro_email);
		   
		   //ReservationDAO 객체생성
		   ReservationDAO res_dao = new ReservationDAO();
		   int cnt = res_dao.reserve_insert(nickname, res_date, consultant, pro_email); //review_post 메소드. 성공 시 1 반환
		   
		   //예약 등록 성공 시
		   if(cnt > 0) {
		
		   //최대 예약 현황 -1
		   C_ProfileDAO pro_dao = new C_ProfileDAO();
		   int update_people = pro_dao.down_people(pro_email, max_people);
			
		   
//		   //서버에서 html로 카운트 값 전달
//		   response.setContentType("text/html;charset=utf-8"); //응답방식 지정
//		   PrintWriter out = response.getWriter();
//		   out.print(update_people);
		   response.sendRedirect("counsel.jsp");
		   
		   }
		
		
	}

}
