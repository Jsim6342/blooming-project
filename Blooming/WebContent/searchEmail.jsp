<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>Blooming - ID 찾기</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- Bootstrap core CSS -->
   <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <!-- Fontawesome CSS -->
   <link href="css/all.css" rel="stylesheet">
   <!-- Custom styles for this template -->
   <link href="css/style.css" rel="stylesheet">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="css/util.css">
   <link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
   
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100 p-t-0 p-b-0">
            <form class="login100-form validate-form" action="LoginService" method="post">
               <span class="login100-form-title p-b-100">
                  ID 찾기
               </span>
               <a class="login100-form-avatar" href="index.jsp">
                  <img src="images/marigold.png"  alt="AVATAR">
               </a>

               <p class = "txt1 p-t-100 m-b-10" >가입하신 전화번호를 입력해주세요.</p>
               <div class="wrap-input100 validate-input m-b-100" data-validate="Enter tel">
                  <input class="input100" type="text" name="id_tel" placeholder= "*( - 을 제외한 숫자만 입력)">
                  <!-- <span class="focus-input100" data-placeholder="Password"></span> -->
               </div>

               <div class="container-login100-form-btn">
                  <input type="submit" value = "아이디 찾기" class="login100-form-btn">
               </div>

               <ul class="login-more p-t-60">
                  <li class="m-b-8">
                     <span class="txt1">
                        Forgot
                     </span>

                     <a href="#" class="txt2">
                        Username / Password?
                     </a>
                  </li>

                  <li>
                     <!-- <span class="txt1">
                        회원이 아니신가요?
                     </span> -->
                     
                     <a href="signup.html" class="txt2">
                        일반 회원가입 / 
                     </a>
                     <a href="c_signup.html" class="txt2">
                        전문가 회원가입
                     </a>
                  </li>
               </ul>
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
            <p class="copyright text-center">All Rights Reserved. &copy; 2020 <a href="#">Blooming</a> Design By : SINOZO, 9uack
            <a href="https://html.design/">html design</a>
            </p>
           
        </div>
    </footer>
     
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>