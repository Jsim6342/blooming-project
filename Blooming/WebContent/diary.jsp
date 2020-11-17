<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.DiaryDTO"%>
<%@page import="com.DAO.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
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

<!-- 해 자동 이미지 바꿈 -->
<script type="text/javascript">
      var img = new Array();
      img[0] = new Image();
      img[0].src = "images/sun.png";
      img[1] = new Image();
      img[1].src = "images/sun_2.png";
      img[2] = new Image();
      img[2].src = "images/sun_3.png";
      var interval = 500;
      var n = 0;
      var imgs = new Array("images/sun.png",
            "images/sun_2.png",
            "images/sun_3.png");
      function rotate() {
         if (navigator.appName == "Netscape" && document.getElementById) {
            document.getElementById("slide").src = imgs[n];
         } else
            document.images.slide.src = imgs[n];
         (n == (imgs.length - 1)) ? n = 0 : n++;
         setTimeout("rotate()", interval);
      }
</script>


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
<% 
DiaryDAO dao = new DiaryDAO();
 //스크립틀릿

//session값 email 가져오기
String email = (String)session.getAttribute("email");
System.out.println("현재 접속한 사람의 이메일: " + email);

//session값 nickname 가져오기
String nickname = (String)session.getAttribute("nickname");
System.out.println("현재 접속한 사람의 닉네임: " + nickname);
ArrayList<DiaryDTO> diaryList = dao.showDiaryDateScore(nickname);

%>
      
      
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['날짜', '점수'],
          <%
          if(nickname==null&&email==null) {%>
        	  ['1주차',0],
        	  ['2주차',1],
        	  ['3주차',1],
        	  ['4주차',0],
        	  ['5주차',1]
          <%}else {
          for(int i = 0;i<diaryList.size();i++) { 
        	    String di_date = diaryList.get(i).getDi_date();
          		int di_score = diaryList.get(i).getDi_score();
          		System.out.println(di_date);
          		System.out.println(di_score);
          		//out.println("['\""+di_date+"\"',"+di_score+"],");
          		if(i==diaryList.size()-1) { %>
          		 <%if(di_score==1) {%>
          		 ['<%=di_date%>😊',<%=di_score%>]
          		 <%}else {%>
          		 ['<%=di_date%>😗',<%=di_score%>]
          		<%}%>
          		<%}else {%>
          		 <%if(di_score==1) {%>
         		 ['<%=di_date%>😊',<%=di_score%>],
         		 <%}else {%>
         		 ['<%=di_date%>😗',<%=di_score%>],
          		<%}
                 }
                 }
                 }
                 %>
            
        
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
<body onload="rotate()">
<%-- <% //스크립틀릿
 
    //session값 email 가져오기
   String email = (String)session.getAttribute("email");
   System.out.println("현재 접속한 사람의 이메일: " + email);
   
   //session값 nickname 가져오기
   String nickname = (String)session.getAttribute("nickname");
   System.out.println("현재 접속한 사람의 닉네임: " + nickname);
   ArrayList<DiaryDTO> diaryList = dao.showDiaryDateScore(nickname);
 %> --%>
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
          <br> <img src="images/sun.png" id="slide"> 
          <%
          
          int score_sum = dao.diaryScore(nickname);
          
          if(score_sum>=0 && score_sum <=1) {
          %>
              <img id = "treeimage" class="img-fluid rounded " src="images/tree1.gif" alt="" />
          <%} else if(score_sum>=2 && score_sum<=4) { %>
              <img id = "treeimage" class="img-fluid rounded " src="images/tree2.gif" alt="" />
          <%} else if(score_sum>=5 && score_sum<=8) {%>
           		<img id = "treeimage" class="img-fluid rounded " src="images/tree3.gif" alt="" />
           <%} else if(score_sum>=9 && score_sum<=13) {%>
           <img id = "treeimage" class="img-fluid rounded " src="images/tree4.png" alt="" />
          	<%} else if(score_sum>=14 && score_sum<=19) {%>
          	<img id = "treeimage" class="img-fluid rounded " src="images/tree5.png" alt="" />
          	<%} else if(score_sum>=20) {%>
          	<img id = "treeimage" class="img-fluid rounded " src="images/tree6.png" alt="" />
          	<%} else { %>
          	<!-- sum이 음수인 경우 : 이미지 수정필요 -->
          	<img id = "treeimage" class="img-fluid rounded " src="images/tree1.gif" alt="" />
          	<%} %>
<!--               <img class="img-fluid rounded " src="images/tree2.gif" alt="" /> -->              
 
<!--               <img class="img-fluid rounded " src="images/tree3.gif" alt="" /> -->               
               		
            </div>
            <div class="col-lg-6">
                           <!-- <h2>나의 감성 그래프</h2>
            
                           <img class="img-fluid rounded" src="images/about.jpg" alt="" /> -->

               
               <h2>나의 이야기</h2>
               <p>머신러닝을 기반한 감성분석 시스템으로 당신의 하루의 감성을 분석해드립니다.</p>
               
               <h>날짜 선택 : </h>
               <input type="date" name='start_date' value='2020-11-10' date = 'yyyy-MM-dd'/>
               <h> ~ </h>
               <input type="date" name='end_date' value='2020-11-10' date = 'yyyy-MM-dd'/>
               <h><button id="search_btn" class="btn btn-primary">조회</button></h>
               <hr>
               <ul id="diarylist">
               <li>조회를 눌러주세요.</li>
               
                 
                  
               </ul>
               <hr>
               <%if(email==null&&nickname==null) {%>
               <a onclick="notice2()" href="#" class="btn btn-primary">일기 작성하기</a>
            	<%}else {%>
            	<a href="diaryWrite.jsp" class="btn btn-primary">일기 작성하기</a>
            	<% }%>
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
   <!-- Ajax를 사용하기 위한 Ajax import 부분  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
   <script type="text/javascript">
   
   $('#search_btn').on('click',function(){
      
	   let start_date = $('input[name="start_date"]').val();
	   let end_date = $('input[name="end_date"]').val();
      
       //Ajax함수(미사용 부분. ajax 생성 시 참고용)
         $.ajax({
            //ajax 통신 방식으로 데이터를 전송
            type : "post", //서버로 어떤 방식으로 호출할 것인지. get or post
            url : "DiaryShow", //어떤 서버페이지로 이 값을 보낼 것인지
            data : {"start_date" : start_date , "end_date" : end_date}, //보낼 데이터 지정
            dataType : "json",
            success : function(diaryList) { //서버로 부터 받은 값
               
            console.log(diaryList);
            
            let html ="";
            
            for(let i=0; i<diaryList.length; i++) {
               let diaryTitle = diaryList[i].di_title; //일기 제목 저장
               html += "<li><a href=diaryPost.jsp?di_num=" + diaryList[i].di_num + ">"+diaryTitle+'</li>';
            }
            
            $('#diarylist').html(html); //.html: 해당 태그에 값을 저장
            
            },
            error : function() {
               alert("ajax 통신 실패");
            }
         });
   });
   

   function notice2(){
		alert('회원만 이용 가능합니다. 로그인을 해주세요!');

	}
   
   <%-- $('#treeimage').on('ready',function(){
	      
	     let name = '<%=nickname%>';
	      
	      
	       //Ajax함수(미사용 부분. ajax 생성 시 참고용)
	         $.ajax({
	            //ajax 통신 방식으로 데이터를 전송
	            type : "post", //서버로 어떤 방식으로 호출할 것인지. get or post
	            url : "ScoreCheck", //어떤 서버페이지로 이 값을 보낼 것인지
	            data : {"nickname" : name}, //보낼 데이터 지정
	            dataType : "text",
	            success : function(data) { //서버로 부터 받은 값
	            console.log(data);
	            
	            
	            
	            },
	            error : function() {
	               alert("ajax 통신 실패");
	            }
	         });
	   }); --%>
   </script>
</body>
</html>