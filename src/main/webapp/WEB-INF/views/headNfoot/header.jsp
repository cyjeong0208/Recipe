<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
		//session에 객체로 아이디와유저네임을 넣어서 불러올수 잇게 
		String id = (String)session.getAttribute("username");
	 	
		%>
<head>	
<style>
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
}@media (max-width:500px){
	.modal-content{
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

label, #menu{
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
	label{
		display:block;
	}
	
	#menu:checked ~ #nav{right:0em; }
	#menu:checked ~ #recipe-section{margin-right:8.5em; margin-left:-8.5em;}
	
}

</style>

</head>		
		<jsp:include page = "../customLogin.jsp"/>
		
		<jsp:include page = "../email_signUp.jsp"/>
		
		<jsp:include page = "../signUp.jsp"/>
<!-- Header -->
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="row align-items-center position-relative">
          
            <!-- 로고 -->
            <div class="site-logo">
              <a href="../main.jsp" class="text-black"><span class="text-primary">자취방 레시피</span></a>
            </div>
				
			  <!-- main 메뉴 아이콘  -->            
              <nav class="site-navigation text-center ml-auto" role="navigation">
              <label for="menu" onclick>
				 <img src="../img/header/menu.png" style="width:25%">
				</label>
				<input type="checkbox"id="menu">
				

                <ul class="site-menu main-menu js-clone-nav  d-lg-block" id="nav">
                  <!-- id이용하여 이동  -->
                  <li><a href="../recipe_index.do" id="recipe_link" class="nav-link"><img src="../img/header/recipe.png" height="40px"/></a></li>
                  <li><a href="../foodvideo/foodvideo_index.jsp" id="video_link" class="nav-link"><img src="../img/header/foodvideo.png" height="40px"/></a></li>
                  <li><a href="#recipegram-section" id="recipegram_link" class="nav-link"><img src="../img/header/recipegram.png" height="40px"/></a></li>
                  <li><a href="../salething/salething_homeplus.jsp" id="sale_link" class="nav-link"><img src="../img/header/salething.png" height="40px"/></a></li>
                  <li><a href="../chat/change_index.jsp" id="chat_link" class="nav-link"><img src="../img/header/chat.png" height="40px"/></a></li>
                  
                  <li><button class="nav-link" id="login" style="border:none; color:#65737e;">로그인</button></li>
                  <li><button class="nav-link" id="signup" style="border:none; color:#65737e;">회원가입</button></li>
                  
                </ul>
              </nav>
          
            

          <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

        </div>
      </div>
      
      
    </header>
    
    	
	
<script>
var modal = document.getElementById('loginModal');
var modal_email = document.getElementById('email_signupModal');
var modal_sign_up = document.getElementById('sign_up_Modal');

var span1 = document.getElementsByClassName("close")[0];
var span2 = document.getElementsByClassName("close")[1];
var span3 = document.getElementsByClassName("close")[2];


$('#login').click(function() {

	  modal.style.display = "block";
	 /*  $(this).css('z-index', 3000); */
   
});
//회원가입 눌렀을때 이메일 인증 먼저 
$('#signup').click(function() {
   modal.style.display = "none";
   modal_email.style.display = "block";

});

 span1.onclick = function() {
   modal.style.display = "none";
   }
 span2.onclick = function() {
	 modal_email.style.display = "none";
}
 span3.onclick = function() {
	 modal_sign_up.style.display = "none";
}

window.onclick = function(event) {
   if (event.target == modal) {
      modal.style.display = "none";
   } else if (event.target == modal_email) {
	   modal_email.style.display = "none";
   } else if (event.target == modal_sign_up) {
	   modal_sign_up.style.display = "none";
   }
}

$("#login_button").on("click", function(e){

	e.preventDefault();
	$("form").submit();
});

//로그인 페이지에 있는 회원가입 버튼 - 이메일 인증 페이지로 이동
$("#sign_up_btn").on("click", function(e){

	modal.style.display = "none";
	
	modal_email.style.display = "block";
});

//이메일 인증 페이지에 있는 다음 버튼 - 회원가입이지로 이동 
$("#signup_btn").on("click", function(e){

	modal_email.style.display = "none";
	modal_sign_up.style.display = "block";
});

$('#recipe_link').tooltip({title:"레시피",placement:"bottom"});
$('#video_link').tooltip({title:"요리 영상",placement:"bottom"});
$('#recipegram_link').tooltip({title:"레시피그램",placement:"bottom"});
$('#sale_link').tooltip({title:"할인정보",placement:"bottom"});
$('#chat_link').tooltip({title:"채팅방",placement:"bottom"});
</script>
    