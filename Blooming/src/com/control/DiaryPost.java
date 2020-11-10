package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DiaryDAO;
import com.DAO.ReviewDAO;


@WebServlet("/DiaryPost")
public class DiaryPost extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 //한글 인코딩
		 request.setCharacterEncoding("UTF-8");
			
	     //Session영역에 값 저장
	     HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	     String nickname = (String)session.getAttribute("nickname");
		 
		 //후기 작성 페이지 가져오기
	     String DI_DATE = request.getParameter("DI_DATE");
		 String DI_TITLE = request.getParameter("DI_TITLE");
		 String DI_CONTENTS = request.getParameter("DI_CONTENTS");
	   	 
		 System.out.println(DI_DATE);
		 System.out.println(DI_TITLE);
		 System.out.println(DI_CONTENTS);
		   
		   
		   //reviewDAO 객체생성
		   DiaryDAO dao = new DiaryDAO();
		   int cnt = dao.insertDiary(nickname, DI_DATE, DI_TITLE, DI_CONTENTS); //review_post 메소드. 성공 시 1 반환
		   
		   //후기 등록 성공 시 comments.jsp로 이동
		   if(cnt > 0) {
		   response.sendRedirect("diary.jsp");
		   }
		
		
	}

}
