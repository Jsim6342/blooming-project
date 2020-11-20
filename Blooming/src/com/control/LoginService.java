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
import com.google.gson.Gson;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      //한글 인코딩
      request.setCharacterEncoding("UTF-8");
      
      //사용자가 입력한 값을 가져오기
      String incode_email = request.getParameter("email");
	  String email = java.net.URLDecoder.decode(incode_email,"UTF-8");
	  String incode_pw = request.getParameter("pw");
	  String pw = java.net.URLDecoder.decode(incode_pw,"UTF-8");
      
            
      //출력확인
     System.out.println(email);
      System.out.println(pw);
            
      //DB와 연동해서 사용자가 입력한 email값과 pw값 확인
      //member table 조회
      MemberDTO member = new MemberDTO();
      MemberDAO dao_mem = new MemberDAO();
      member = dao_mem.member_login(email, pw);
      //consultant table 조회
      ConsultantDTO consultant = new ConsultantDTO();
      ConsultantDAO dao_con = new ConsultantDAO();
      consultant = dao_con.consultant_login(email, pw);
      
      
      //로그인 성공/실패 했을 때 페이지 이동
      if(consultant != null && !consultant.equals(null)) { //상담사일때 로그인
                         
      //Session영역에 값 저장
       HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
       session.setAttribute("email", consultant.getCon_email()); //Session영역에 email이름표로 로그인에 성공한 사람의 email값 저장
                     
      //메인으로 이동        
       response.sendRedirect("index.jsp");
       
       }else if(member != null && !member.equals(null)){ //회원일때 로그인
          
      //Session영역에 값 저장
      HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
      session.setAttribute("nickname", member.getNickname()); //Session영역에 email이름표로 로그인에 성공한 사람의 email값 저장
         
      //메인으로 이동
      response.sendRedirect("index.jsp");
          
    
       }else { //로그인 실패
             System.out.println("이메일과 비밀번호를 확인해주세요.");
             String check = "False";
    		 PrintWriter out = response.getWriter();
    		 out.print(check);
       }
      
   
                  
               
            
            
            
            
            
      
   }

}