<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!-- 상단바, 하단바만 있는 페이지 -->
<!DOCTYPE html>
<html lang="en">
<head>

   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">
   <title>Blooming - 진단</title>
   <!-- Bootstrap core CSS -->
   <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <!-- Fontawesome CSS -->
   <link href="css/all.css" rel="stylesheet">
   <!-- Custom styles for this template -->
   <link href="css/style.css" rel="stylesheet">
   
   <meta name="viewport" content="width=device-width"/>
        <script src="https://unpkg.com/jquery"></script>
        <script src="https://surveyjs.azureedge.net/1.8.12/survey.jquery.min.js"></script>
        <!-- <link href="https://surveyjs.azureedge.net/1.8.12/modern.css" type="text/css" rel="stylesheet"/> -->
        <link rel="stylesheet" href="./css/diagnosis.css">
   		

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Blooming - 진단</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Fontawesome CSS -->
<link href="css/all.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">

<meta name="viewport" content="width=device-width" />
<script src="https://unpkg.com/jquery"></script>
<script src="https://surveyjs.azureedge.net/1.8.12/survey.jquery.min.js"></script>
<!-- <link href="https://surveyjs.azureedge.net/1.8.12/modern.css" type="text/css" rel="stylesheet"/> -->
<link rel="stylesheet" href="./css/diagnosis.css">


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
					<li class="nav-item "><a class="nav-link active" href="diagnosis.jsp">진단하기</a>
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
         <h1 class="mt-4 mb-3">진단하기
            <small>diagnosis</small>
         </h1>
      </div>
   </div>
  
  <!-- Page Content -->
    <div class="container">
      <div class="breadcrumb-main">
         <ol class="breadcrumb">
            <li class="breadcrumb-item">
               <a href="index.jsp">Home</a>
            </li>
            <li class="breadcrumb-item active">진단하기</li>
         </ol>
      </div>
     </div> 
     
	<div class="container">
		<form action="DiagnosisCheck" method = "post">
			<br>
			<br>
			<h3 style="color:#4eae3a">우울증 진단하기</h3>
			<br>
			<br>
			<h4>다음 문항을 읽고 각 번호의 선택지 중에서 요즘 자신에게 가장 적합하다고 생각되는 문항을 선택하세요.</h4>
			<br>
			<br>
			<h5>1.</h5>
			<input type="radio" name="1" value = "0"><label> 나는 슬프지 않다.</label><br>
			<input type="radio" name="1" value = "1"><label> 나는 슬프다.</label><br>
			<input type="radio" name="1" value = "2"><label> 나는 항상 슬프고 기운을 낼 수 없다.</label><br>
			<input type="radio" name="1" value = "3"><label> 나는 너무나 슬프고 불행해서 도저히 견딜 수 없다.</label>
			<br>
			<br>
			<h5>2.</h5>
			<input type="radio" name="2" value = "0"><label> 나는 앞날에 대해서 별로 낙심하지 않는다.</label><br>
			<input type="radio" name="2" value = "1"><label> 나는 앞날에 대해서 용기가 나지 않는다.</label><br>
			<input type="radio" name="2" value = "2"><label> 나는 앞날에 대해 기대할 것이 아무것도 없다고 느낀다.</label><br>
			<input type="radio" name="2" value = "3"><label> 나는 앞날은 아주 절망적이고 나아질 가망이 없다고 느낀다.</label>
			<br>
			<br>
			<h5>3.</h5>
			<input type="radio" name="3" value = "0"><label> 나는 실패자라고 느끼지 않는다.</label><br>
			<input type="radio" name="3" value = "1"><label> 나는 보통사람들보다 더 많이 실패한 것 같다.</label><br>
			<input type="radio" name="3" value = "2"><label> 내가 살아온 과거를 뒤돌아 보면, 실패투성이인 것 같다.</label><br>
			<input type="radio" name="3" value = "3"><label> 나는 인간으로서 완전한 실패자라고 느낀다.</label>
			<br>
			<br>
			<h5>4.</h5>
			<input type="radio" name="4" value = "0"><label> 나는 전과같이 일상생활에 만족하고 있다.</label><br>
			<input type="radio" name="4" value = "1"><label> 나의 일상생활은 예전처럼 즐겁지 않다.</label><br>
			<input type="radio" name="4" value = "2"><label> 나는 요즘에는 어떤 것에서도 별로 만족을 얻지 못한다.</label><br>
			<input type="radio" name="4" value = "3"><label> 나는 모든 것이 다 불만스럽고 싫증난다.</label>
			<br>
			<br>
			<h5>5.</h5>
			<input type="radio" name="5" value = "0"><label> 나는 특별히 죄책감을 느끼지 않는다.</label><br>
			<input type="radio" name="5" value = "1"><label> 나는 죄책감을 느낄 때가 많다.</label><br>
			<input type="radio" name="5" value = "2"><label> 나는 죄책감을 느낄때가 아주 많다.</label><br>
			<input type="radio" name="5" value = "3"><label> 나는  항상 죄책감에 시달리고 있다.</label>
			<br>
			<br>
			<h5>6.</h5>
			<input type="radio" name="6" value = "0"><label> 나는 벌을 받고 있다고 느끼지 않는다.</label><br>
			<input type="radio" name="6" value = "1"><label> 나는 어쩌면 벌을 받을지도 모른다는 느낌이 든다.</label><br>
			<input type="radio" name="6" value = "2"><label> 나는 벌을 받을 것 같다.</label><br>
			<input type="radio" name="6" value = "3"><label> 나는 지금 벌을 받고 있다고 느낀다.</label>
			<br>
			<br>
			<h5>7.</h5>
			<input type="radio" name="7" value = "0"><label> 나는 나 자신에게 실망하지 않는다.</label><br>
			<input type="radio" name="7" value = "1"><label> 나는 나 자신에게 실망하고 있다.</label><br>
			<input type="radio" name="7" value = "2"><label> 나는 나 자신에게 화가 난다.</label><br>
			<input type="radio" name="7" value = "3"><label> 나는 나 자신을 증오한다.</label>
			<br>
			<br>
			<h5>8.</h5>
			<input type="radio" name="8" value = "0"><label> 내가 다른 사람보다 못한 것 같지는 않다.</label><br>
			<input type="radio" name="8" value = "1"><label> 나는 나의 약점이나 실수에 대해서 나 자신을 탓하는 편이다.</label><br>
			<input type="radio" name="8" value = "2"><label> 내가 한 일이 잘못되었을 때는 언제나 나를 탓한다.</label><br>
			<input type="radio" name="8" value = "3"><label> 일어나는 모든 나쁜 일든은 다 내 탓이다.</label>
			<br>
			<br>
			<h5>9.</h5>
			<input type="radio" name="9" value = "0"><label> 나는 자살같은 것은 생각하지 않는다.</label><br>
			<input type="radio" name="9" value = "1"><label> 나는 자살할 생각을 생각을 가끔 하지만, 실제로 하지는 않을 것이다.</label><br>
			<input type="radio" name="9" value = "2"><label> 자살하고 싶은 생각이 자주 든다.</label><br>
			<input type="radio" name="9" value = "3"><label> 나는 기회만 있으면 자살하겠다.</label>
			<br>
			<br>
			<h5>10.</h5>
			<input type="radio" name="10" value = "0"><label> 나는 평소보다 더 울지는 않는다.</label><br>
			<input type="radio" name="10" value = "1"><label> 나는 전보다 더 많이 운다.</label><br>
			<input type="radio" name="10" value = "2"><label> 나는 요즈음 항상 운다.</label><br>
			<input type="radio" name="10" value = "3"><label> 나는 전에는 울고 싶을 때 울 수 있었지만 요즈음은 울래야 울 기력조차 없다.</label>
			<br>
			<br>
			<h5>11.</h5>
			<input type="radio" name="11" value = "0"><label> 나는 요즈음 평소보다 더 짜증을 내는 편은 아니다.</label><br>
			<input type="radio" name="11" value = "1"><label> 나는 요즈음 항상 짜증이 나고 귀찮아진다.</label><br>
			<input type="radio" name="11" value = "2"><label> 나는 요즈음 항상 짜증을 내고 있다.</label><br>
			<input type="radio" name="11" value = "3"><label> 전에는 짜증스럽던 일에 요즘은 너무 지쳐서 짜증조차 나지 않는다.</label>
			<br>
			<br>
			<h5>12.</h5>
			<input type="radio" name="12" value = "0"><label> 나는 다른 사람들에 대한 관심을 잃지 않고 있다.</label><br>
			<input type="radio" name="12" value = "1"><label> 나는 전보다 다른 사람들에 대한 관심이 줄었다.</label><br>
			<input type="radio" name="12" value = "2"><label> 나는 다른 사람들에 대한 관심이 거의 없어졌다.</label><br>
			<input type="radio" name="12" value = "3"><label> 나는 다른 사람들에 대한 관심이 완전히 없어졌다.</label>
			<br>
			<br>
			<h5>13.</h5>
			<input type="radio" name="13" value = "0"><label> 나는 평소처럼 결정을 잘 내린다.</label><br>
			<input type="radio" name="13" value = "1"><label> 나는 결정을 미루는 때가 전보다 많다.</label><br>
			<input type="radio" name="13" value = "2"><label> 나는 전에 비해 결정내리는 데에  더 큰 어려움을 느낀다.</label><br>
			<input type="radio" name="13" value = "3"><label> 나는 더 이상 아무 결정도 내릴 수가 없다.</label>
			<br>
			<br>
			<h5>14.</h5>
			<input type="radio" name="14" value = "0"><label>나는 전보다 내 모습이 나빠졌다고 느끼지 않는다.</label><br>
			<input type="radio" name="14" value = "1"><label> 나는 나이들어 보이거나 매력 없이 보일까봐 걱정한다.</label><br>
			<input type="radio" name="14" value = "2"><label> 나는 내 모습이 매력 없게 변해버린 것 같은 느낌이 든다.</label><br>
			<input type="radio" name="14" value = "3"><label> 나는 내가 추하게 보인다고 믿는다.</label>
			<br>
			<br>
			<h5>15.</h5>
			<input type="radio" name="15" value = "0"><label>나는 전처럼 일을 할 수 있다.</label><br>
			<input type="radio" name="15" value = "1"><label> 어떤 일을 시작하는 데에  전보다 더 많은 노력이 든다.</label><br>
			<input type="radio" name="15" value = "2"><label> 무슨 일이든 하려면 나 자신을 매우 심하게 채찍질해야만 한다.</label><br>
			<input type="radio" name="15" value = "3"><label> 나는 전혀 아무 일도 할 수가 없다.</label>
			<br>
			<br>
			<h5>16.</h5>
			<input type="radio" name="16" value = "0"><label> 나는 평소처럼 잠을 잘 수 있다.</label><br>
			<input type="radio" name="16" value = "1"><label> 나는 전에 만큼 잠을 자지는 못한다.</label><br>
			<input type="radio" name="16" value = "2"><label> 나는 전보다 한두시간 일찍 깨고 다시 잠들기 어렵다.</label><br>
			<input type="radio" name="16" value = "3"><label> 나는 평소보다 몇 시간이나 일찍 깨고, 한번 깨면 다시 잠들 수 없다.</label>
			<br>
			<br>
			<h5>17.</h5>
			<input type="radio" name="17" value = "0"><label>나는 평소보다 더 피곤하지는 않다.</label><br>
			<input type="radio" name="17" value = "1"><label>나는 전보다 더 쉽게 피곤해진다.</label><br>
			<input type="radio" name="17" value = "2"><label>나는 무엇을 해도 피곤해진다.</label><br>
			<input type="radio" name="17" value = "3"><label>나는 너무나 피곤해서 아무 일도 할 수 없다.</label>
			<br>
			<br>
			<h5>18.</h5>
			<input type="radio" name="18" value = "0"><label> 내 식욕은 평소와 다름없다.</label><br>
			<input type="radio" name="18" value = "1"><label> 나는 요즈음 전보다 식욕이 좋지 않다.</label><br>
			<input type="radio" name="18" value = "2"><label> 나는 요즈음 식욕이 많이 떨어졌다.</label><br>
			<input type="radio" name="18" value = "3"><label> 요즈음에는 전혀 식욕이 없다.</label>
			<br>
			<br>
			<h5>19.</h5>
			<input type="radio" name="19" value = "0"><label> 요즈음 체중이 별로 줄지 않았다.</label><br>
			<input type="radio" name="19" value = "1"><label> 전보다 몸무게가 2kg 가량 줄었다.</label><br>
			<input type="radio" name="19" value = "2"><label> 전보다 몸무게가 5kg 가량 줄었다.</label><br>
			<input type="radio" name="19" value = "3"><label> 전보다 몸무게가 7kg 가량 줄었다.</label>
			<br>
			<br>
			<h5>20.</h5>
			<input type="radio" name="20" value = "0"><label> 나는 건강에 대해 전보다 더 염려하고 있지는 않다.</label><br>
			<input type="radio" name="20" value = "1"><label> 나는 여러 가지 통증, 소화불량, 변비 등과 같은 신체적인 문제로 걱정하고 있다.</label><br>
			<input type="radio" name="20" value = "2"><label> 나는 건강이 염려되어 다른 일은 생각하기 힘들다.</label><br>
			<input type="radio" name="20" value = "3"><label> 나는 건강이 너무 염려되어 다른 일은 아무 것도 생각할 수 없다.</label>
			<br>
			<br>
			<h5>21.</h5>
			<input type="radio" name="21" value = "0"><label> 나는 요즈음 성에 대한 관심에 별다른 변화가 있는 것 같지는 않다.</label><br>
			<input type="radio" name="21" value = "1"><label> 나는 전보다 성(sex)에 대한 관심이 줄었다.</label><br>
			<input type="radio" name="21" value = "2"><label> 나는 전보다 성(sex)에 대한 관심이 상당히 줄었다.</label><br>
			<input type="radio" name="21" value = "3"><label> 나는 성(sex)에 대한 관심을 완전히 잃었다.</label>
			<br>
			<br>
			
			<div class="row mb-4">
				<div class="col-md-8"></div>
				<div class="col-md-4">
            	 <input type="submit" style="background-color: #aed581; border-color: #aed581" class="btn btn-lg btn-secondary btn-block" value="설문완료">
				</div>
			</div>
			
		</form>
	</div>     
     
       
    <!-- /.container -->
    <!--footer starts from here-->
    <footer class="footer">
        <div class="container bottom_border">
            <div class="row"></div>
               <!-- <div class="col-lg-3 col-md-6 col-sm-6 col">
					<h5 class="headin5_amrc col_white_amrc pt2">Find us</h5>
					headin5_amrc
					<p class="mb10">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
					<p><i class="fa fa-location-arrow"></i> 9878/25 sec 9 rohini 35 </p>
					<p><i class="fa fa-phone"></i> +91-9999878398 </p>
					<p><i class="fa fa fa-envelope"></i> info@example.com </p>
               </div>
               <div class="col-lg-3 col-md-6 col-sm-6 col">
					<h5 class="headin5_amrc col_white_amrc pt2">Follow us</h5>
					headin5_amrc ends here
					<ul class="footer_ul2_amrc">
						<li>
							<a href="#"><i class="fab fa-twitter fleft padding-right"></i> </a>
							<p>Lorem Ipsum is simply dummy printing...<a href="#">https://www.lipsum.com/</a></p>
						</li>
						<li>
							<a href="#"><i class="fab fa-twitter fleft padding-right"></i> </a>
							<p>Lorem Ipsum is simply dummy printing...<a href="#">https://www.lipsum.com/</a></p>
						</li>
						<li>
							<a href="#"><i class="fab fa-twitter fleft padding-right"></i> </a>
							<p>Lorem Ipsum is simply dummy printing...<a href="#">https://www.lipsum.com/</a></p>
						</li>
					</ul>
					footer_ul2_amrc ends here


	<!-- /.container -->
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
				</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>