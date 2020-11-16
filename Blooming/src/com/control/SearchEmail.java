package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ConsultantDAO;
import com.DAO.MemberDAO;
import com.DTO.ConsultantDTO;
import com.DTO.MemberDTO;

@WebServlet("/SearchEmail")
public class SearchEmail extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	      //한글 인코딩
	      request.setCharacterEncoding("UTF-8");
	      
	      //사용자가 입력한 값을 가져오기
	      String incode_tel = request.getParameter("tel");
		  String tel = java.net.URLDecoder.decode(incode_tel,"UTF-8");
	      
	            
	      System.out.println(tel);
	      
	      
	      String email = "";
	      String con_email = "";
	      
	      //tel을 통해 아이디 찾기 기능
	      //DB와 연동해서 사용자가 입력한 tel값에 맞는 email값 확인
		  //member table 조회
		   MemberDAO dao_mem = new MemberDAO();
		   email = dao_mem.search_email(tel);
		      
		  //consultant table 조회
		   ConsultantDAO dao_con = new ConsultantDAO();
		   con_email = dao_con.search_email(tel);
		    
		   System.out.println(email);
		   System.out.println(con_email);
		   
		   if(email.equals("")&&con_email.equals("")) { //전화번호와 일치하는 아이디가 없는 경우
			   System.out.println("전화번호를 확인해주세요.");
	             String check = "False";
	    		 PrintWriter out = response.getWriter();
	    		 out.print(check);
		   }else if(!email.equals("")) { //회원일 경우   
			   response.sendRedirect("showEmail.jsp?email="+email); //아이디 출력 페이지	   
		   }else if(!con_email.equals("")) {// 상담사일 경우   
			   response.sendRedirect("showEmail.jsp?email="+con_email); //아이디 출력 페이지
		   }else {
			   System.out.println("오류입니다.");
		      }
			   
			   

	                  
		
		
		
	}

}
