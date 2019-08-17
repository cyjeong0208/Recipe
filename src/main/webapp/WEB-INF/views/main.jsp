<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import = "java.util.ArrayList" %>

<%
	String[] search_ph = {"당근", "감자", "오이", "양파", "콩나물", "두부", "햄", "피망", "파프리카", "버섯", 
										"계란", "돼지고기", "오리고기", "닭고기", "어묵", "시금치", "배추"};
	int ran = (int)(Math.random()* search_ph.length);
	String ran_ph = search_ph[ran];

	String kakao_userid = (String)session.getAttribute("userId");
	String kakao_usernickname = (String)session.getAttribute("userNickname");
%>

<%
ArrayList<String> hp_img = (ArrayList<String>)request.getAttribute("hp_img");
ArrayList<String> hp_title = (ArrayList<String>)request.getAttribute("hp_title");
ArrayList<String> hp_cost = (ArrayList<String>)request.getAttribute("hp_cost");
ArrayList<String> hp_buy = (ArrayList<String>)request.getAttribute("hp_buy");

ArrayList<String> lt_img = (ArrayList<String>)request.getAttribute("lt_img");
ArrayList<String> lt_title = (ArrayList<String>)request.getAttribute("lt_title");
ArrayList<String> lt_buy = (ArrayList<String>)request.getAttribute("lt_buy");

ArrayList<String> em_img = (ArrayList<String>)request.getAttribute("em_img");
ArrayList<String> em_title = (ArrayList<String>)request.getAttribute("em_title");
ArrayList<String> em_cost = (ArrayList<String>)request.getAttribute("em_cost");
ArrayList<String> em_buy = (ArrayList<String>)request.getAttribute("em_buy");
%>

<!DOCTYPE html>
<html>
<head>
<title>자취방 레시피</title>
<meta charset="utf-8">
<!-- 사이즈 조절 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/style.css">
<!-- MetisMenu CSS -->
<link href="resources/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/sb-admin-2.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">


<style>

/*Font*/
body {
	font-family: 'Jua', sans-serif;
}

.search {
	margin-top: -250px;
}

/* -webkit-border-radius: 5px;
  			-moz-border-radius: 5px;
  			두개는 테두리를 둥글게  */
.text-center input#recipe_search {
	width: 115%;
	height: 7.0rem;
/* 	width: auto;
	height: auto; */
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: white;
	opacity: 0.5;
	border: none;
	margin-left: -50px;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.5rem;
	letter-spacing: 5px;
	padding-left: 10%;
}@media (max-width:500px){
	.text-center input#recipe_search{
		width: 90%;
		margin-left:3%;
	}
}

/* 클릭 시 파란테두리 없애기  */
.text-center input#recipe_search:focus, .text-center .icon #search_icon:focus, button#login, button#signup
	{
	outline: none;
}

/* placeholder */
.text-center .placeholder {
	padding-left: 20%;
	font-size: 1.5rem;
	color: #65737e;
}

/* z-index : 숫자가 적으면 뒤로 배치 크면 앞으로 배치 */
.text-center .icon {
	position: absolute;
	top: 10%;
	width: 75%;
	/* height: 30%; */
	margin-left: 55%;
	margin-top: 3%;
	z-index: 1;
}@media (max-width:500px){
	.text-center .icon {
	
		margin-left:42%;
	}
}

.text-center .icon #search_icon {
	height: 50px;
	width: 50px;
	opacity: 0.6;
}


/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}


/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
	height: auto;
}@media (max-width:500px){
	.modal-content{
		margin: 2% 5%; /* 15% from the top and centered */
		padding: 1%;
		width: 93%;
	}
}
.find-modal-content {
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
	height: auto;
}@media (max-width:500px){
	.find-modal-content{
		margin: 2% 5%; /* 15% from the top and centered */
		padding: 1%;
		width: 93%;
	}
}



.new-modal-content {
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
	height: auto;
}@media (max-width:500px){
	.new-modal-content{
		margin: 2% 5%; /* 15% from the top and centered */
		padding: 1%;
		width: 93%;
	}
}
.email_sign_up_content{
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}@media (max-width:500px){
	.email_sign_up_content{
		margin: 2%; /* 15% from the top and centered */
		padding: 1%;
		width: 93%;
	}
}

.sign_up_content {
	background-color: #fefefe;
	margin: 1% auto; /* 15% from the top and centered */
	padding: 1%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}@media (max-width:500px){
	.sign_up_content{
		margin: 2%; /* 15% from the top and centered */
		padding: 1%;
		width: 93%;
	}
}

.kakao_sign_up_content {
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
	height: auto;
}@media (max-width:500px){
	.find-modal-content{
		margin: 2% 5%; /* 15% from the top and centered */
		padding: 1%;
		width: 93%;
	}
}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/*로그인 상태 유지*/
.checkbox {
	clear: both;
	overflow: hidden;
}

.checkbox label {
	width: 100%;
	border-radius: 3px;
	border: 1px solid #D1D3D4;
	font-weight: normal;
}

.checkbox input[type="checkbox"]:empty {
	display: none;
}

.checkbox input[type="checkbox"]:empty ~ label {
	position: relative;
	line-height: 2.5em;
	text-indent: 3.25em;
	margin-top: 2em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.checkbox input[type="checkbox"]:empty ~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

.checkbox input[type="checkbox"]:hover:not (:checked ) ~ label {
	color: #888;
}

.checkbox input[type="checkbox"]:hover:not (:checked ) ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

.checkbox input[type="checkbox"]:checked ~ label {
	color: #777;
}

.checkbox input[type="checkbox"]:checked ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #333;
	background-color: #ccc;
}

.checkbox input[type="checkbox"]:focus ~ label:before {
	box-shadow: 0 0 0 3px #999;
}

.checkbox input[type="checkbox"]:checked ~ label:before {
	color: #fff;
	background-color: #FFC69F;
}
#index-back {
	position: fixed;
	top: 0px;
	left: 0px;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1000;
	overflow: hidden;
}

label#menu_label, #menu{
	display:none;
}

#nav{
	background-color:rgba(255, 255, 255, 0.7);
	padding-left:0;
}

@media (max-width:991.98px){
	#nav {position:absolute;  right:-12em; width:5.5em;}
	ul>li{
		display:block;
	}
	label#menu_label{
		display:block;
	}
	
	#menu:checked ~ #nav{right:0em; }
	#menu:checked ~ #recipe-section{margin-right:8.5em; margin-left:-8.5em;}
	
}

/*LoginModal 투명도*/
/* #loginModal {
	opacity: 0.9;
}

#email_signupModal{
	opacity: 0.9;
} */

.videoAtag{
	color: #939393;
}

.videoAtag:hover{
	color: #FFC69F;
}

.preview_img{
	width:100%;
}

/* 모달 스크롤바 다 지워버림 */
.modal::-webkit-scrollbar { 
    display: none; 
}

/* 메시지함 관련 */
.messageC{
	letter-spacing: 1px;
    word-spacing: 3px;
    line-heigh: 35px;
}
@media (max-width:500px){
	#message_tb{
		font-size:5px;
	}
	#msg_write{
		font-size:1rem;
	}
	.messageHeads{
		font-size:1rem !important;
	}
}

</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <script src="resources/js/jquery-3.3.1.min.js"></script>
  <script src="resources/js/jquery-ui.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/jquery.sticky.js"></script>
  <script src="resources/js/jquery.waypoints.min.js"></script>
  <script src="resources/js/jquery.animateNumber.min.js"></script>
  <script src="resources/js/jquery.cookie.js"></script>
  <script src="resources/js/aos.js"></script>

  <script src="resources/js/main.js"></script>
  <!-- Metis Menu Plugin JavaScript -->
	<script src="resources/js/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/js/sb-admin-2.js"></script>
  <script>
  $(document).ready(function(){
		var searchLabel = $(".text-center form#searchText label").remove().text();
		$(".text-center input#recipe_search").addClass("placeholder").val(searchLabel).focus(function(){
			if(this.value == searchLabel) {
				$(this).removeClass("placeholder").val("");
			};
		}).blur(function(){
			if(this.value == "") {
				$(this).addClass("placeholder").val(searchLabel);
			}
		});

		/* 아무것도 입력하지 않았을 때 submit버튼 누르면 넘어가는 값이 공백.. */
		$(".text-center form#searchText").submit(function(){
			if($(".text-center input#recipe_search").val() == searchLabel) {
				$(".text-center input#recipe_search").val("");
			}
		});
		
			  
	});

</script>
    <jsp:include page = "customLogin.jsp"/>
		
		<jsp:include page = "email_signUp.jsp"/>
		
		<jsp:include page = "signUp.jsp"/>
		
		<jsp:include page = "kakaosignUp.jsp"/>
		
		<jsp:include page = "findPW.jsp"/>
		
		<jsp:include page = "newPW.jsp"/>
			
  <div class="site-wrap"  id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
      
   <!-- Header -->
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="row align-items-center position-relative">
          <!-- 로고 -->
                
         	 <div class="site-logo">
              <a href="main.jsp" class="text-black nav-link"><span class="text-primary">자취방 레시피</span></a>
            </div>
			
			
			<!-- main 메뉴 아이콘  -->            
              <nav class="site-navigation text-center ml-auto" role="navigation">
				<label for="menu" id="menu_label">
				 <img src="img/header/menu.png" style="width:25%">
				</label>
				<input type="checkbox"id="menu">
				
			      <ul class="site-menu main-menu js-clone-nav  d-lg-block" id="nav">
			       
                  <!-- id이용하여 이동  recipe-section부분은 이동 어디로?? 레시피페이지는 어디서 이동???-->
                  <li><a href="recipe_index.do" id="recipe_link" class="nav-link"><img src="img/header/recipe.png" height="40px"/></a></li>
                  <li><a href="#foodvideo-section" id="video_link" class="nav-link"><img src="img/header/foodvideo.png" height="40px"/></a></li>
                  <li><a href="#recipegram-section" id="recipegram_link" class="nav-link"><img src="img/header/recipegram.png" height="40px"/></a></li>
                  <li><a href="#salething-section" id="sale_link" class="nav-link"><img src="img/header/salething.png" height="40px"/></a></li>
                  <li><a href="chat/change_chat.jsp" id="chat_link" class="nav-link"><img src="img/header/chat.png" height="40px"/></a></li>
                  
                  
					

                  <!-- 로그인 시   -->
					<sec:authorize access="isAuthenticated()">
					
						
						<!-- 관리자시...  -->                  
                   		<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li>
								<a href="/admin_index"class="nav-link" id="nickname" style="border:none; color:#65737e; background:none"> 
									<sec:authentication property="principal.member.user_nickname"/> 
									
								</a>
							</li>
	                  		<li>
								<form action = "/customLogout" method = "post">   
									<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>               		
	                  				<button class="nav-link" id="logout" style="border:none; color:#65737e; background:none">로그아웃</button>
	                  			</form>
	                  		</li>
						</sec:authorize> 
						
						<!-- 일반 user -->
						<sec:authorize access="!hasRole('ROLE_ADMIN')">
							<li>
								<a href="/myPage_index"class="nav-link" id="nickname" style="border:none; color:#65737e; background:none">
									<sec:authentication property="principal.member.user_nickname"/>
									
								</a>
							</li>
	                  		<li>
								<form action = "/customLogout" method = "post">   
									<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>               		
	                  				<button class="nav-link" id="logout" style="border:none; color:#65737e; background:none">로그아웃</button>
	                  			</form>
	                  		</li>
						</sec:authorize>
					</sec:authorize>
					
					<!-- 비로그인 시  -->
					<sec:authorize access="isAnonymous()">
						
						<%
						// 카카오톡 로그인 
							if(kakao_userid != null){
						%>
						<li>
								<a href="/myPage_index"class="nav-link" id="nickname" style="border:none; color:#65737e; background:none">
									<%=kakao_usernickname %>
									
								</a>
							</li>
	                  		<li>
								<form action = "/kakao_logout" method = "post">   
									<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>               		
	                  				<button class="nav-link" id="logout" style="border:none; color:#65737e; background:none">로그아웃</button>
	                  			</form>
	                  		</li>
	                  		
	                  	<%}else{ %>
							<li><button class="nav-link" id="login" style="border:none; color:#65737e; background:none">로그인</button></li>
	                  		<li><button class="nav-link" id="signup" style="border:none; color:#65737e; background:none">회원가입</button></li>
	                	<%} %>
					</sec:authorize>
                  </ul>
              </nav>
          
            

          <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

        </div>
      </div>
      
      
    </header>

    
    <!-- recipe 영역  -->
    <div class="owl-carousel slide-one-item" id="recipe-section">

      <!-- Main Background Video -->
	<!-- <video id="index-back" preload="auto" loop autoplay muted>
		<source src="img/main1.mp4" type="video/mp4">
		<source src="img/main1.ogg" type="video/ogg">
	</video> 
	<div class="site-section-cover overlay img-bg-section" style="background-image: url('img/main/mainimg3.jpg'); " >
	-->
	
	
      <div class="site-section-cover overlay img-bg-section">
        <!-- 레시피부분 영상  -->
        <video id="index-back" preload="auto" loop autoplay muted>
		   <source src="img/main/main1.mp4" type="video/mp4">
		   <source src="img/main/main1.ogg" type="video/ogg">
		</video> 
		
		<!-- 레시피부분 검색바  -->
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center search">
      
                <!-- <span class="icon"><img src="img/main/search.png" /></span>
                <input type="text" id="recipe_search" /> -->
               <form id="searchText" method="post" action="/recipe_index">
					<!-- <input type="submit" id="search_btn" name="search_btn" >
					<span class="icon"><img src="img/main/search.png" /></span> -->
		
					<span class="icon">
						
							<input  TYPE="IMAGE" id="search_icon" src="img/main/search.png" value="Submit" >
					
					</span>
					<label for="recipe_search">지금은 <%=ran_ph %> time!!!</label>
					<input id="recipe_search" name="recipe_search">
					<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
				</form>
            </div>
          </div>
        </div>

      </div>

      <!-- <div class="site-section-cover overlay img-bg-section" style="background-image: url('img/main/mainimg4.jpg'); " >
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center">
              <h1>Investment Consulting</h1>      
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel minima quasi quisquam, alias doloremque magni.</p>    
              <p><a href="#" class="btn btn-white-outline border-w-2 btn-md">Get in touch</a></p>
            </div>
          </div>
        </div>

      </div> -->

    </div>
    
    
	<!-- 요리영상 영역  -->
    <div class="site-section bg-light" id="foodvideo-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <div class="block-heading-1">
              <h2>요 리 영 상</h2>
              <a href = "foodvideo_index">
            		<h3 class="text-right font-size-17 h4 mb-2"> + 더보기</h3></a>
            </div>
          </div>
        </div>
        <!-- top 6 영상출력  -->
        <div class="row fv_best">
<%--            <c:forEach var="bestfv" items="${Main_bestList }">
       <div class="col-lg-4 col-md-6 mb-4 mb-lg-0" data-aos="fade-up" >
            <div class="video-team-member-1 text-center rounded">
     		<!-- 마우스오버 시 재생 마우스아웃 시 스탑  -->
          	<!-- <video class="img-fluid" onmouseover="this.play()" onmouseout="this.pause()" autobuffer="true" width="400px" height="300px"muted>
          		<source src="img/foodvideo_test/foodvideo1.mp4" type="video/mp4" >
		   		<source src="img/foodvideo_test/foodvideo1.ogg" type="video/ogg" >
          	</video> -->
				 <div class="row col-auto"> 
					<a class="videoAtag" href='javascript:goDetail("${bestfv.video_num }")'>
						<span class="play_button"></span> 
						<img class="preview_img" src="${bestfv.video_thumbnail }" alt="preview_img"> 
						<span class="title" >${bestfv.video_title }</span>
					</a>
				 </div> 
          </div>
        </div>
        	
			</c:forEach>  --%>

          </div>
        </div>
      </div>
    </div>

	<!-- recipegram 영역  -->
     <div class="site-section" id="recipegram-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <div class="block-heading-1">
              <h2>레 시 피 그 램</h2>
                <a href = "recipegram_index">
            		<h3 class="text-right font-size-17 h4 mb-2"> + 더보기</h3></a>
            </div>
          </div>
        </div>
        <!-- new 레시피그램 3개 출력  -->
        <div class="row rg_list3">
         <%--  <div class="col-lg-4 col-md-6 mb-4 mb-lg-0" data-aos="fade-up">
            <div class="block-team-member-1 text-center rounded">
    			<!-- 메인사진 출력  -->
    			<c:forEach var="List_rg" items="Main_rgList" >
                <!-- <img src="img/main/mainimg1.jpg" alt="Image" class="img-fluid"> -->
                <img src="./upload/${List_rg.img_name }">
           
              <!-- <h3 class="font-size-20 text-white">test</h3> -->
              <!-- 닉네임 출력  -->
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-20 mb-3">${List_rg.user_nickname }</span>
              <!-- 내용 몇글자 출력 ? -->
              <p class="px-3 mb-3">${list_rg.recipegram_content}<!-- 오랜만에 만든 요리~ 우아아아ㅏ아아아아아ㅏ아아아아아ㅏ아아아아!!!!!!! 다들 해보세요!!!!! .... --></p>
              </c:forEach>
            </div>
          </div>  --%>

<!--           <div class="col-lg-4 col-md-6 mb-4 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
            <div class="block-team-member-1 text-center rounded">
            
                <img src="img/main/mainimg1.jpg" alt="Image" class="img-fluid">
              <h3 class="font-size-20 text-white">test</h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-20 mb-3">레시피</span>
              <p class="px-3 mb-3">오랜만에 만든 요리~ 우아아아ㅏ아아아아아ㅏ아아아아아ㅏ아아아아!!!!!!! 다들 해보세요!!!!! ....</p>
              
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0" data-aos="fade-up" data-aos-delay="200">
            <div class="block-team-member-1 text-center rounded">
        
                <img src="img/main/mainimg1.jpg" alt="Image" class="img-fluid">
      
              <h3 class="font-size-20 text-white">test</h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-20 mb-3">자취방</span>
              <p class="px-3 mb-3">오랜만에 만든 요리~ 우아아아ㅏ아아아아아ㅏ아아아아아ㅏ아아아아!!!!!!! 다들 해보세요!!!!! ....</p>
              
            </div>
          </div> -->
        </div>
      </div>
    </div>
    
    <!-- 할인정보 영역  -->
    <div class="site-section bg-light" id="salething-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <div class="block-heading-1">
            
              <h2>할 인 정 보</h2>
              	<a href = "/salething_homeplus">
            		<h3 class="text-right font-size-17 h4 mb-2"> + 더보기</h3></a>
            
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4 mb-4">
            <span class="icon-signal d-block mb-3 display-3 text-secondary"></span>
            <h3 class="text-primary h4 mb-2">홈플러스</h3>
           
            <hr/>
           
          </div>
          <div class="col-md-6 col-lg-4 mb-4">
            <span class="icon-anchor d-block mb-3 display-3 text-secondary"></span>
            <h3 class="text-primary h4 mb-2">롯데마트</h3>
			<hr/>
          </div>
          <div class="col-md-6 col-lg-4 mb-4">
            <span class="icon-magnet d-block mb-3 display-3 text-secondary"></span>
            <h3 class="text-primary h4 mb-2">이마트</h3>
            <hr/>
          </div>
		
			<!-- 해당 링크로 이동  -->
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0" data-aos="fade-up" >
            <div class="block-team-member-1 text-center rounded">
            
                <img src=<%= hp_img.get(0) %> alt="Image" class="img-fluid" style="height:227px;">
             
              <h3 class="font-size-20 text-center mb-4 mt-4"><%= hp_title.get(0)%></h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-14 mb-2">판매가 : <%=hp_cost.get(0) %></span>
              <p class="px-3 font-size-17 mb-3">할인가격 : <%=hp_buy.get(0) %>원</p>
              
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
            <div class="block-team-member-1 text-center rounded">
            
                <img src=<%=lt_img.get(0) %> alt="Image" class="img-fluid" style="height:227px;">
 
              <h3 class="font-size-20 text-center mb-4 mt-4"><%=lt_title.get(0) %></h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-14 mb-2"></span>
              <p class="px-3 font-size-17 mb-3">할인가격 : <%=lt_buy.get(0) %>원</p>
              
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0" data-aos="fade-up" data-aos-delay="200">
            <div class="block-team-member-1 text-center rounded">
            
                <img src=<%=em_img.get(0) %> alt="Image" class="img-fluid" style="height:227px;">
                
              <h3 class="font-size-20 text-center mb-4 mt-4"><%= em_title.get(0)%></h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-14 mb-2">판매가 : <%=em_cost.get(0) %>원</span>
              <p class="px-3 font-size-17 mb-3">할인가격 :<%=em_buy.get(0) %>원</p>
              
            </div>
          </div>

        </div>
      </div>
    </div>
    
    <!-- kakao chk -->
    <input type="hidden" id="chkKakao" value="<%=session.getAttribute("chkKakao") %>">
    
	<jsp:include page = "headNfoot/footer.jsp"/> 
	
<script type="text/javascript">

	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";
	
	$.ajax({
		url:'/main_rgList',
		type:'GET',
		dataType:'json',
		contentType:'application/x-www-form-urlencoded;charset=utf-8',
		success:function(data){
			$.each(data, function(index, item){
				console.log(item);
				$.each(item.imgList, function(val1, val2){
					console.log(val2.img_name);	
					$.each(item.hashList, function(val3, val4){
						console.log(val4.hash_name);
					$('.rg_list3').append("<div class='col-lg-4 col-md-6 mb-4 mb-lg-0' data-aos='fade-up'>"
							+"<div class='block-team-member-1 text-center rounded'>"
							+"<img src='./upload/" + val2.img_name + "' alt='Image' class='img-fluid' style='width:100%;height:235px;'>"
							+"<span class='d-block font-gray-5 letter-spacing-1 text-uppercase font-size-20 mb-3'>"
							+item.user_nickname + "</span>"
							+"<p class='px-3 mb-3'>" + val4.hash_name + "</p>"
							+"</div>"
							+"</div>"
					)
					});
				});
				
			});
		}
	})
</script>
	
<script type="text/javascript">

	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";
	
	$.ajax({
		url:'/main_fvList',
		type:'GET',
		dataType:'json',
		contentType:'application/x-www-form-urlencoded;charset=utf-8',
		success:function(data){
			$.each(data, function(index, item){
				$('.fv_best').append("<div class='col-lg-4 col-md-6 mb-4 mb-lg-0' data-aos='fade-up' >"
						+"<div class='video-team-member-1 text-center rounded'>"
						+"<div class='row  col-auto'> "
						+"<a class='videoAtag' href='javascript:goDetail(" + item.video_num + ")'>"
						+"<span class='play_button'></span> "
						+"<img class='preview_img' src=" + item.video_thumbnail + " alt='preview_img'>"
						+"<span class='title' >" + item.video_title + "</span>"
						+"</a>"
						+"</div>"
						+"</div>"
						+"</div>")
			});
		}
	})
</script>

<script>

//메인에서 요리영상 썸네일 클릭 시 detail로 이동
function goDetail(video_num){
	location.href="foodvideo_detail?video_num="+video_num;
}

var modal = document.getElementById('loginModal');
var modal_email = document.getElementById('email_signupModal');
var modal_sign_up = document.getElementById('sign_up_Modal');
var modal_findPW = document.getElementById('findPWModal');
var modal_newPW = document.getElementById('newPWModal');
var modal_kakao_sign_up = document.getElementById('kakao_sign_up_Modal');



var span1 = document.getElementsByClassName("close")[0];
var span2 = document.getElementsByClassName("close")[1];
var span3 = document.getElementsByClassName("close")[2];
var span4 = document.getElementsByClassName("close")[3];
var span5 = document.getElementsByClassName("close")[4];
var span6 = document.getElementsByClassName("close")[5];

//카카오톡 로그인   ... 
var chkKakao = document.getElementById('chkKakao').value;
console.log("chk kakao : " + chkKakao);
if(chkKakao == "-1"){
	console.log("if chk kakao : " + chkKakao);

	modal_kakao_sign_up.style.display = "block";
}



$('#login').click(function() {

	  modal.style.display = "block";
	 /*  $(this).css('z-index', 3000); */
   
});
//회원가입 눌렀을때 이메일 인증 먼저 
$('#signup').click(function() {
   modal.style.display = "none";
   modal_email.style.display = "block";

});

//비밀번호 찾 
$('#findPW_btn').click(function() {

   modal.style.display = "none";
   modal_findPW.style.display = "block";

});

//비밀번호 찾기 다음 
/* $('#find_btn').click(function() {

	modal_findPW.style.display = "none";
   modal_newPW.style.display = "block";

}); */

span1.onclick = function() {
	   modal.style.display = "none";
	   }
	 span2.onclick = function() {
		 modal_email.style.display = "none";
	}
	 span3.onclick = function() {
		 modal_sign_up.style.display = "none";
	}
	 span4.onclick = function() {
		 modal_kakao_sign_up.style.display = "none";
	}
	 span5.onclick = function() {
		 modal_findPW.style.display = "none";
	}
	 span6.onclick = function() {
		 modal_newPW.style.display = "none";
	} 
	window.onclick = function(event) {
	   if (event.target == modal) {
	      modal.style.display = "none";
	   } else if (event.target == modal_email) {
		   modal_email.style.display = "none";
	   } else if (event.target == modal_sign_up) {
		   modal_sign_up.style.display = "none";
	   } else if (event.target == modal_sign_up) {
		   modal_findPW.style.display = "none";
	   } else if (event.target == modal_sign_up) {
		   modal_newPW.style.display = "none";
	   } else if (event.target == modal_sign_up) {
		   modal_kakao_sign_up.style.display = "none";
	   }
	}

$("#login_button").on("click", function(e){

	e.preventDefault();
	$("#login_form").submit();
});


//로그인 페이지에 있는 회원가입 버튼 - 이메일 인증 페이지로 이동
$("#sign_up_btn").on("click", function(e){

	modal.style.display = "none";
	
	modal_email.style.display = "block";
});

/* //회원가입 페이지에서 이메일 인증 페이지로 이동
$("#move_email").on("click", function(e){

	modal_sign_up.style.display = "none";
	
	modal_email.style.display = "block";
}); */



//이메일 인증 페이지에 있는 다음 버튼 - 회원가입이지로 이동 
$("#signup_btn").on("click", function(e){
	var cnt =0;
	$.ajax({
             type: "get",
             url: "/mail/move",
             contentType:'application/json; charset=UTF-8',
             dataType:'json',
            
             success: function(data) {
            	 console.log(data);
            	 //map
            	 $.each(data, function(idx, val) {
            		 //list
            		 //$('#user_username').val(idx);
            		
            		 $.each(val, function(val1, val2) {
                		 
            			//val1 : index
            			//val2 : value
            			console.log(idx);
            			console.log("val1" + val1); 
            			console.log("val2" + val2); // val1:1 = > 인증번호 체크  1 : ok // val1:0 => email 중복확인   0 : ok
            	
            			
            			//email 중복....
            			if(val1 == 0){
            				if(val2 != 0){
								
                				$("#email_chk_text").css("display", "inline");
                				$("#joinCode_chk_text").css("display", "none");
                				
                				
                				$('#send_btn').removeAttr('disabled');
                				$('#check_btn').removeAttr('disabled');
                				
    							return false;
            				}
            				console.log("cnt : " + cnt);
            				cnt++;
            			}
            			//임시코드 일치하지 않음.... 
            			else if(val1 == 1){
            				if(val2 != 1){
            					$("#email_chk_text").css("display", "none");
            					$("#joinCode_chk_text").css("display", "inline");
                				
                				$('#send_btn').removeAttr('disabled');
                				$('#check_btn').removeAttr('disabled');
                				
                				
                				
                				return false;
                			}
            		
            				cnt++
            			}
            			if(cnt == 2){
            				
            				$('#user_username').val(idx);
            				
            				modal_email.style.display = "none";
            				modal_sign_up.style.display = "block";
            				
            				//return false;
            			}
        
            			


            		
            		 }); 
            		 
            	});
            	 
             }, error: function() {
                 alert('ajax err');
             }
         });
	/* modal_email.style.display = "none";
	modal_sign_up.style.display = "block"; */
    
});




$('#recipe_link').tooltip({title:"레시피",placement:"bottom"});
$('#video_link').tooltip({title:"요리 영상",placement:"bottom"});
$('#recipegram_link').tooltip({title:"레시피그램",placement:"bottom"});
$('#sale_link').tooltip({title:"할인정보",placement:"bottom"});
$('#chat_link').tooltip({title:"채팅방",placement:"bottom"});
</script>

  </body>
</html>
