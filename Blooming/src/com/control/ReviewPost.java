package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;
import com.DAO.ReviewDAO;


@WebServlet("/ReviewPost")
public class ReviewPost extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 //한글 인코딩
		 request.setCharacterEncoding("UTF-8");
			
	     //Session영역에 값 저장
	     HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
	     String nickname = (String)session.getAttribute("nickname");
		 
		 //후기 작성 페이지 가져오기
		 String rev_title = request.getParameter("rev_title");
		 String rev_contents = request.getParameter("rev_contents");
	   	 
		 System.out.println(nickname);
		 System.out.println(rev_title);
		 System.out.println(rev_contents);
		   
		   
		   //reviewDAO 객체생성
		   ReviewDAO dao = new ReviewDAO();
		   int cnt = dao.review_post(nickname, rev_title, rev_contents); //review_post 메소드. 성공 시 1 반환
		   
		   //후기 등록 성공 시 comments.jsp로 이동
		   if(cnt > 0) {
		   response.sendRedirect("comments.jsp");
		   }
		
	}

}
