<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Blooming - 상담사 프로필 등록</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Fontawesome CSS -->
<link href="css/all.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>


	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-0 p-b-10">
				<form class="login100-form validate-form" action="ProfileSignup" method="post">
					<span class="login100-form-title p-b-70"> 상담사 프로필 등록 </span> <a
						class="login100-form-avatar" href="index.jsp"> <img src="images/marigold.png" alt="AVATAR">
					</a>

					<!-- <div class="wrap-input100 validate-input m-t-65 m-b-35"
						data-validate="Enter email">
						<input class="input100" type="text" name=""
							placeholder="학력">
					</div> -->
					
					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter pro_date">
						<input class="input100" type="text" name="pro_date" placeholder= "상담진행 희망일시 ex)2020-11-11 오후 7시">
						<!-- <span class="focus-input100" data-placeholder="Username"></span> -->
					</div>
					<div class="wrap-input100 validate-input m-t-45 m-b-35" data-validate = "Enter max_people">
						<input class="input100" type="text" name="max_people" placeholder= "최대상담인원">
						<!-- <span class="focus-input100" data-placeholder="Username"></span> -->
					</div>
					
					<div class="control-group form-group">
							<div class="controls">
								<label>학력/이력</label>
								<textarea rows="5" cols="30" class="form-control"
									name="background" id="content" required
									data-validation-required-message="Please enter your message"
									maxlength="100" style="resize: none"></textarea>
							</div>
						</div>
					
					<div class="control-group form-group">
							<div class="controls">
								<label>상담소개</label>
								<textarea rows="10" cols="30" class="form-control"
									name="introduce" id="content" required
									data-validation-required-message="Please enter your message"
									maxlength="100" style="resize: none"></textarea>
							</div>
						</div>
					<div class="container-login100-form-btn">
						<input type="submit" value="프로필 등록" class="login100-form-btn" >
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

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