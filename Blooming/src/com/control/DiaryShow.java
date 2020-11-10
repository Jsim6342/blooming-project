package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.C_ProfileDAO;
import com.DAO.DiaryDAO;
import com.DAO.ReservationDAO;
import com.DTO.DiaryDTO;
import com.google.gson.Gson;


@WebServlet("/DiaryShow")
public class DiaryShow extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//한글 인코딩
		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");	
		 
	     //Session영역에 값 저장
	     HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	     String nickname = (String)session.getAttribute("nickname");
		 
		 //날짜값 가져오기
	     String start_date = request.getParameter("start_date");
	     String end_date = request.getParameter("end_date");
	     
		 System.out.println(nickname);
		 System.out.println(start_date);
		 System.out.println(end_date);
		 
		 //닉네임, 날짜에 맞는 일기 값 조회, 저장
		 DiaryDAO di_dao = new DiaryDAO();
		 DiaryDTO diary = new DiaryDTO();
		 ArrayList<DiaryDTO> diaryList = di_dao.show_diaryList(nickname, start_date, end_date);
		    
		 //JSON 구조로 변환
		 Gson gson = new Gson();
		 
		 PrintWriter out = response.getWriter();
		 
		 String jsonArr = gson.toJson(diaryList);
		 out.print(jsonArr);
		 
		 
//		 response.sendRedirect("counsel.jsp");
		   
		 
	}

}
