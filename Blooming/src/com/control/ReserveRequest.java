package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		 String res_date = request.getParameter("res_date");
		 String consultant = request.getParameter("consultant");
	   	 
		 System.out.println(nickname);
		 System.out.println(res_date);
		 System.out.println(consultant);
		   
		   
		   //ReservationDAO 객체생성
		   ReservationDAO dao = new ReservationDAO();
		   int cnt = dao.reserve_insert(nickname, res_date, consultant); //review_post 메소드. 성공 시 1 반환
		   
		   //예약 등록 성공 시 counsel.jsp로 이동
		   if(cnt > 0) {
		   response.sendRedirect("counsel.jsp");
		   }
		
		
	}

}
