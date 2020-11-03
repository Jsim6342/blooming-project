package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MemberDAO;
import com.DTO.MemberDTO;

@WebServlet("/MemberSignup")
public class MemberSignup extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   //회원가입 페이지에서 값 받아오기
	   String email = request.getParameter("email");
	   String pw = request.getParameter("pw");
	   String tel = request.getParameter("tel");
	   String nickname = request.getParameter("nickname");
	   
	   //member DTO 객체생성
	   MemberDTO member = new MemberDTO(email, pw, tel, nickname);
	   
	   //member DAO 객체생성
	   MemberDAO dao = new MemberDAO();
	   int cnt = dao.member_join(member); //member_join 메소드. 성공 시 1 반환
	   
	   //회원가입 성공 시 login.html로 이동
	   if(cnt > 0) {
	   response.sendRedirect("login.html");
	   }

	}

}
