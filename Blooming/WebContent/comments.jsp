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
					<li class="nav-item "><a class="nav-link" href="contact.jsp">센터찾기</a>
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
         ArrayList<ReviewDTO> reviewList = dao.showReviewList();   
         
         //페이징 기능
         int count = dao.count_Review(); // 전체행 갯수
         String tempStart = request.getParameter("page"); 
         int startPage = 0; // rownum 시작값
         int onePageCnt = 9; // 한페이지에 출력할 행의 갯수
         
         System.out.println("선택숫자"+tempStart);
         
         count = (int)Math.ceil((double)count/(double)onePageCnt); // 페이지 수 저장(전체리뷰갯수/한페이지에출력할행갯수)
         
         if(tempStart!=null) {
        	 startPage = (Integer.parseInt(tempStart)-1)*onePageCnt; //선택한 페이지에 맞게 startPage를 설정
        	 onePageCnt = startPage+9; //선택한 페이지에 맞게 출력범위(9개 출력) 설정
         }
         
         ArrayList<ReviewDTO> reviews = dao.selectReviewList(startPage, onePageCnt); //숫자에 맞게  리스트 반환
     %>
           
      <div class="row">
      
      <% for(int i = 0;i<reviews.size();i++) {  //페이징 취소시, reviews를 reviewList로 수정
      
    	  out.println("<div class='col-lg-4 col-sm-6 portfolio-item'>");
    	  out.println("<div class='card h-100'>");
    	  out.println("<a href='commentspost.jsp'><img class='card-img-top' src='images/portfolio-big-01.jpg' alt='' /></a>");
    	  out.println("<div class='card-body'>");
    	  out.println("<h4 class='card-title'>");
    	  out.println("<a href=commentspost.jsp?rev_num="+reviews.get(i).getRev_num()+">"+reviews.get(i).getRev_title()+"</a>");
    	  out.println("</h4>");
    	  out.println("<p class='card-text'>"+reviews.get(i).getRev_contents()+"</p>");
    	  out.println("</div>");
    	  out.println("</div>");
    	  out.println("</div>");
    	  
      } %>
 
      </div>

		<div class="pagination_bar">
			<!-- Pagination -->
			<ul class="pagination justify-content-center">
				<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous"> 
				<span aria-hidden="true">&laquo;</span>
				<span class="sr-only">Previous</span>
				</a>
				</li>
				<% for(int i = 1; i<=count; i++) {%>
				<li class="page-item"><a class="page-link" href="comments.jsp?page=<%=i%>"><%=i%></a></li>
				<%} %>
				<li class="page-item"><a class="page-link" href="#" aria-label="Next"> 
				<span aria-hidden="true">&raquo;</span> 
				<span class="sr-only">Next</span>
				</a></li>
			</ul>
			<div class="row mb-4">
				<div class="col-md-8"></div>
				<div class="col-md-4">
				<%if(email==null&&nickname==null) {%>
					<a onclick="notice2()" class="btn btn-lg btn-secondary btn-block" href="#">후기작성</a>
					<%}else {%>
					<a class="btn btn-lg btn-secondary btn-block" href="post.jsp">후기작성</a>
					<% }%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
   <script type="text/javascript">
   
   
	function notice2(){
		alert('회원만 이용 가능합니다. 로그인을 해주세요!');

	}
	</script>
</body>
</html>