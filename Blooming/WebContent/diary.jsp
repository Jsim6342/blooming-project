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
<title>Blooming - 일기</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Fontawesome CSS -->
<link href="css/all.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['날짜', '점수'],
          ['1주차',  0],
          ['2주차',  1],
          ['3주차',  0],
          ['4주차',  1]
        ]);

        var options = {
          title: '나의 감정 그래프',
          curveType: 'function',
          legend: { position: 'bottom' }
        
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>

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
               <li class="nav-item "><a class="nav-link active" href="diary.jsp">일기작성</a>
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

   <!-- full Title -->
   <div class="full-title">
      <div class="container">
         <!-- Page Heading/Breadcrumbs -->
         <h1 class="mt-4 mb-3">
            일기 <small>diary</small>
         </h1>
      </div>
   </div>

   <!-- Page Content -->
   <div class="container">
      <div class="breadcrumb-main">
         <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
            <li class="breadcrumb-item active">일기</li>
         </ol>
      </div>
   </div>


<div class="container">
		<div class="about-main">
			
			
			<div class="row">
			
				<div class="col-lg-6">
				<h2 class="col-lg-6">나의 나무 키우기</h2>
			<h class="col-lg-6">당신의 이야기를 들려주세요</h>
					<img class="img-fluid rounded" src="images/tree1.png" alt="" />
				</div>
				<div class="col-lg-6">
									<!-- <h2>나의 감성 그래프</h2>
				
									<img class="img-fluid rounded" src="images/about.jpg" alt="" /> -->
					<h2>나의 이야기</h2>
					<p>머신러닝을 기반한 감성분석 시스템으로 당신의 하루의 감성을 분석해드립니다.</p>
					<ul>
					<h>날짜 선택 : </h>
					<input type="date" name='date' value='2020-11-10'/>
					<h> ~ </h>
					<input type="date" name='date' value='2020-11-10'/>
					<hr>
						<li>Sed at tellus eu quam posuere mattis.</li>
						<li>Phasellus quis erat et enim laoreet posuere ac porttitor
							ipsum.</li>
						<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
						<li>Duis porttitor odio pellentesque mollis vulputate.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
						<li>Duis porttitor odio pellentesque mollis vulputate.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
						<li>Duis porttitor odio pellentesque mollis vulputate.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
						<li>Duis porttitor odio pellentesque mollis vulputate.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
						<li>Duis porttitor odio pellentesque mollis vulputate.</li>
						<li>Quisque ac eros non ex hendrerit vehicula.</li>
						
					</ul>
					<hr>
					<a href="#" class="btn btn-primary">일기 작성하기</a>
				
				</div>

         </div>
         <!-- /.row -->
      </div>
      <br>
      <br>
      	<body>
      	<h6 style="text-align:center;">당신이 쓴 일기의 긍정, 부정 점수를 분석하여 보여줍니다.</h6>
      	<h6 style="text-align:center;">당신의 나무를 키워보세요!</h6>
   	 <div id="curve_chart" style="width: 1300px; height: 400px;"></div>
  </body>
      </div>
      <br>

   <!-- /.container -->
   <!--footer starts from here-->
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