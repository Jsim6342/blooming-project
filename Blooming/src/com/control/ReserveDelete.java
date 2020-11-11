package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.C_ProfileDAO;
import com.DAO.ConsultantDAO;
import com.DAO.ReservationDAO;
import com.DTO.ConsultantDTO;

@WebServlet("/ReserveDelete")
public class ReserveDelete extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글 인코딩
		 request.setCharacterEncoding("UTF-8");
		 
		 //선택한 정보 삭제에 필요한 값 받아오기
	     //Session영역에 값 저장
	     HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	     String nickname = (String)session.getAttribute("nickname");
	     String incode_pro_email = request.getParameter("pro_email");
	     String pro_email = java.net.URLDecoder.decode(incode_pro_email,"UTF-8");
	     //삭제 선택한 예약 날짜 가져오기
	     String date = request.getParameter("res_date");
	     String res_date = java.net.URLDecoder.decode(date,"UTF-8");
	     //상담현황 업데이트에 필요한 정보 추가로 가져오기
	     int max_people = Integer.parseInt(request.getParameter("max_people"));
		 

		 System.out.println(nickname);
		 System.out.println(res_date);
		   
		 //nickname 값과 일치하는 상담내역 지우기
		 ReservationDAO dao = new ReservationDAO();
		 int cnt = dao.delete_Reservation(nickname, res_date, pro_email);
		 
		 
		 

		 //예약 삭제 성공 시 booking.jsp로 이동
		 if(cnt > 0) {
		
		 //최대 예약 현황 -1
		 C_ProfileDAO pro_dao = new C_ProfileDAO();
		 int update_people = pro_dao.up_people(pro_email, max_people);
		 
		 response.sendRedirect("booking.jsp");
		 }
		
	}

}
