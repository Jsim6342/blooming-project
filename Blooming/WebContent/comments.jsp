<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.ReviewDTO"%>
<%@page import="com.DAO.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Blooming - 극복후기</title>
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
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							집단상담 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="counsel.jsp">집단상담예약</a> <a
								class="dropdown-item" href="booking.jsp">집단상담 예약현황</a>
						</div></li>
					<li class="nav-item"><a class="nav-link active"
						href="comments.jsp">극복후기</a></li>
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
				극복후기 <small>post-overcoming review</small>
			</h1>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">
		<div class="breadcrumb-main">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item active">극복후기</li>
			</ol>
		</div>

	
	<!-- 게시글  출력 부분 -->
	 <%
         ReviewDAO dao = new ReviewDAO();
         ArrayList<ReviewDTO> reviewList = dao.showReviewList();   %>
           
      <div class="row">
      
      <% for(int i = 0;i<reviewList.size();i++) {  
      
    	  out.println("<div class='col-lg-4 col-sm-6 portfolio-item'>");
    	  out.println("<div class='card h-100'>");
    	  out.println("<a href='commentspost.jsp'><img class='card-img-top' src='images/portfolio-big-01.jpg' alt='' /></a>");
    	  out.println("<div class='card-body'>");
    	  out.println("<h4 class='card-title'>");
    	  out.println("<a href=commentspost.jsp?rev_num="+reviewList.get(i).getRev_num()+">"+reviewList.get(i).getRev_title()+"</a>");
    	  out.println("</h4>");
    	  out.println("<p class='card-text'>"+reviewList.get(i).getRev_contents()+"</p>");
    	  out.println("</div>");
    	  out.println("</div>");
    	  out.println("</div>");
    	  
      } %>
 
      </div>

		<div class="pagination_bar">
			<!-- Pagination -->
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</ul>
			<div class="row mb-4">
				<div class="col-md-8"></div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-secondary btn-block" href="post.jsp">후기작성</a>
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
					<!-- 맨 아래 footer SNS페이지 이동 ul태그 -->
					<!-- <ul class="social_footer_ul">
				<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
				<li><a href="#"><i class="fab fa-twitter"></i></a></li>
				<li><a href="#"><i class="fab fa-linkedin"></i></a></li>
				<li><a href="#"><i class="fab fa-instagram"></i></a></li>
            </ul> -->
					<!--social_footer_ul ends here-->
				</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>