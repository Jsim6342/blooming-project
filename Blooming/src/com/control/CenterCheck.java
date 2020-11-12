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

import com.DAO.DiaryDAO;
import com.DTO.CenterDTO;
import com.DTO.DiaryDTO;
import com.google.gson.Gson;

@WebServlet("/CenterCheck")
public class CenterCheck extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//한글 인코딩
		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");	
		 
		 //상담센터명 가져오기
	     String center_name = request.getParameter("center_name");

	  	 System.out.println("선택 센터이름: "+center_name);

		 
		 //샌터정보 입력
		 CenterDTO diary = new CenterDTO();
		 CenterDTO center1 = new CenterDTO("심리건강연구소","광주 동구 남문로 734 103동 206호","062-512-0039","pimang95@naver.com","정보없음");
		 CenterDTO center2 = new CenterDTO("전심연합심리상담센터","광주 북구 일곡마을로152번길 3-2 1층","062-470-4774","ph07pen@gmail.com","영업시간 월~금 10:00 ~ 18:00");
		 CenterDTO center3 = new CenterDTO("박앤정 임상심리클리닉","광주 북구 서암대로 113-2 2층","062-514-8800","jung9386@hanmail.net","정보없음");
		 CenterDTO center4 = new CenterDTO("최영미 마음상담센터","광주 북구 동문대로 111","062-263-7942","정보없음","정보없음");
		 
		 ArrayList<CenterDTO> centerList = new ArrayList<CenterDTO>();
		 centerList.add(center1);
		 centerList.add(center2);
		 centerList.add(center3);
		 centerList.add(center4);
		 
		 for(int i=0;i<centerList.size();i++) {
			 if(center_name.equals(centerList.get(i).getCenter_name())) {
				   
				 CenterDTO center = centerList.get(i);
				 
				 //JSON 구조로 변환
				 Gson gson = new Gson();
				 
				 PrintWriter out = response.getWriter();
				 
				 String jsonArr = gson.toJson(center);
				 
				 //center값 리턴
				 out.print(jsonArr);
				 
	
			 }
		 }	
		
	}

}
