<%@page import="com.DTO.ReservationDTO"%>
<%@page import="com.DAO.ReservationDAO"%>
<%@page import="com.DTO.C_ProfileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.C_ProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!-- 상단바, 하단바만 있는 페이지 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Blooming - 집단상담 예약현황</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Fontawesome CSS -->
<link href="css/all.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<% //스크립틀릿
 
 	//session값 email 가져오기
	String email = (String)session.getAttribute("email");
	System.out.println("현재 접속한 사람의 이메일: " + email);
	
	//session값 nickname 가져오기
	String nickname = (String)session.getAttribute("nickname");
	System.out.println("현재 접속한 사람의 닉네임: " + nickname);
	
 %>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-light top-nav fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"> <img
				src="images/marigold4.png" width="180px" ; height="53px"
				; alt="logo" />
			</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="fas fa-bars"></span>
			</button>

		</div>
	</nav>

	<!-- full Title -->
	<div class="full-title">
		<div class="container">
			<!-- Page Heading/Breadcrumbs -->
			<h1 class="mt-4 mb-3">
				예약 확인하기 <small>booking</small>
			</h1>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">
		<div class="breadcrumb-main">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
				<li class="breadcrumb-item active">집단상담 예약현황</li>
			</ol>
		</div>
	</div>

	<div class="container row">
		<div class="page-hearder col-md-offset-3" style="padding-bottom: 20px">
		</div>
		<div class="col-sm-offset-9"></div>
		<div class="col-md-10 col-md-offset-2">
		
		<table class="table table-striped ">
				<tr class="text-center">
					<th>상담사</th>
					<th>상담사 이메일</th>
					<th>상담일자</th>
					<th>남은인원</th>
					
					<th><br></th>
				</tr>
		
		<!--예약현황 테이블 출력  -->
		<%
		C_ProfileDAO pro_dao = new C_ProfileDAO();
		ReservationDAO res_dao = new ReservationDAO();
		ReservationDTO reservation = new ReservationDTO();
		ArrayList<ReservationDTO> reservationList = res_dao.return_consultant(nickname);
		ArrayList<C_ProfileDTO> profileList = pro_dao.res_ShowProfile(reservationList);
		
	    
		%>
		
		<% 
		for(int i = 0;i<profileList.size();i++) {
			
			 out.print("<tr>");
	         out.println("<td>"+profileList.get(i).getPro_name()+"</td>");
	         out.println("<td>"+profileList.get(i).getPro_email()+"</td>");
	         out.println("<td>"+profileList.get(i).getPro_date()+"</td>"); 
	         out.println("<td>"+profileList.get(i).getMax_people()+"</td>"); 
	         out.print("<td>");
	         
	         %>
	         <script>
						function next() {
							if (confirm("상담을 취소하시겠습니까?")) {
								alert('상담을 취소하셨습니다. 집단상담 예약 페이지로 이동합니다.');
								location.href = "ReserveDelete?date="<%=profileList.get(i).getPro_date()%>;
							} else {
							}
						}
			</script> 
	         <%
	         out.print("<a onclick='next()' href='#' class='btn btn-primary'>상담취소</a>");
	         out.print("</td>");
	         out.print("<tr>");
	         
				/* <tr>
					<td>정상훈</td>
					<td>email@naver.com</td>
					<td>매주 수요일 7시</td>
					<td>20</td>
					<td>
					<script>
						function next() {
							if (confirm("상담을 취소하시겠습니까?")) {
								alert('상담을 취소하셨습니다. 집단상담 예약 페이지로 이동합니다.');
								location.href = "http://localhost:8085/Blooming/counsel.jsp";
							} else {
							}
						}
					</script> <a onclick="next()" href="#" class="btn btn-primary">상담취소</a></td>
				</tr> */
				} %>
			</table>
		</div>
	</div>

	<!-- /.container -->
	<!--footer starts from here-->
	<footer class="footer">
		<div class="container bottom_border">
			<div class="row">
				<div class="container">
					<div class="footer-logo">
						<a href="#"><img src="images/marigold4.png" alt="" /></a>
					</div>
					<!--foote_bottom_ul_amrc ends here-->
					<p class="copyright text-center">
						All Rights Reserved. &copy; 2020 <a href="#">Blooming</a> Design
						By : SINOZO, 9uack <a href="https://html.design/">html design</a>
					</p>
				</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>