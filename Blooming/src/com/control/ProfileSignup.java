package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.C_ProfileDAO;
import com.DAO.ConsultantDAO;
import com.DAO.ReviewDAO;
import com.DTO.ConsultantDTO;


@WebServlet("/ProfileSignup")
public class ProfileSignup extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//�ѱ� ���ڵ�
		 request.setCharacterEncoding("UTF-8");
			
	     //Session������ �� ����
	     HttpSession session = request.getSession(); //Session������ ����ϱ� ���� ��ü����
	     String con_email = (String)session.getAttribute("email");
		 
		 //������ �ۼ� ������ ��������
	     String pro_date = request.getParameter("pro_date");
		 String background = request.getParameter("background");
		 String introduce = request.getParameter("introduce");
		 int max_people = Integer.parseInt(request.getParameter("max_people"));
	   	 
		 System.out.println(con_email);
		 System.out.println(pro_date);
		 System.out.println(background);
		 System.out.println(introduce);
		 System.out.println(max_people);
		   
		 //email ������ name �� ��������
		 ConsultantDTO consultant = new ConsultantDTO();
		 ConsultantDAO con_dao = new ConsultantDAO();
		 consultant = con_dao.return_name_location(con_email);
		 String pro_name = consultant.getCon_name();
		 
		   //C_ProfileDAO ��ü����
		   C_ProfileDAO pro_dao = new C_ProfileDAO();
		   int cnt = pro_dao.profile_join(con_email, pro_name, pro_date, background, introduce, max_people); //review_post �޼ҵ�. ���� �� 1 ��ȯ
		   
		   //������ ��� ���� �� counsel.jsp�� �̵�
		   if(cnt > 0) {
		   response.sendRedirect("counsel.jsp");
		   }
		
		
	}

}