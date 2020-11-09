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
<title>Blooming - Home</title>
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
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							집단상담 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="counsel.jsp">집단상담예약</a> <a
								class="dropdown-item" href="booking.jsp">집단상담 예약현황</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="comments.jsp">극복후기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">센터찾기</a>
					</li>
					<%if(email==null&&nickname==null) {%>
					<li class="nav-item"><a class="nav-link" href="login.html">로그인</a>
					</li>
					<%}else { %>
					<li class="nav-item"><a class="nav-link" href="LogoutService">로그아웃</a>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
	</nav>
	<header class="slider-main">
		<div id="carouselExampleIndicators"
			class="carousel slide carousel-fade" data-ride="carousel">
			
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('images/ms.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h4>
							​The happiness will undoubtedly be realized<br>
							<br>반드시 오고야 말 행복<br>
							<br>
						</h4>
						<p>- 메리골드의 꽃말</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('images/forest.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h4>
							씨앗, 너무 애쓰지마<br>
							<br> 너는 본디 꽃이 될 운명일지니<br>
							<br>
						</h4>
						<p>- 박광수, 앗싸라비아 中</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('images/kids.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h4>
							그대도 오늘 <br>
							<br>누군가에게 위로였다<br>
							<br>
						</h4>
						<p>- 이훤, 그대도 오늘 中</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<div class="container">
		<div class="about-main">
			<h2 class="my-4">About Blooming</h2>
			<div class="row">
				<div class="col-lg-6">
					<img class="img-fluid rounded" src="images/about.jpg" alt="" />
				</div>
				<div class="col-lg-6">
					<h2>Marigold : 반드시 오고야 말 행복</h2>
					<p>Futura, consectetur adipiscing elit, sed do eiusmod tempor
						incididunt ut labore et dolore magna aliqua.</p>
					<h5>Our smart approach</h5>
					<ul>
						<li>Sed at tellus eu quam posuere mattis.</li>
						<li>Phasellus quis erat et enim laoreet posuere ac porttitor
							ipsum.</li>
						<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
						<li>Duis porttitor odio pellentesque mollis vulputate.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
					</ul>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Corporis, omnis doloremque non cum id reprehenderit, quisquam
						totam aspernatur tempora minima unde aliquid ea culpa sunt.
						Reiciendis quia dolorum ducimus unde.</p>
				</div>

			</div>
			<!-- /.row -->
		</div>

		<div class="services-bar">
			<h1 class="my-4">Blooming Web Services</h1>
			<!-- Services Section -->
			<div class="row">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">진단 서비스</h4>
						<div class="card-img">
							<img class="img-fluid" src="images/f1.png" alt="" />
						</div>
						<div class="card-body">
							<p class="card-text">전문성을 갖춘 진단문항</p>
						</div>
						<div class="card-footer">
							<a href="diagnosis.jsp" class="btn btn-primary">진단 해보기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">일기 서비스</h4>
						<div class="card-img">
							<img class="img-fluid" src="images/f2_3.png" alt="" />
						</div>
						<div class="card-body">
							<p class="card-text">
								머신러닝을 기반으로 당신의 하루의 <br>감성을 분석해드립니다.
							</p>
						</div>
						<div class="card-footer">
							<a href="diary.jsp" class="btn btn-primary">작성 해보기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">상담 서비스</h4>
						<div class="card-img">
							<img class="img-fluid" src="images/f3.png" alt="" />
						</div>
						<div class="card-body">
							<p class="card-text">
								보안성이 높은 ZOOM 프로그램으로<br>전문상담사가 고민을 들어드립니다.
							</p>
						</div>
						<div class="card-footer">
							<a href="counsel.jsp" class="btn btn-primary">상담예약해보기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- About Section -->
		<div class="about-main">
			<div class="row">
				<div class="col-lg-6">
					<h2>우울증이란 누구나 나타나는 마음의 감기입니다.</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
					<h5>Our smart approach</h5>
					<ul>
						<li>Sed at tellus eu quam posuere mattis.</li>
						<li>Phasellus quis erat et enim laoreet posuere ac porttitor
							ipsum.</li>
						<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
						<li>Duis porttitor odio pellentesque mollis vulputate.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
					</ul>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Corporis, omnis doloremque non cum id reprehenderit, quisquam
						totam aspernatur tempora minima unde aliquid ea culpa sunt.
						Reiciendis quia dolorum ducimus unde.</p>
				</div>
				<div class="col-lg-6">
					<img class="img-fluid rounded" src="images/about-img.jpg" alt="" />
				</div>
			</div>
			<!-- /.row -->
		</div>

		<hr>
		<!-- Get In Touch Now Section -->
		<%if(email==null&&nickname==null) {%>
		<div class="row mb-4">
			<div class="col-md-8">
				<p>Blooming 웹 서비스를 이용하시려면 우측의 회원가입 버튼을 클릭해주세요.</p>
			</div>
			<div class="col-md-4">
				<a class="btn btn-lg btn-secondary btn-block" href="signup.html">회원가입
					하러가기</a>
			</div>
		</div>
		<%} %>
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