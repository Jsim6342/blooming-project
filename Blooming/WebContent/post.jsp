<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Blooming - 극복후기작성</title>
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
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							집단상담 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="counsel.jsp">집단상담예약</a> <a
								class="dropdown-item" href="booking.jsp">집단상담 예약현황</a>
						</div></li>
					<li class="nav-item "><a class="nav-link active" href="comments.jsp">극복후기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">센터찾기</a>
					</li>
					<%if(email==null&&nickname==null) {%>
					<li class="nav-item"><a class="nav-link" href="login.html">로그인</a>
					</li>
					<%}else { %>
					<li class="nav-item"><a class="nav-link" href="login.html">정보수정</a>
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
				극복후기작성 <small>Post</small>
			</h1>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">
		<div class="breadcrumb-main">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
				<li class="breadcrumb-item active">Post</li>
			</ol>
		</div>
		<div class="container">


			<div class="row">
				<div class="col-lg-8 mb-4 contact-left">
					<!--  -->
					<form name="" id="" action="ReviewPost" method="post" novalidate>
						<div class="control-group form-group">
							<div class="controls"></div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>제목</label> <input type="text" class="form-control"
									name="rev_title" id="title" required
									data-validation-required-message="Please enter your email address.">
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>내용</label>
								<textarea rows="20" cols="100" class="form-control"
									name="rev_contents" id="content" required
									data-validation-required-message="Please enter your message"
									maxlength="999" style="resize: none"></textarea>
							</div>
						</div>
						<div id="success"></div>
						<!-- For success/fail messages -->
						<button type="submit" class="btn btn-primary"
							id="sendMessageButton">작성완료</button>
					</form>
				</div>

				<!-- 게시글입력 영역 옆에 출력되는 영역시작 -->

				<!-- 게시글입력 영역 옆에 출력되는 영역끝 -->
			</div>
			<!-- /.row -->


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