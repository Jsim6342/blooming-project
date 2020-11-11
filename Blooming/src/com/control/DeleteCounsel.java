package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.C_ProfileDAO;
import com.DAO.ReservationDAO;


@WebServlet("/DeleteCounsel")
public class DeleteCounsel extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글 인코딩
		 request.setCharacterEncoding("UTF-8");
			
		//선택된 상담사 프로필 이메일 값 가져오기		 
	     String incode_pro_email = request.getParameter("pro_email");
	     String pro_email = java.net.URLDecoder.decode(incode_pro_email,"UTF-8");

		 System.out.println(pro_email);
		   
		 //C_Profile에 pro_email과 일치하는 행 delete
		  C_ProfileDAO pro_dao = new C_ProfileDAO();
		  int cnt1 = pro_dao.profile_complete(pro_email);
		 
		  //Reservation에 pro_email과 일치하는 행 모두 delete
		   //ReservationDAO 객체생성
		   ReservationDAO res_dao = new ReservationDAO();
		   int cnt2 = res_dao.complete_Reservation(pro_email); //review_post 메소드. 성공 시 1 반환
		   
		   //예약 등록 성공 시
		   if(cnt1>0) {
	
			   response.sendRedirect("counsel.jsp");

		   }
		
		
		
	}

}
