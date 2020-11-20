<%@page import="com.DAO.ReservationDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.C_ProfileDTO"%>
<%@page import="com.DAO.C_ProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Blooming - 집단상담</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Fontawesome CSS -->
<link href="css/all.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
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
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="diagnosis.jsp">진단하기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="diary.jsp">일기작성</a>
					</li>
					<!-- <li class="nav-item">
                     <a class="nav-link" href="counsel.jsp">집단상담</a>
                  </li> -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle active" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							집단상담 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="counsel.jsp">집단상담예약</a> <a
								class="dropdown-item" href="booking.jsp">집단상담 예약현황</a>
						</div></li>
					<li class="nav-item "><a class="nav-link" href="comments.jsp">극복후기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">센터찾기</a>
					</li>
					<%if(email==null&&nickname==null) {%>
					<li class="nav-item"><a class="nav-link" href="login.html">로그인</a>
					</li>
					<%}else { %>
					<li class="nav-item"><a class="nav-link" href="mypage.jsp">마이페이지</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="LogoutService">로그아웃</a>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
	</nav>

	<!-- full Title -->
	<div class="full-title">
		<div class="container">
			<!-- Page Heading/Breadcrumbs -->
			<h1 class="mt-4 mb-3">
				집단상담예약 <small>group counseling</small>
			</h1>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">
		<div class="breadcrumb-main">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
				<li class="breadcrumb-item active">집단상담</li>
			</ol>
		</div>

		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a><img class="card-img-top" src="images/step1.png" alt="" /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="https://zoom.us/download">&rarr; ZOOM 다운로드 링크</a>
						</h4>
						<p class="card-text">
							컴퓨터를 사용하여 상담에 참가하시는 분은 <br>회의용 ZOOM 클라이언트를 다운로드 하세요. <br>스마트폰을
							이용하여 상담에 참가하시는 분은 ZOOM 모바일 앱을 다운로드 하세요.
						</p>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a><img class="card-img-top" src="images/step2_2.png" alt="" /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a>전문 상담사</a>
						</h4>
						<p class="card-text">
							현재 국가에서 인증받은 전문상담센터에서 <br>근무하는 상담사들의 정보 및 이력을 확인하고 <br>상담
							예약을 진행해주세요.
						</p>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a><img class="card-img-top" src="images/step3.png" alt="" /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a>상담 진행</a>
						</h4>
						<p class="card-text">
							상담 예약 후 제공받으신 상담시간과 ZOOM<br>링크를 통해 ZOOM프로그램에 접속하여 상담을 진행하실 수
							있습니다. ZOOM회의에 들어가기 전 자신만 아는 닉네임을 설정하여 익명성을 <br>보장받으세요.
						</p>
					</div>
				</div>
			</div>

			<!-- 상담사  프로필 출력  -->
			
 <%
       C_ProfileDAO pro_dao = new C_ProfileDAO();
 	   ReservationDAO res_dao = new ReservationDAO();
       ArrayList<C_ProfileDTO> profileList = pro_dao.showProfile();   %>
                  
<% 
       for(int i = 0;i<profileList.size();i++) {
    	   
    	//next함수에 담을 매개변수 선언
    	String res_date = profileList.get(i).getPro_date();
    	String consultant = profileList.get(i).getPro_name();
    	int max_people = profileList.get(i).getMax_people();
    	String pro_email = profileList.get(i).getPro_email();
   	   
  
   	   out.println("<div class='col-lg-4 col-sm-6 portfolio-item'>");
   	   out.println("<div class='card h-100'>");
   	   out.println("<div class='card-body'>");
   	   out.println("<h2 class='card-title'><a>"+profileList.get(i).getPro_name()+"</a></h2>");
   	   out.println("<div class='font-italic'>"+profileList.get(i).getPro_email()+"</div>");
   	   out.println("</div>");
   	   out.println("<ul class='list-group list-group-flush'>");
   	   out.println("<li class='list-group-item'>상담일자: "+profileList.get(i).getPro_date()+"</li>");
   	   out.println("<li class='list-group-item'>학력/이력 : "+profileList.get(i).getBackground()+"</li>");
   	   out.println("<li class='list-group-item'>상담소개 : "+profileList.get(i).getIntroduce()+"</li>");
   	   out.println("<ul class='card-footer'>");
   	   if(nickname==null&&email==null) { //비회원일 때
   		out.println("<p>상담예약은 로그인이 필요한 서비스 입니다.</p>");
   	   }else {
   		   if(nickname!=null) {//회원일 때
   			   if(res_dao.check_reservation(nickname,pro_email)) {//예약중일때
   				out.println("<p class='btn btn-primary'>예약완료</p> &nbsp;&nbsp; <h id='update_people'>남은인원: "+profileList.get(i).getMax_people()+"</h>");
   			   }else {//비예약중일때
   			    out.println("<a onclick='next(\""+res_date+"\",\""+consultant+"\",\""+max_people+"\",\""+pro_email+"\")' href='#' class='btn btn-primary'>예약하기</a> &nbsp;&nbsp; <h id='update_people'>남은인원: "+profileList.get(i).getMax_people()+"</h>"); 
   			   }
   		   }else {//상담사일 때
   				if(email.equals(pro_email)) {//내 상담일 때
   					out.println("<a onclick='finish(\""+pro_email+"\")' id='cob' class='btn btn-primary'>상담완료</a> &nbsp;&nbsp; <h id='update_people'>남은인원: "+profileList.get(i).getMax_people()+"</h>"); 
   				}else {//다른 상담일 때
   				out.println("<p onclick='notice1()' class='btn btn-primary' id='cob'>예약하기</p> &nbsp;&nbsp; <h id='update_people'>남은인원: "+profileList.get(i).getMax_people()+"</h>");
   				}
   		   }
   	   
   	   }
   //	res_dao.check_reservation(nickname,pro_email)
   	   out.println("</ul>");
   	   out.println("</ul>");
   	   out.println("</div>");
   	   out.println("</div>");
            }%>
  	
				
		</div>
		<div class="row mb-4">
			<div class="col-md-8">
			<!-- <p>집단상담 서비스를 진행하시려면 프로필을 등록해주세요.</p> -->
			</div>
			<%if(email!=null) { %>
			<div class="col-md-4">
			<p>집단상담 서비스를 진행하시려면 <br>프로필을 등록해주세요.</p>
				<%if(pro_dao.check_profile(email)) { %>
				<a onclick="notice2()" class="btn btn-lg btn-secondary btn-block" href="#">프로필 등록하기</a>
				<%}else {%>
				<a class="btn btn-lg btn-secondary btn-block" href="profile.jsp">프로필 등록하기</a>
				<% }%>
			</div>
			<% }%>
		</div>
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
	<script type="text/javascript">
		
		function next(res_date,consultant,max_people,pro_email){
				if(confirm("상담을 예약하시겠습니까?"))
				{
			     //ajaxCall(res_date,consultant,max_people,pro_email);
				 alert('예약이 완료되었습니다.');
				 location.href = "ReserveRequest?res_date="+encodeURIComponent(encodeURIComponent(res_date),"UTF-8")+"&consultant="+encodeURIComponent(encodeURIComponent(consultant),"UTF-8")+"&max_people="+encodeURIComponent(encodeURIComponent(max_people),"UTF-8")+"&pro_email="+encodeURIComponent(encodeURIComponent(pro_email),"UTF-8");
				}else
				{
				alert('취소되었습니다.');
				}
			}
		
		function finish(pro_email){
			if(confirm("상담을 완료하시겠습니까?"))
			{

			 alert('상담이 완료되었습니다.');
			 location.href = "DeleteCounsel?pro_email="+encodeURIComponent(encodeURIComponent(pro_email),"UTF-8");
			 
			}else
			{
			alert('취소되었습니다.');
			}
		}
		
		function notice1(){
			alert('상담사는 상담예약을 할 수 없습니다.');
		}
		function notice2(){
			alert('프로필은 1개만 만들 수 있습니다.');
		}
		
	  </script>
</body>
</html>