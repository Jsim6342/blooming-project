package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ConsultantDAO;
import com.DTO.ConsultantDTO;

@WebServlet("/ConsultantSignup")
public class ConsultantSignup extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//회원가입 페이지에서 값 받아오기
	   String con_email = request.getParameter("con_email");
	   String con_pw = request.getParameter("con_pw");
	   String con_name = request.getParameter("con_name");
	   String con_tel = request.getParameter("con_tel");
	   String license = request.getParameter("license");
	   String location = request.getParameter("location");

	   //Consultant DTO 객체생성
	   ConsultantDTO consultant = new ConsultantDTO(con_email, con_pw, con_name, con_tel, license, location);
	   
	   //Consultant DAO 객체생성
	   ConsultantDAO dao = new ConsultantDAO();
	   int cnt = dao.consultant_join(consultant);

	   //회원가입 성공 시 login.html로 이동
	   if(cnt > 0) {
	   response.sendRedirect("login.html");
	   }
		
	}

}
