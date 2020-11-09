package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DiagnosisCheck")
public class DiagnosisCheck extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int one = Integer.parseInt(request.getParameter("1"));
		int two = Integer.parseInt(request.getParameter("2"));
		int thr = Integer.parseInt(request.getParameter("3"));
		int fou= Integer.parseInt(request.getParameter("4"));
		int fiv = Integer.parseInt(request.getParameter("5"));
		int six = Integer.parseInt(request.getParameter("6"));
		int sev = Integer.parseInt(request.getParameter("7"));
		int eig = Integer.parseInt(request.getParameter("8"));
		int nin = Integer.parseInt(request.getParameter("9"));
		int ten = Integer.parseInt(request.getParameter("10"));
		int onet = Integer.parseInt(request.getParameter("11"));
		int twot = Integer.parseInt(request.getParameter("12"));
		int thrt = Integer.parseInt(request.getParameter("13"));
		int fout = Integer.parseInt(request.getParameter("14"));
		int fivt = Integer.parseInt(request.getParameter("15"));
		int sixt = Integer.parseInt(request.getParameter("16"));
		int sevt = Integer.parseInt(request.getParameter("17"));
		int eigt = Integer.parseInt(request.getParameter("18"));
		int nint = Integer.parseInt(request.getParameter("19"));
		int twet = Integer.parseInt(request.getParameter("20"));
		int tweo = Integer.parseInt(request.getParameter("21"));
		
		int sum = one + two + thr + fou + fiv + six + sev + eig + nin + ten +
					onet + twot + thrt + fout + fivt + sixt + sevt + eigt + nint + twet +
						tweo;
		
		
		System.out.println(sum);
		
		if(sum>=0 && sum <= 9) {
			 response.sendRedirect("result1.jsp");
		}else if(sum>=10 && sum <= 15) {
			 response.sendRedirect("result2.jsp");
		}else if(sum>=16 && sum <= 23) {
			 response.sendRedirect("result3.jsp");
		}else {
			 response.sendRedirect("result4.jsp");
		}
	}

}
