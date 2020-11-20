package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ConsultantDAO;
import com.DAO.MemberDAO;


@WebServlet("/UpdatePw")
public class UpdatePw extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  //한글 인코딩
	      request.setCharacterEncoding("UTF-8");
	      
	      //사용자가 입력한 값을 가져오기
	      String incode_email = request.getParameter("email");
		  String email = java.net.URLDecoder.decode(incode_email,"UTF-8");
	      String incode_pw = request.getParameter("pw");
		  String pw = java.net.URLDecoder.decode(incode_pw,"UTF-8");
	      
	      
		  System.out.println("입력이메일"+email);   
	      System.out.println("변경비번"+pw);
	      
	      int mem_cnt = 0;
	      int con_cnt = 0;
	      
	      //consultant table 조회
		  MemberDAO dao_mem = new MemberDAO();
		  mem_cnt  = dao_mem.update_pw(email, pw);
		      
		  //consultant table 조회
		  ConsultantDAO dao_con = new ConsultantDAO();
		  con_cnt = dao_con.update_pw(email, pw);

	      
	      if(mem_cnt>0||con_cnt>0) { //둘 중 업데이트 성공 시
	    	  response.sendRedirect("login.html"); //비밀번호 업데이트 페이지
	      }
		
		
	}

}
