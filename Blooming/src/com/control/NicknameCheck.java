package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MemberDAO;

@WebServlet("/NicknameCheck")
public class NicknameCheck extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nickname = request.getParameter("nickname");
		
		MemberDAO dao = new MemberDAO();
		boolean check = dao.nickname_check(nickname);
		
		response.setContentType("text/html1;charset=euc-kr"); //응답방식 지정
		PrintWriter out = response.getWriter();
		out.print(check);
	}

}
