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
import com.DAO.MemberDAO;
import com.DAO.ReservationDAO;

@WebServlet("/Delete_Con")
public class Delete_Con extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 //한글 인코딩
	      request.setCharacterEncoding("UTF-8");
	      
	      //사용자가 입력한 값을 가져오기
	      String incode_email = request.getParameter("email");
		  String email = java.net.URLDecoder.decode(incode_email,"UTF-8");
	            
		  System.out.println("입력이메일"+email);
		  
		  
		  
		  //email과 일치하는 상담내역 삭제
		  ReservationDAO dao_res = new ReservationDAO();
		  int check1 = dao_res.complete_Reservation(email);
		  System.out.println("상담내역 삭제시 1 출력: "+check1);
				  
		  //email과 일치하는 상담프로필 삭제
		  C_ProfileDAO dao_pro = new C_ProfileDAO();
		  int check2 = dao_pro.profile_complete(email);
		  System.out.println("상담 프로필 삭제시 1 출력: "+check2);
		  
		  //consultant table 조회 후 email과 일치하는 회원 값 삭제
		  ConsultantDAO dao_con = new ConsultantDAO();
		  int check3 = dao_con.delete_Consultant(email);
		  System.out.println("상담사 회원 삭제시 1출력: "+check3);
		  
		  //session값 지우기
			//세션 객체 생성
			HttpSession session = request.getSession();
			//세션 값 삭제
			session.removeAttribute("email");

	      
	      if(check3>0) { //둘 중 업데이트 성공 시
	    	  response.sendRedirect("index.jsp"); //비밀번호 업데이트 페이지
	      }
		
		
	}

}
