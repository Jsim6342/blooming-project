package com.control;

import java.io.IOException;
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
	      String tel = request.getParameter("tel");
	      String email = request.getParameter("email");
	      
	            
	      System.out.println(tel);
	      System.out.println(email);
	      
	      MemberDTO member = new MemberDTO();
	      ConsultantDTO consultant = new ConsultantDTO();
	      
	      
	      if(!tel.equals(null)&&email.equals(null)) { //tel을 통해 아이디 찾기 기능
	    	//DB와 연동해서 사용자가 입력한 tel값에 맞는 email값 확인
		      //member table 조회
		      MemberDAO dao_mem = new MemberDAO();
		      member = dao_mem.search_email(tel);
		      
		    //consultant table 조회
		      ConsultantDAO dao_con = new ConsultantDAO();
		      consultant = dao_con.search_email(tel);
		      
		      
	      }
	      
	      
	      if(!tel.equals(null)&&!email.equals(null)) {
	    	//DB와 연동해서 사용자가 입력한  email,tel값에 맞는 pw값 확인
		      //member table 조회
		      MemberDAO dao_mem = new MemberDAO();
		      member = dao_mem.search_pw(email, tel);
		      
		    //consultant table 조회
		      ConsultantDAO dao_con = new ConsultantDAO();
		      consultant = dao_con.search_pw(email, tel);
	      }
	      
	      
	      if(member==null&&consultant==null) { //일치하는 아이디가 없는 경우
	    	  
	      }else if(member!=null) { //회원일 경우
	    	  if(email.equals(null)) { //아이디 찾기
	    		  
	    	  }else { //비밀번호 찾기
	    		  
	    	  }
	      }else if(consultant!=null) {// 상담사일 경우
	    	  
	      }else {
	    	  if(email.equals(null)) { //아이디 찾기
	    		  
	    	  }else { //비밀번호 찾기
	    		  
	    	  }  
	      }
	      
	      
	      
	      //로그인 성공/실패 했을 때 페이지 이동
	      if(consultant != null && !consultant.equals(null)) {
	                         
	      //Session영역에 값 저장
	       HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	       session.setAttribute("email", consultant.getCon_email()); //Session영역에 email이름표로 로그인에 성공한 사람의 email값 저장
	                     
	      //메인으로 이동        
	       response.sendRedirect("index.jsp");
	       }else if(member != null && !member.equals(null)){
	          
	      //Session영역에 값 저장
	      HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	      session.setAttribute("nickname", member.getNickname()); //Session영역에 email이름표로 로그인에 성공한 사람의 email값 저장
	         
	      //메인으로 이동
	      response.sendRedirect("index.jsp");
	          
	    
	       }else {
	             System.out.println("이메일과 비밀번호를 확인해주세요."); 
	       }
	      
	   
	                  
		
		
		
	}

}
