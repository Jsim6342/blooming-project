<%@page import="com.DAO.MemberDAO"%>
<%@page import="com.DTO.MemberDTO"%>
<%@page import="com.DAO.ConsultantDAO"%>
<%@page import="com.DTO.ConsultantDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
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
            <form class="login100-form validate-form">
               <span class="login100-form-title p-b-70">
                  My Page
               </span>
               <a class="login100-form-avatar" href="index.jsp">
                  <img src="images/marigold.png"  alt="AVATAR">
               </a>
				
				<% //스크립틀릿
 
 				//session값 email 가져오기
				String email = (String)session.getAttribute("email");
				System.out.println("현재 접속한 사람의 이메일: " + email);
				
				//session값 nickname 가져오기
				String nickname = (String)session.getAttribute("nickname");
				System.out.println("현재 접속한 사람의 닉네임: " + nickname);

				if(email==null) { // 회원일 경우
					
					MemberDTO member = new MemberDTO();
					MemberDAO mem_dao = new MemberDAO();
					member = mem_dao.return_member(nickname);
					
					out.print("<div class='wrap-input100 validate-input m-t-55 m-b-35' data-validate = 'Enter email'>");
					out.print("<p class='input100' name='show_email'>"+member.getEmail()+"</p>");
					out.print("</div>");
					out.print("<div class='wrap-input100 validate-input m-b-45'>");
					out.print("<p class='input100'>"+member.getNickname()+"</p>");
					out.print("</div>");
					out.print("<div class='wrap-input100 validate-input m-b-45'>");
					out.print("<p class='input100'>"+member.getTel()+"</p>");
					out.print("</div>");
					out.print("<div class='wrap-input100 validate-input m-b-45'>");
					out.print("<input class='input100' type='password' name='input_pw' placeholder='변경할 비밀번호 입력'>");
					out.print("</div>");
					out.print("<div class='container-login100-form-btn'>");
					out.print("<input type='button'  value = '비밀번호 수정하기' id = 'update_pw' class='login100-form-btn'>");
					out.print("</div>");
					out.print("<br>");
					out.print("<hr>");
					out.print("<br>");
					out.print("<div class='container-login100-form-btn'>");
					out.print("<input type='button' onclick='mem_check()'  value = '회원탈퇴' id = 'delete_mem' class='login100-form-btn' >");
					out.print("</div>");

					
					
				}
				
				if(nickname==null) { // 상담사일 경우
					
					ConsultantDTO consultant = new ConsultantDTO();
					ConsultantDAO con_dao = new ConsultantDAO();
					consultant = con_dao.return_name_location(email);
					
					out.print("<div class='wrap-input100 validate-input m-t-55 m-b-35' data-validate = 'Enter email'>");
					out.print("<p class='input100' name='show_email'>"+consultant.getCon_email()+"</p>");
					out.print("</div>");
					out.print("<div class='wrap-input100 validate-input m-b-45'>");
					out.print("<p class='input100'>"+consultant.getCon_name()+"</p>");
					out.print("</div>");
					out.print("<div class='wrap-input100 validate-input m-b-45'>");
					out.print("<p class='input100'>"+consultant.getCon_tel()+"</p>");
					out.print("</div>");
					out.print("<div class='wrap-input100 validate-input m-b-45'>");
					out.print("<p class='input100'>"+consultant.getLocation()+"</p>");
					out.print("</div>");
					out.print("<div class='wrap-input100 validate-input m-b-45'>");
					out.print("<p class='input100'>"+consultant.getLicense()+"</p>");
					out.print("</div>");
					out.print("<div class='wrap-input100 validate-input m-b-45'>");
					out.print("<input class='input100' type='password' name='input_pw' placeholder='변경할 비밀번호 입력'>");
					out.print("</div>");
					out.print("<div class='container-login100-form-btn'>");
					out.print("<input type='button'  value = '비밀번호 수정하기' id = 'update_pw' class='login100-form-btn'>");
					out.print("</div>");
					out.print("<br>");
					out.print("<hr>");
					out.print("<br>");
					out.print("<div class='container-login100-form-btn'>");
					out.print("<input type='button' onclick='con_check()' value = '회원탈퇴' id = 'delete_con' class='login100-form-btn' >");
					out.print("</div>");
					
				}
				

 				%>
				
             <!--  <div class="wrap-input100 validate-input m-t-55 m-b-35" data-validate = "Enter email">
                  <p class="input100" name="">이메일</p>
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
                  <input type="button"  value = "비밀번호 수정하기" id = "update_pw" class="login100-form-btn" >
               </div> 
               <br>
               <hr>
               <br>
               <div class="container-login100-form-btn">
                  <input type="submit"  value = "회원탈퇴" id = "delete_" class="login100-form-btn" >
               </div> -->

           
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

<%if(email==null) { //회원이면
 MemberDTO member = new MemberDTO();
 MemberDAO mem_dao = new MemberDAO();
 member = mem_dao.return_member(nickname); 
 %> 
 let now_pw = "<%=member.getPw() %>";  
 let nickname = "<%=member.getNickname() %>";  
 
 <%
}else { //상담사면
 ConsultantDTO consultant = new ConsultantDTO();
 ConsultantDAO con_dao = new ConsultantDAO();
 consultant = con_dao.return_name_location(email);
 %> 
 let now_pw = "<%=consultant.getCon_pw() %>";  
 let email = "<%=consultant.getCon_email() %>";  
 <%
 }%> 
	   


$('#update_pw').on('click',function(){
    
	 /*   let email = $('input[name="show_email"]').val();  */
	   let pw = $('input[name="input_pw"]').val();
	   

	   
	   if(pw==="") {
		   alert("수정할 비밀번호를 입력해주세요.");
	   }else{
		   
		 //Ajax함수
		    $.ajax({
		         //ajax 통신 방식으로 데이터를 전송
		         type : "post", //서버로 어떤 방식으로 호출할 것인지. get or post
		         url : "UpdatePw", //어떤 서버페이지로 이 값을 보낼 것인지
		         data : {"email" : email, "pw" : pw}, //보낼 데이터 지정
		         dataType : "text",
		         success : function(data) { //서버로 부터 받은 값
		         
		        	 alert("비밀번호가 변경되었습니다.");
		         	 location.href = "UpdatePw?email="+encodeURIComponent(encodeURIComponent(email),"UTF-8")+"&pw="+encodeURIComponent(encodeURIComponent(pw),"UTF-8");
		         
		         },
		         error : function() {
		            alert("ajax 통신 실패");
		         }
		      });   
	   }
 
});


function con_check(){
		if(confirm("정말로 탈퇴하시겠습니까?"))
		{
			
		 var pw = prompt('비밀번호를 입력해주세요.');
		 	if(pw==now_pw) {
		 		alert("그동안 블루밍을 이용해주셔서 감사합니다.");
		 		location.href = "Delete_Con?email="+encodeURIComponent(encodeURIComponent(email),"UTF-8");
		 	}else {
		 		alert("비밀번호가 일치하지 않습니다.");
		 	}
		 
		}else
		{
		alert('취소되었습니다.');
		}
	}
	
function mem_check(){
	if(confirm("정말로 탈퇴하시겠습니까?"))
	{
		
	 var pw = prompt('비밀번호를 입력해주세요.');
	 	if(pw==now_pw) {
	 		alert("그동안 블루밍을 이용해주셔서 감사합니다.");
	 		location.href = "Delete_Mem?nickname="+encodeURIComponent(encodeURIComponent(nickname),"UTF-8");
	 	}else {
	 		alert("비밀번호가 일치하지 않습니다.");
	 	}
	 
	}else
	{
	alert('취소되었습니다.');
	}
}

</script>
</body>
</html>