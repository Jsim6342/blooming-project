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
import com.DAO.ReviewDAO;
import com.DTO.ConsultantDTO;


@WebServlet("/ProfileSignup")
public class ProfileSignup extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//한글 인코딩
		 request.setCharacterEncoding("UTF-8");
			
	     //Session영역에 값 저장
	     HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	     String con_email = (String)session.getAttribute("email");
		 
		 //프로필 작성 페이지 가져오기
		 String background = request.getParameter("background");
		 String introduce = request.getParameter("introduce");
	   	 
		 System.out.println(con_email);
		 System.out.println(background);
		 System.out.println(introduce);
		   
		 //email 값으로 name, location 값 가져오기
		 ConsultantDTO consultant = new ConsultantDTO();
		 ConsultantDAO con_dao = new ConsultantDAO();
		 consultant = con_dao.return_name_location(con_email);
		 String pro_name = consultant.getCon_name();
		 String pro_location = consultant.getLocation();
		 
		   //C_ProfileDAO 객체생성
		   C_ProfileDAO pro_dao = new C_ProfileDAO();
		   int cnt = pro_dao.profile_join(con_email, pro_name, pro_location, background, introduce); //review_post 메소드. 성공 시 1 반환
		   
		   //프로필 등록 성공 시 counsel.jsp로 이동
		   if(cnt > 0) {
		   response.sendRedirect("counsel.jsp");
		   }
		
		
	}

}
