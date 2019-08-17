<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
String kakao_userid = (String)session.getAttribute("userId");
String kakao_usernickname = (String)session.getAttribute("userNickname");

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
		<jsp:include page = "../customLogin.jsp"/>
		
		<jsp:include page = "../email_signUp.jsp"/>
		
		<jsp:include page = "../signUp.jsp"/>
		
		<jsp:include page = "../kakaosignUp.jsp"/>
		
		<jsp:include page = "../findPW.jsp"/>
		
		<jsp:include page = "../newPW.jsp"/>
<!-- Header -->
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

      <div class="container" style="font-family: 'Jua', sans-serif">
        <div class="row align-items-center position-relative">
          
            <!-- 로고 -->
            <div class="site-logo">
              <a href="/main" class="text-black"><span class="text-primary">자취방 레시피</span></a>
            </div>
				
			  <!-- main 메뉴 아이콘  -->            
              <nav class="site-navigation text-center ml-auto" role="navigation">
				<label for="menu" id="menu_label">
				 <img src="/img/header/menu.png" style="width:25%">
				</label>
				<input type="checkbox"id="menu">
				
			      <ul class="site-menu main-menu js-clone-nav  d-lg-block" id="nav">
			       
                  <!-- id이용하여 이동  recipe-section부분은 이동 어디로?? 레시피페이지는 어디서 이동???-->
                  <li><a href="/recipe_index" id="recipe_link" class="nav-link"><img src="/img/header/recipe.png" height="40px"/></a></li>
                  <li><a href="/foodvideo_index" id="video_link" class="nav-link"><img src="/img/header/foodvideo.png" height="40px"/></a></li>
                  <li><a href="/recipegram_index" id="recipegram_link" class="nav-link"><img src="/img/header/recipegram.png" height="40px"/></a></li>
                  <li><a href="/salething_homeplus" id="sale_link" class="nav-link"><img src="/img/header/salething.png" height="40px"/></a></li>
                  <li><a href="/change_index" id="chat_link" class="nav-link"><img src="/img/header/chat.png" height="40px"/></a></li>
                  
                  
					

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
	                  				<button class="nav-link" id="logout" style="border:none; color:#65737e; background:none; font-family: 'Jua', sans-serif;">로그아웃</button>
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
	                  				<button class="nav-link" id="logout" style="border:none; color:#65737e; background:none; font-family: 'Jua', sans-serif;">로그아웃</button>
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
      
      <!-- kakao chk -->
    <input type="hidden" id="chkKakao" value="<%=session.getAttribute("chkKakao") %>">
	
    </header>
    
    	
	
<script>
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
	 modal_findPW.style.display = "none";
}
 span5.onclick = function() {
	 modal_newPW.style.display = "none";
}
 span6.onclick = function() {
	 modal_kakao_sign_up.style.display = "none";
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
    