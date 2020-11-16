<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <title>Blooming - My Page</title>
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
         <div class="wrap-login100 p-t-0 p-b-10">
            <form class="login100-form validate-form" action = "MemberSignup" method = "post" >
               <span class="login100-form-title p-b-70">
                  My Page
               </span>
               <a class="login100-form-avatar" href="index.jsp">
                  <img src="images/marigold.png"  alt="AVATAR">
               </a>

               <div class="wrap-input100 validate-input m-t-55 m-b-35" data-validate = "Enter email">
                  <p class="input100" name="">이메일</p>
                  <p id="p1"></p>
               </div>
               
               <div class="wrap-input100 validate-input m-b-45" data-validate = "Enter tel">
                  <p class="input100" name="">전화번호</p>
               </div>

               <div class="wrap-input100 validate-input m-b-45" data-validate="Enter nickname">
                  <p class="input100" name="">활동명</p>
                  <p id="p2"></p>
               </div>
               <div class="wrap-input100 validate-input m-b-45" data-validate = "Enter password">
                  <input class="input100" type="password" name="" id = "" placeholder="변경할 비밀번호 입력">
               </div>
               <div class="container-login100-form-btn">
                  <input type="submit"  value = "가입하기" id = "signup_btn" class="login100-form-btn" >
               </div>

               <ul class="login-more p-t-60">
                  <li class="m-b-8">
                     <a href="searchEmail.jsp" class="txt2">
                        아이디 찾기 / 
                     </a>
                     <a href="searchPw.jsp" class="txt2">
                        비밀번호 찾기
                     </a>
                  </li>

                  <li>
                     
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
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
               <h5 class="headin5_amrc col_white_amrc pt2">Quick links</h5>
               headin5_amrc
               <ul class="footer_ul_amrc">
                  <li><a href="#">Default Version</a></li>
                  <li><a href="#">Boxed Version</a></li>
                  <li><a href="#">Our Team </a></li>
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Our Services</a></li>
                  <li><a href="#">Get In Touch</a></li>
               </ul>
               footer_ul_amrc ends here
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 ">
               <h5 class="headin5_amrc col_white_amrc pt2">Recent posts</h5>
               headin5_amrc
               <ul class="footer_ul_amrc">
                  <li class="media">
                     <div class="media-left">
                        <img class="img-fluid" src="images/post-img-01.jpg" alt="" />
                     </div>
                     <div class="media-body">
                        <p>How to find best dog food?</p>
                        <span>22 Sep 2018</span>
                     </div>
                  </li>
                  <li class="media">
                     <div class="media-left">
                        <img class="img-fluid" src="images/post-img-02.jpg" alt="" />
                     </div>
                     <div class="media-body">
                        <p>How to find best dog food?</p>
                        <span>34 Sep 2018</span>
                     </div>
                  </li>
                  <li class="media">
                     <div class="media-left">
                        <img class="img-fluid" src="images/post-img-03.jpg" alt="" />
                     </div>
                     <div class="media-body">
                        <p>How to find best dog food?</p>
                        <span>30 Sep 2018</span>
                     </div>
                  </li>
               </ul>
               footer_ul_amrc ends here
            </div>
         </div>
      </div> -->
        <div class="container">
            <div class="footer-logo">
            <a href="#"><img src="images/marigold4.png" alt="" /></a>
         </div>
            <!--foote_bottom_ul_amrc ends here-->
            <p class="copyright text-center">All Rights Reserved. &copy; 2020 <a href="#">Blooming</a> Design By : SINOZO, 9uack
            <a href="https://html.design/">html design</a>
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
<!-- Ajax를 사용하기 위한 Ajax import 부분 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
   <script type="text/javascript">
      function ajaxCall() { //ajax 함수 부분
         var emailCheck = document.getElementById("EmailCheck"); //id속성을 바탕으로 값 가져오기
         //alert(emailCheck.value);   //태그 값을 불러오는 함수는 .value이다. 그냥 txt1은 태그를 의미
      
         $.ajax({
            //ajax 통신 방식으로 데이터를 전송
            type : "get", //서버로 어떤 방식으로 호출할 것인지. get or post
            url : "EmailCheck", //어떤 서버페이지로 이 값을 보낼 것인지
            data : {"email" : emailCheck.value}, //보낼 데이터 지정
            dataType : "text",
            success : function(data) { //서버로 부터 받은 값
               var p1 = document.getElementById("p1");
               
               if(data=="true") { //반드시 true를 문자열로 덮어주어야 한다. (가져올 때 문자열로 가져옴)
                  
                  p1.style.cssText = "color:red"; //p1태그에 css문법을 사용해서 스타일을 적용하겠다. (자바스크립트 내에서 스타일 적용가능)
                  p1.innerHTML = "이미 사용중인 아이디입니다." //일반 태그에 값 입력할 때: innerHTML
                  
               }else {
                  
                  p1.style.cssText = "color:blue";
                  p1.innerHTML = "사용할 수 있는 아이디입니다." //일반 태그에 값 입력할 때: innerHTML
               }
            },
            error : function() {

            }
         });

      }
      
      function ajax2Call() { //ajax 함수 부분
         var nicknameCheck = document.getElementById("NicknameCheck"); //id속성을 바탕으로 값 가져오기
         //alert(emailCheck.value);   //태그 값을 불러오는 함수는 .value이다. 그냥 txt1은 태그를 의미
      
         $.ajax({
            //ajax 통신 방식으로 데이터를 전송
            type : "get", //서버로 어떤 방식으로 호출할 것인지. get or post
            url : "NicknameCheck", //어떤 서버페이지로 이 값을 보낼 것인지
            data : {"nickname" : nicknameCheck.value}, //보낼 데이터 지정
            dataType : "text",
            success : function(data) { //서버로 부터 받은 값
               var p1 = document.getElementById("p2");
               
               if(data=="true") { //반드시 true를 문자열로 덮어주어야 한다. (가져올 때 문자열로 가져옴)
                  
                  p1.style.cssText = "color:red"; //p1태그에 css문법을 사용해서 스타일을 적용하겠다. (자바스크립트 내에서 스타일 적용가능)
                  p1.innerHTML = "이미 사용중인 닉네임입니다." //일반 태그에 값 입력할 때: innerHTML
                  
               }else {
                  
                  p1.style.cssText = "color:blue";
                  p1.innerHTML = "사용할 수 있는 닉네임입니다." //일반 태그에 값 입력할 때: innerHTML
               }
            },
            error : function() {

            }
         });

      }
      

      
       $('form.login100-form').submit(function(){
           let emailC = $('#EmailCheck').val();
            let pwC = $('#PwCheck').val();
            let telC = $('#TelCheck').val();
            let nicknameC = $('#NicknameCheck').val();
            
            
            
             if(emailC==='' || pwC==='' || telC==='' || nicknameC==='') {
               alert("모든 항목을 채워주세요.");
               return false;
            }             
            
      }); 
      
   </script>
</body>
</html>