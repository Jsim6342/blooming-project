<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.C_ProfileDTO"%>
<%@page import="com.DAO.C_ProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
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
					<li class="nav-item"><a class="nav-link" href="diagnosis.html">진단하기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="diary.jsp">일기작성</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle active" href="#"
						id="navbarDropdownBlog" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 집단상담 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="counsel.jsp">집단상담예약</a> <a
								class="dropdown-item" href="booking.jsp">집단상담 예약현황</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="comments.jsp">극복후기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.html">센터찾기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="login.html">로그인</a>
					</li>
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
			
	<!-- Ajax를 사용하기 위한 Ajax import 부분  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <%
       C_ProfileDAO dao = new C_ProfileDAO();
       ArrayList<C_ProfileDTO> profileList = dao.showProfile();   %>
                  
<% 
       for(int i = 0;i<profileList.size();i++) {
       
    	  
   	   out.print("<div class='col-lg-4 col-sm-6 portfolio-item'>");
   	   out.print("<div class='card h-100'>");
   	   out.print("<div class='card-body'>");
   	   out.print("<h2 class='card-title'><a>"+profileList.get(i).getPro_name()+"</a></h2>");
   	   out.print("<div class='font-italic'>"+profileList.get(i).getPro_email()+"</div>");
   	   out.print("</div>");
   	   out.print("<ul class='list-group list-group-flush'>");
   	   out.print("<li class='list-group-item'>상담일자: "+profileList.get(i).getPro_date()+"</li>");
   	   out.print("<li class='list-group-item'>학력/이력 : "+profileList.get(i).getBackground()+"</li>");
   	   out.print("<li class='list-group-item'>상담소개 : "+profileList.get(i).getIntroduce()+"</li>");
   	   out.print("<ul class='card-footer'>");
   	   out.print("<a onclick='next()' href='#' class='btn btn-primary'>예약하기</a> &nbsp;&nbsp; <h id='update_people'>남은인원: "+profileList.get(i).getMax_people()+"</h>");
   	   %>
   	   <script type="text/javascript">
	    //Ajax함수 
       
		function ajaxCall() { //ajax 함수 부분
			 var res_date = "<%=profileList.get(i).getPro_date()%>";
		   	 var consultant = "<%=profileList.get(i).getPro_name()%>";
		   	 var max_people = "<%=profileList.get(i).getMax_people()%>";
		   	 var pro_email = "<%=profileList.get(i).getPro_email()%>";
			$.ajax({
				//ajax 통신 방식으로 데이터를 전송
				type : "post", //서버로 어떤 방식으로 호출할 것인지. get or post
				url : "ReserveRequest", //어떤 서버페이지로 이 값을 보낼 것인지
				data : {"res_date" : res_date , "consultant" : consultant, "max_people" : max_people, "pro_email" : pro_email}, //보낼 데이터 지정
				dataType : "text",
				success : function(data) { //서버로 부터 받은 값
					console.log(data);
					//var update_people = data;
					var h = document.getElementById("update_people");
				    h.innerHTML = "남은인원: "+data;
					
				},
				error : function() {

				}
			});
		
		
		}
		
		function next(){
				if(confirm("상담을 예약하시겠습니까?"))
				{
			     ajaxCall();
				 alert('예약이 완료되었습니다.');
				}else
				{
				alert('취소되었습니다.');
				}
			}
		
	  </script>
	  
	  
	   <%

	  
   	   out.print("</ul>");

   	   out.print("</ul>");
   	   out.print("</div>");
   	   out.print("</div>");
            }%>
        
       
				
				<!-- <div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="images/step1.png"
							alt="" /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="https://zoom.us/download">&rarr; ZOOM 다운로드 링크</a>
							</h4>
							<p class="card-text">
								컴퓨터를 사용하여 상담에 참가하시는 분은 <br>회의용 ZOOM 클라이언트를 다운로드 하세요. <br>스마트폰을
								이용하여 상담에 참가하시는 분은 ZOOM 모바일 앱을 다운로드 하세요.
							</p>
						</div>
						<div class="card-footer">
				

							<a onclick="next()" href="#" class="btn btn-primary">예약하기</a>
						</div>
					</div>
				</div> -->
				
				
				
				
		</div>
		<div class="row mb-4">
			<div class="col-md-8">
				<p>집단상담 서비스를 진행하시려면 프로필을 등록해주세요.</p>
			</div>
			<div class="col-md-4">
				<a class="btn btn-lg btn-secondary btn-block" href="profile.jsp">프로필 등록하기</a>
			</div>
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
</body>
</html>