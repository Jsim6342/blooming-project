<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ��ܹ�, �ϴܹٸ� �ִ� ������ -->
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">
   <title>Blooming - ���ܰ��</title>
   <!-- Bootstrap core CSS -->
   <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <!-- Fontawesome CSS -->
   <link href="css/all.css" rel="stylesheet">
   <!-- Custom styles for this template -->
   <link href="css/style.css" rel="stylesheet">
</head>
<body>

<% //��ũ��Ʋ��
 
 	//session�� email ��������
	String email = (String)session.getAttribute("email");
	System.out.println("���� ������ ����� �̸���: " + email);
	
	//session�� nickname ��������
	String nickname = (String)session.getAttribute("nickname");
	System.out.println("���� ������ ����� �г���: " + nickname);
	
 %>
    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-light top-nav fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
            <img src="images/marigold4.png" width="180px"; height="53px"; alt="logo" />
            </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="fas fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
               <ul class="navbar-nav ml-auto">
                   <li class="nav-item"><a class="nav-link" href="diagnosis.jsp">�����ϱ�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="diary.jsp">�ϱ��ۼ�</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							���ܻ�� </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="counsel.jsp">���ܻ�㿹��</a> <a
								class="dropdown-item" href="booking.jsp">���ܻ�� ������Ȳ</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="comments.jsp">�غ��ı�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">����ã��</a>
					</li>
					<%if(email==null&&nickname==null) {%>
					<li class="nav-item"><a class="nav-link" href="login.html">�α���</a>
					</li>
					<%}else { %>
					<li class="nav-item"><a class="nav-link" href="login.html">��������</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="LogoutService">�α׾ƿ�</a>
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
         <h1 class="mt-4 mb-3">���ܰ��
            <small></small>
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
            <li class="breadcrumb-item active">�����ϱ�</li>
         </ol>
      </div>
     <div>
     <div class="about-main">
			<div class="row">
				<div class="col-lg-6">
					<h2>����� ���� ������ �������Դϴ�.</h2>
					<p>������ ��� ���¶�� ������̶� ���� �ƴմϴ�.<br>� ���� ���� �� ���� ������ ������ ������ ������ ���������� ���Դϴ�.</p>
					<h5>Ȥ�� �����ǽó��� ?</h5>
					<ul>
						<li>������ ��̻�Ȱ�� ��ܺ�����.</li>
						<li>�ۿ� ���� ������ ��å�� �غ��ô°� ����.</li>
						<li>���� �Ϸ� �����̶� �ð��� ����������.</li>
						<li>�����ȯ�� ���� ������ ���.</li>
					</ul>
					<p>�������� �����¶�� ���ͼ� �����ǽó���.<br>����� ������ ���� ����� ������ �ٲ� �� �ֽ��ϴ�.<br>���� �����ϴ� �����ϱ⸦ ���� ���ο� ����ο��� ����� ���� �� ��Ű���.
					</p>
				</div>
				<div class="col-lg-6">
					<img class="img-fluid rounded" src="images/result2.jpg" alt="" />
				</div>
			</div>
			<!-- /.row -->
		</div>
     <br>
     <div class="row mb-4">
				<div class="col-md-8"></div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-secondary btn-block" href="diary.jsp">�ϱ⾲������</a>
				</div>
			</div>
     </div>
     	<div>
     	
     	</div>  
     </div>    
       
       
       
       
    <!-- /.container -->
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
            <!-- �� �Ʒ� footer SNS������ �̵� ul�±� -->
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
</body>
</html>