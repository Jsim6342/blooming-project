<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!-- 상단바, 하단바만 있는 페이지 -->
<!DOCTYPE html>
<html lang="ko">
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
					<li class="nav-item"><a class="nav-link" href="diagnosis.html">진단하기</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="diary.jsp">일기작성</a>
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
					<li class="nav-item"><a class="nav-link" href="contact.html">센터찾기</a>
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

		<!-- 일기쓰기 -->

		<div class="row">
			<div class="col-lg-8 mb-4 contact-left">
				<!--  -->
				<form name="" id="DiaryForm"
					action="http://192.168.50.22:5000/DiaryPost1" method="post"
					novalidate>
					<div class="control-group form-group">
						<div class="controls"></div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>날짜</label> <input type="date" class="form-control"
								name="DI_DATE" id="title" required
								data-validation-required-message="Please enter your email address.">
						</div>
					</div>


					<div class="control-group form-group">
						<div class="controls">
							<label>제목</label> <input type="text" class="form-control"
								name="DI_TITLE" id="title" required
								data-validation-required-message="Please enter your email address.">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>내용</label>
							<textarea rows="20" cols="100" class="form-control"
								name="DI_CONTENTS" id="content" required
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

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4 blog-right-side">

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">우울감에 대하여</h5>
					<div class="card-body">우울증의 가장 힘든 점은 남들 앞에서 정상적인 척해야 하는것과 남들이 내게 정상인인 척 하길 바라는 것. <br>그리고 누구에게 털어놓지 못하는 점입니다.<br>우울감은 단지 날씨와 같습니다.</div>
				</div>
				<div class="card my-4">
					<h5 class="card-header">오늘의 과제</h5>
					<div class="card-body">현재에서 감사할 것들을 발견할 것.<br>감사할 것이 없다 여겨질 땐 과감히 떠날 것.<br>어디에 있든 나를 바로 읽을 수 있도록<br>마음의 균형을 잡을 것.<br><br>- 정민선, 집 나간 마음을 찾습니다</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">추천</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="https://youtu.be/_f-yw10lfgI">알파웨이브를 <br>통한 힐링음악</a></li>
									<li><a href="https://youtu.be/m7GOmncIU5A">지친 마음을 <br>달래주는 음악</a></li>
									<li><a href="https://youtu.be/jME5_dk3mkQ">몸이 보내는 <br>우울증 신호</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="https://youtu.be/nYCO7PeR6go">가장 보통의 존재,<br>나의 우울증 이야기</a></li>
									<li><a href="https://youtu.be/9H5_3gaReCg">다큐 - 시선<br>우울증이 어때서요?</a></li>
									<li><a href="https://youtu.be/JiKJAQ0pT-w">우울증을 극복하는<br>3가지 방법</a></li>
								</ul>
							</div>
						</div>
					</div>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	$('form#DiaryForm').submit(function(){
			  let dateC = $('input[name="DI_DATE"]').val();
		      let titleC = $('input[name="DI_TITLE"]').val();
		      let contentC = $('input[name="DI_CONTENTS"]').val();
		      
		      
		      
		      
		       if(dateC==='' || titleC==='' || contentC==='') {
		    	  alert("모든 내용을 작성해주세요.");
		    	  return false;
		      } 		      
		      
		});
	</script>
</body>
</html>