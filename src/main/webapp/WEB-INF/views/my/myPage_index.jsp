<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import = "com.solrecipe.recipe.user.domain.*" %>
<%
MemberVO member = (MemberVO)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 휴대폰 디스플레이를 위해 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
<!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    
    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
	

<style>
div.update_btn
{
   margin: auto;
   width: 5%;

}

.form-style-2 {
	max-width: 50%;
	
}

.form-style-2 label {
	display: block;
}

.form-style-2 label>span {

	font-weight: bold;
	float: left;
	padding-top: 8px;
	padding-right: 5px;
}





</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/jquery.sticky.js"></script>
  <script src="/resources/js/jquery.waypoints.min.js"></script>
  <script src="/resources/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/js/aos.js"></script>

  <script src="/resources/js/main.js"></script>
  <div class="site-wrap"  id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
      
    <jsp:include page = "../headNfoot/header.jsp"/> 
		
		<div class="subsite-section">
		      <div class="container">
		        <div class="row">
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_index.jsp" id="mypage"><h4 class="clickmy">회원정보</h4></a>
		              
		            </div>
		          </div>
		          
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            	
		              <a href="myPage_recipegram.jsp" id="myrecipegram"><h4 class="my">레시피그램</h4></a>
		             
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_recipe.jsp" id="myrecipe"><h4 class="my">레시피</h4></a>
		              
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_mark.jsp" id="mymark"><h4 class="my">찜</h4></a>
		              
		            </div>
		          </div>
		        </div>
		       </div>
		     </div>
		     
		     
	 <form method="post" action="/insertProfile" id="profile_form" name="profile_form" enctype="multipart/form-data">
					    
		<div class=" bg-light">  
	<!-- 아이디 -->
	
	<div class="content pt-5 pb-5">
		<div style="float: left; width: 50%; padding-left:25%">
			
					
					<div id="img_1"class="col-sm-10 col-md-10" align="center">
			           		<img src = "../img/user/base_user.png" width="200" id="user_img" name="user_img"
						style="margin-top: 30px;" class="img-circle" onclick="document.getElementById('img').click();"> <!-- 이미지버튼으로 파일첨부  -->
			         </div>
			           			
			           			<!-- 변경: name="mainimg" -->
			        <input type="file" id="img" name="img" style="display:none;" onchange="getThumbnailPrivew(this,$('#img_1'))">
			           			
			

				<div class="col-sm-10 col-md-10">
					<!-- https://www.sanwebe.com/2014/08/css-html-forms-designs -->
					<div class="sign_up_body" style="padding-top: 10px; ">
             	
				
                  	<div class="form_sign_up_group pt-5 pl-5">
                  	<div class="font-size-22 pb-3 text-left ">
                  		<sec:authentication property="principal.member.user_nickname"/> 
                  		<sec:authentication var="user_num" property="principal.member.user_num"/>
                  		<sec:authentication var="user_username" property="principal.username"/>
						<input type="hidden" id="user_num" name="user_num" value="${user_num }">
						<input type="hidden" id="user_username" name="user_username" value="${user_username }">
    					
		
					</div>
                     
							 <label
								for="field2"><span>자기소개 </span> <textarea name="user_intro"
									class="form-control" id="user_intro"rows="3">${user_info }</textarea></label> <br><br>
							<label class="checkbox-inline">
								  <input type="checkbox" id="isOpenchk" value="0"> 프로필 비공개
							</label>
							</div>
							
						
					</div>
				
				</div>
				
			</div>
		</div>
		<div class="verticalLine" style="border-left: thick solid #ff0000;">
		</div>
		<div
			style="float: left; width: 50%; border-left: 1px solid;">
			<div class="form-style-2" style="text-align: center;">
				<div class="sign_up_body" style="padding: 10px 50px;">
             	
				<sec:authentication var="user_num" property="principal.member.user_num"/>
						<input type="hidden" id="user_num" name="user_num" value="${user_num }">
    		
                  	<div class="form_sign_up_group">
                  	
                     
                     <label for="sign_pwd"><span class="font-size-15">비 밀 번 호</span>
                     <input type="password" class="form-control" id="user_password" placeholder="암호를 입력하세요.."></label><br>
                     
                     <label for="sign_pwdcheck"><span class="font-size-15">비밀번호확인</span>
                     <input type="password" class="form-control" id="user_password_check" placeholder="암호를 다시 입력해주세요.."></label><br>  
                    
                    <label for="sign_nickname"><span class="font-size-15">닉 네 임</span>
                     			<input type="text" class="form-control" id="user_nickname" name="user_nickname" value="${user_nickname }"> </label><br>
                     		 
                     
                     <label for="sign_name"><span class="font-size-15">이&emsp;&emsp;름</span>
                     <input type="text" class="form-control" id="user_name" name="user_name" value="${user_name }"></label><br>
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <br>
                     
                     
                  </div>
				
			</div>
		</div>
	</div>
	
		<div class="update_btn pt-5 pb-5">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button type="submit" id="update_submit" class="btn btn-success btn-block font-size-20 mt-5" >변  경</button> 
		</div>
	
	
	</div> 
	  </form>
	</div>
	
	<script>
 
 function update(){
	 var profile_form = document.profile_form;
	 var update_form = document.update_form;
	
	 var isopen = document.getElementById('isOpenchk').checked;  //false, true
	 if(isopen)
		 document.getElementById('isOpenchk').value = '1';
	 else
		 document.getElementById('isOpenchk').value = '0';
			
	 //update_form.action = "/updateUser";
	 profile_form.action = "/insertProfile";
			
	//update_form.submit();
	 profile_form.submit();
		
 }

 function getThumbnailPrivew(html, $target) {
	    if (html.files && html.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $target.css('display', '');
	            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
	            document.getElementById("user_img").src = e.target.result;
	            document.getElementById("user_img").style.width = "100%";
	            document.getElementById("user_img").style.height = "100%";
	            document.getElementById("user_img").style.paddingTop = "0%";
	            
	            //$target.html('<img src="' + e.target.result + '" border="0" alt="" style="width:100%; height:100%;"/>');
	    		
	        }
	        reader.readAsDataURL(html.files[0]);
	    }
	}

 </script>
	
<jsp:include page = "../headNfoot/footer.jsp"/> 
</body>
</html>