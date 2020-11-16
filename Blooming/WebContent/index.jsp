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
			<a class="navbar-brand" href="index.jsp"> 
			<img src="images/marigold4.png" width="180px" ; height="53px"; alt="logo"/>
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
					<p>blooming은 우울의 blue와 꽃이 피는 blossom을 합친 의미로 우울한 기분에서 벗어나 <br>꽃이 피는 존재가 되자는 의미를 가지고 있습니다.</p>
					<h5>블루밍이 제공하는 서비스</h5>
					<ul>
						<li>진단하기 : 벡우울척도를 활용한 간단한 우울 자가진단</li>
						<li>일기작성 : 간단한 일기 작성을 통한 내 감정변화의 시각화</li>
						<li>집단상담 : 직접 센터에 방문하지 않고도 익명으로 전문가와의 상담</li>
						<li>극복후기 : 다양한 사람들의 경험담 </li>
						<li>센터찾기 : 국가에서 공인하는 전문상담센터 위치 및 정보제공</li>
					</ul>
					<p>혹시 우울한 감정 때문에 답답하지만 드러내기가 무서워 숨어계시나요?<br>블루밍은 익명성을 보장하여 누구나 겪을 수 있는 우울한 감정이나 우울증에 대하여<br>이야기하고
					감정변화의 동기부여를 도와주는 웹서비스입니다.</p>
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
							<img class="img-fluid" src="images/1111.png" alt="" />
						</div>
						<div class="card-body">
							<p class="card-text">백우울척도를 통한 간단한 우울증 자가진단</p>
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
							<img class="img-fluid" src="images/f33.png" alt="" />
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
					<h2>우울증은 누구나 겪을 수 있는 마음의 감기입니다.</h2>
					<p>우울한 감정이 느껴진다고 절대 잘못되고 심각한 것이 아닙니다. <br>우울증은 많은 분들에게 익숙한 질환이지만, 정확히 우울증에 대해 알고 있는 분은 드뭅니다.</p>
					<h5>다양한 우울장애의 종류</h5>
					<ul>
						<li>산후 우울증 : 출산에 따른 호르몬의 불균형과 불안에 따른 심리적인 갈등에서 오는 우울장애</li>
						<li>가면성 우울증 : 우울증상이 연련층에 따라 다른모습으로 나오는 우울장애</li>
						<li>주부 우울증 : 주부에게서 나를 희생하고 잘못 살아왔다는 생각에서 오는 우울장애</li>
						<li>노인 우울증 : 노년기에 오는 은퇴나 이별, 가족 및 친구의 사망 등에서 오는 상실 우울장애</li>
					</ul>
					<p>감기도 심해지면 여러 합병증이 찾아오듯이, 우울장애 역시 심해진다면 개인의 의지로만 이겨내기 힘들 수 있습니다.
					 심한 우울증의 경우 약물치료가 필요할 수 있고 심리치료 없이는 재발되기도 쉽습니다. 이에 효과적인 심리 상담을 위해 한국심리학회가 공인하는 임상심리전문가 또는 심리상담기관을 찾아
					  나의 상태를 확인하고 이해하며 상담계획을 논의할 수 있습니다. </p>
				</div>
				<div class="col-lg-6">
					<img class="img-fluid rounded" src="images/team.png" alt="" />
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