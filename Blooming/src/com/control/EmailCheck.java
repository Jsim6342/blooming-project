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


@WebServlet("/EmailCheck")
public class EmailCheck extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		ConsultantDAO daoc = new ConsultantDAO();
		
		boolean check = dao.email_check(email);
		boolean check_c = daoc.consultant_email_check(email);
		boolean check_total = false;
		
		if (check==true || check_c==true) {
			check_total = true;
		} else {
			check_total = false;
		}
		
		
			response.setContentType("text/html1;charset=euc-kr"); //응답방식 지정
			PrintWriter out = response.getWriter();
			out.print(check_total);
			
		
		
		
		
	}

}
