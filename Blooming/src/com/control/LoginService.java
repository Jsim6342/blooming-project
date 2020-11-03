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

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//사용자가 입력한 값을 가져오기
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
				
		//출력확인
//		System.out.println(email);
//		System.out.println(pw);
				
		//DB와 연동해서 사용자가 입력한 email값과 pw값 확인
		//member table 조회
		MemberDAO dao_mem = new MemberDAO();
		boolean check_mem = dao_mem.member_login(email, pw);
		//consultant table 조회
		ConsultantDAO dao_con = new ConsultantDAO();
		boolean check_con = dao_con.consultant_login(email, pw);
			 
		if(check_mem || check_con) { //rs.next() 함수는 1행씩 데이터를 확인하며 값이 있으면 True, 없으면 False를 반환 
			        	 	 
		//Session영역에 값 저장
		 HttpSession session = request.getSession(); //Session영역을 사용하기 위한 객체생성
		 session.setAttribute("email", email); //Session영역에 email이름표로 로그인에 성공한 사람의 email값 저장
			        	 
			         
		 response.sendRedirect("index.html");
		 }else {
	     System.out.println("이메일과 비밀번호를 확인해주세요.");
		 }
			         
			      
			   
				
				
				
				//3. 로그인 성공/실패 했을 때 페이지 이동
		
	}

}
