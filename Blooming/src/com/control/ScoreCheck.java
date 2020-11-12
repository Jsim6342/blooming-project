package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DiaryDAO;

@WebServlet("/ScoreCheck")
public class ScoreCheck extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	    //String nickname = (String)session.getAttribute("nickname");
		
		String nickname = request.getParameter("nickname");
		DiaryDAO dao = new DiaryDAO();
		int score_sum = dao.diaryScore(nickname);
		
		System.out.println(score_sum);
		
		response.setContentType("text/html1;charset=euc-kr"); //응답방식 지정
		PrintWriter out = response.getWriter();
		out.print(score_sum);
		
	}

}
