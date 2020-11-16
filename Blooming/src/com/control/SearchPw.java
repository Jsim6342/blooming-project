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
import com.DTO.ConsultantDTO;
import com.DTO.MemberDTO;


@WebServlet("/SearchPw")
public class SearchPw extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 //한글 인코딩
	      request.setCharacterEncoding("UTF-8");
	      
	      //사용자가 입력한 값을 가져오기
	      String incode_email = request.getParameter("email");
		  String email = java.net.URLDecoder.decode(incode_email,"UTF-8");
	      String incode_tel = request.getParameter("tel");
		  String tel = java.net.URLDecoder.decode(incode_tel,"UTF-8");
	      
	      
		  System.out.println(email);   
	      System.out.println(tel);
	      
	      String mem_email = "";
	      String con_email = "";
	      
	      if(!tel.equals(null)&&!email.equals(null)) {
	    	//DB와 연동해서 사용자가 입력한  email,tel값에 맞는 pw값 확인
		      //member table 조회
		      MemberDAO dao_mem = new MemberDAO();
		      mem_email  = dao_mem.search_pw(email, tel);
		      
		    //consultant table 조회
		      ConsultantDAO dao_con = new ConsultantDAO();
		      con_email = dao_con.search_pw(email, tel);
	      }
	      
	      
	      if(mem_email.equals("")&&con_email.equals("")) { //일치하는 아이디가 없는 경우
	    	  System.out.println("입력 정보를 다시 확인해주세요.");
	             String check = "False";
	    		 PrintWriter out = response.getWriter();
	    		 out.print(check);
	      }else if(!mem_email.equals("")) { //회원일 경우
	    	  response.sendRedirect("updatePw.jsp?email="+mem_email); //비밀번호 업데이트 페이지
	    	  
	      }else if(!con_email.equals("")) {// 상담사일 경우
	    	  response.sendRedirect("updatePw.jsp?email="+con_email); //비밀번호 업데이트 페이지 
	      }else {
	    	  System.out.println("오류입니다.");
	      }
		
		
	}

}
