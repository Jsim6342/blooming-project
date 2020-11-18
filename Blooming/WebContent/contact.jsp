<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Blooming - 센터찾기</title>
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
					<li class="nav-item"><a class="nav-link" href="comments.jsp">극복후기</a>
					</li>
					<li class="nav-item "><a class="nav-link active" href="contact.jsp">센터찾기</a>
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
				센터찾기 <small>국가에서 인증받은 전문센터</small>
			</h1>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">
		<div class="breadcrumb-main">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
				<li class="breadcrumb-item active">센터찾기</li>
			</ol>
		</div>

		<!-- Content Row -->
		<div class="row">
		<!-- Contact Details Column -->
		
			<!-- Map Column -->
			<div class="col-lg-8 mb-4">
				<!-- Kakao Map -->
				
							
				
				<div id="map" style="width:100%;height:350px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5311b344ef03b736320ef18c05a8f976"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					    mapOption = { 
					        center: new kakao.maps.LatLng(35.171684, 126.897020), // 지도의 중심좌표
					        level: 8 // 지도의 확대 레벨
					    };
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					 
					// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
					var positions = [
					    {
					        content: '<div>심리건강연구소</div>', 
					        latlng: new kakao.maps.LatLng(35.137475, 126.925039)
					    },
					    {
					        content: '<div>전심연합심리상담센터</div>', 
					        latlng: new kakao.maps.LatLng(35.210439, 126.891318)
					    },
					    {
					        content: '<div>박앤정 임상심리클리닉</div>', 
					        latlng: new kakao.maps.LatLng(35.171684, 126.897020)
					    },
					    {
					        content: '<div>최영미 마음상담센터</div>',
					        latlng: new kakao.maps.LatLng(35.174180, 126.924916)
					    }
					];
					
					for (var i = 0; i < positions.length; i ++) {
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng // 마커의 위치
					    });
					
					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: positions[i].content // 인포윈도우에 표시할 내용
					    });
					    

					    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
					    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow, i));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
   				    
					}
					
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow, i) {
					    return function() {
					    	
					        infowindow.open(map, marker);
					            
					        var string = positions[i].content; // 포지션이라는 제이슨 리스트에서 제이슨 구조의 content내용의 태그 내용을 입력
					        var array = string.split(">");
					        var array1 = array[1].split("<");
					        var center_name = array1[0];
					        console.log(center_name);
					        
					        ajaxCall(center_name);
  
					        
					    };
					}
					
					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
					    return function() {
					        infowindow.close();
					    };
					}
					
					/* // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
					  var info1 = 

					  // 인포윈도우를 생성합니다
					  var info1 = new kakao.maps.Info({
					      content : iwContent,
					      removable : iwRemoveable
					  });

					  // 마커에 클릭이벤트를 등록합니다
					  kakao.maps.event.addListener(positions[0], 'click', function() {
					  }); */
					  
					</script>
			</div>
			
			<div class="col-lg-4 mb-4 contact-right">
						<h3>센터 정보</h3>
						<hr>
						<h6 id="center_info">마커에 마우스를 대면 센터 정보가 출력됩니다.</h6>
						
			</div>
			
			<!-- 나머지 3가지 센터들 정보, 마우스 클릭할때마다 변경되도록 해야함ㅠ-->
			<!-- <div class="col-lg-4 mb-4 contact-right">
						<h3 id="name">센터 정보</h3>
						<br>
						<h5 style="color:#4eae3a" id="name">
							전심연합심리상담센터 
						</h5><br>
						<h6 id="addr">
							주소 : 광주 북구 일곡마을로152번길 3-2 1층
						</h6><br>
						<h6 id="tel">
							전화번호 : 062-470-4774
						</h6><br>
						<h6 id="email">
							이메일 : ph07pen@gmail.com
						</h6><br>
						<h6 id="hours">
							영업시간 : 월~금 10:00 ~ 18:00
						</h6>
					</div>
					
			<div class="col-lg-4 mb-4 contact-right">
						<h3 id="name">센터 정보</h3>
						<br>
						<h5 style="color:#4eae3a" id="name">
							박앤정 임상심리클리닉 
						</h5><br>
						<h6 id="addr">
							주소 : 광주 북구 서암대로 113-2 2층
						</h6><br>
						<h6 id="tel">
							전화번호 : 062-514-8800
						</h6><br>
						<h6 id="email">
							이메일 : jung9386@hanmail.net
						</h6><br>
						<h6 id="hours">
							영업시간 : 정보없음
						</h6>
					</div>
					
					
			<div class="col-lg-4 mb-4 contact-right">
						<h3 id="name">센터 정보</h3>
						<br>
						<h5 style="color:#4eae3a" id="name">
							최영미 마음상담센터 
						</h5><br>
						<h6 id="addr">
							주소 : 광주 북구 동문대로 111 
						</h6><br>
						<h6 id="tel">
							전화번호 : 062-263-7942
						</h6><br>
						<h6 id="email">
							이메일 : 정보없음
						</h6><br>
						<h6 id="hours">
							영업시간 : 정보없음
						</h6>
					</div> -->				
			
		</div>
		<!-- /.row -->

		<!-- /.row -->

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
	<!-- Ajax를 사용하기 위한 Ajax import 부분  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
   <script type="text/javascript">
   
   function ajaxCall(center_name){
      
      
       //Ajax함수(미사용 부분. ajax 생성 시 참고용)
         $.ajax({
            //ajax 통신 방식으로 데이터를 전송
            type : "post", //서버로 어떤 방식으로 호출할 것인지. get or post
            url : "CenterCheck", //어떤 서버페이지로 이 값을 보낼 것인지
            data : {"center_name" : center_name}, //보낼 데이터 지정
            dataType : "json",
            success : function(center) { //서버로 부터 받은 값
            
            console.log(center);
            
            let html ="<br><h5 id='center_name' style='color:#4eae3a' id='name'>";
            html += center.center_name;
            html += "</h5><br>";
            
              
            html += "<h6 id='center_info'>주소: "+center.center_addr+"</h6><br>";
            html += "<h6 id='center_info'>전화번호: "+center.center_tel+"</h6><br>";
            html += "<h6 id='center_info'>이메일: "+center.center_email+"</h6><br>";
            html += "<h6 id='center_info'>영업시간: "+center.center_time+"</h6><br>";
            
            
            $('#center_info').html(html); //.html: 해당 태그에 값을 저장
            
            },
            error : function() {
               alert("ajax 통신 실패");
            }
         });
   }
         </script>
</body>
</html>