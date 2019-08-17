<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import = "com.solrecipe.recipe.user.domain.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
	
	<script src="https://kit.fontawesome.com/d2c6942021.js"></script>

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

#pwCheckModal{
	display: none;
	position: fixed;
	z-index: 2000; /* Sit on top */
	left: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

#pwCheckModal-modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 1%;
	border: 1px solid #888;
	width: 700px; /* Could be more or less, depending on screen size */
	height: 300px;
}

#pwCheckBox{
	background-color: rgb(232, 240, 254);
	margin-top : 10%;
	width: 50%;
	height : 25%;
	font-size: 25px;
}
@media(max-width:500px){
	#pwCheckModal-modal-content {
		width:100%;
	}
	#leftSide{
		width:100% !important;
		padding-left : 0 !important;
	}
	#rightSide{
		border-top:1px solid !important;
		border-left:0px !important;
		width:100% !important;
	}
	#form_sign_up_left{
		padding-top : 1rem !important;
	}
	#sign_up_body_right{
		padding : 0 !Important;
	}
	.form-style-2{
		max-width : 100%;
	}
}

</style>
</head>

<jsp:include page="pwCheckModal.jsp" />

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
		            
		              <a href="/myPage_index" id="mypage"><h4 class="clickmy">회원정보</h4></a>
		              
		            </div>
		          </div>
		          
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            	
		              <a href="/myPage_recipegram" id="myrecipegram"><h4 class="my">레시피그램</h4></a>
		             
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="/myPage_recipe" id="myrecipe"><h4 class="my">레시피</h4></a>
		              
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="/myPage_mark" id="mymark"><h4 class="my">찜</h4></a>
		              
		            </div>
		          </div>
		        </div>
		       </div>
		     </div>
		     
		     
		     
		<div class=" bg-light">  
	<!-- 아이디 -->
	
	<form id="updateForm" name="updateForm" method="post" enctype = "multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type=hidden value="${myVO.user_num }"/>
	<div class="container content pt-5 pb-5">
		<div id='leftSide' class="col-md-6" style="float: left; width: 50%; padding-left:10%; margin-bottom: 3rem;">
			<div class="col-sm-10 col-md-10" align="center">
				<!-- 이미지 저장 위치 -> C:\KSworkspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SolRecipe\user-upload -->
					<img src="${myVO.user_img }" width="200" height="200"
						style="margin-top: 30px;" name="user_img" class="img-circle" id="profileImgPreview" onclick="document.getElementById('profileImg').click();"/>
					<input type="file" id="profileImg" style="display:none;" />
				</div>
				<div class="col-sm-10 col-md-10" align="center">
					<a href='javascript:deleteImg();'>이미지 삭제</a>
				</div>
				<div class="col-sm-10 col-md-10">
					<!-- https://www.sanwebe.com/2014/08/css-html-forms-designs -->
					<div class="sign_up_body" style="padding-top: 10px; ">
             	
				
                  	<div id="form_sign_up_left" class="form_sign_up_group pt-5 pl-5">
                  	<div class="font-size-22 pb-3 text-left ">
                  		<sec:authentication property="principal.username"/> 
					</div>
							 <label
								for="field2"><span>자기소개 </span> <textarea name="user_intro" id="sign_intro"
									class="form-control" rows="3" >${myVO.user_intro }</textarea></label> <br><br>
							<label class="checkbox-inline">
								<c:choose>
							 			<c:when test="${myVO.isopen eq 1}">
											<input type="checkbox" id="isopen" name="isopen" value="1" checked> 프로필 비공개
							 			</c:when>
							 			<c:otherwise>
							 				<input type="checkbox" id="isopen" name="isopen"value="1"> 프로필 비공개
							 			</c:otherwise>
							 		</c:choose>
							</label>
							</div>
					</div>
				</div>
			</div>
		<div id='rightSide' class="col-md-6"
			style="float: left; width: 50%; border-left: 1px solid;">
			<div class="form-style-2" style="text-align: center;">
				<div id = "sign_up_body_right" class="sign_up_body" style="padding: 10px 0px 0px 50px;">
             	
					
                  	<div class="form_sign_up_group">
                  	
                     
                     <label for="sign_pwd"><span class="font-size-15">비 밀 번 호 (수정)</span>
                     <input type="password" name = "user_pw" class="form-control" id="sign_password" placeholder="새로운 비밀번호"></label><br>
                     
                     <label for="sign_pwdcheck"><span class="font-size-15">비밀번호확인 (수정)</span>
                     <input type="password" class="form-control" id="sign_password_check" placeholder="새로운 비밀번호 확인"></label><br>  
                    
                    <label for="sign_nickname"><span class="font-size-15">닉 네 임</span>
                     			<input type="text" name = "user_nickname" class="form-control" id="sign_nickname" placeholder="${myVO.user_username }" value="${myVO.user_nickname }"> </label><br>
                     		 
                     
                     <label for="sign_name"><span class="font-size-15">이&emsp;&emsp;름</span>
                     <input type="text" name = "user_name" class="form-control" id="sign_name" placeholder="이름을 입력해주세요.." value="${myVO.user_name }"></label><br>
                     
                     <!-- <label for="sign_prelocation1"><span class="font-size-15">선호지역1</span>
                     <input type="button" class="btn btn-primary btn-xs"  onclick="sample4_execDaumPostcode1()" value="우편번호 찾기"> <br>
                     <input type="text" class="form-control" id="sign_prelocation1" placeholder="선호지역을 입력해주세요.."></label> <br>
                     
                     <label for="sign_prelocation2"><span class="font-size-15">선호지역2</span>
                     <input type="button" class="btn btn-primary btn-xs"  onclick="sample4_execDaumPostcode2()" value="우편번호 찾기"> <br> 
                     <input type="text" class="form-control" id="sign_prelocation2" placeholder="선호지역을 입력해주세요.."> </label>
                     <br>  --><br>
                     
                     
                  </div>
			</div>
		</div>
	</div>
	</div>
		<div class="update_btn pt-5 pb-5">
		
		</div>
	</form>
	<!-- 버튼이 form 바깥에 있어야 함(이유는 아무도 모름) -->
	<button id="update_submit" class="btn btn-success btn-block font-size-20 mt-5" >변  경</button> 
	
	
	
	</div>   
	</div>
<jsp:include page = "../headNfoot/footer.jsp"/> 

<script>
var imgchanged;
// 변수 초기화.
window.onload=function(){
	imgchanged = false;
}

// 이미지 업로드 시 미리보기
function imgPreview(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#profileImgPreview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#profileImg").change(function() {
    imgPreview(this);
});
// 이미지 삭제 시
var deleteImg = function(){
	$('#profileImgPreview').attr('src', 'user-upload/base_user.png');
	imgchanged = true;
}

// 수정된 정보 확인
$("#update_submit").click(function () {
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}"; 
	
	var pwCheckModal = document.getElementById('pwCheckModal');
	
	var user_intro= $("#sign_intro").val();
	
	var paw1= $("#sign_password").val();
	
	var paw2= $("#sign_password_check").val();
	
	var nickname= $("#sign_nickname").val();
	var originNickname = "${myVO.user_nickname}";
	var name= $("#sign_name").val();
	
	var passRule = /^[A-Za-z0-9]{8,15}$/;//숫자와 문자 포함 형태의 8~15자리 이내의 암호 정규식
	
	// 비밀번호 바꾸는 경우
	if(paw1 != "" && paw2 != ""){
		//정규식안맞는 경우 (비밀번호조건과 다를경우)
		if(!passRule.test(paw1)) {
		
			$("#sign_password").focus();		
			alert("비밀번호 조건을 확인하세요(숫자와 문자 포함 형태의 8~15자리 이내의 암호 정규식)");
		    return false;
		}	
		if(paw1 =="" || paw2 =="" || paw1 != paw2){
			
			$("#sign_password_check").focus();		
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
	}
	if(name =="" || name == null){
		
		$("#sign_name").focus();
		alert("이름을 입력하세요");
		return false;
	}

	if(name.length>10){
		
		$("#sign_name").focus();
		alert("이름은 10자 이내로 작성해주세요");
		return false;
	}
	
	// 닉네임 입력 안 되있을 경우 아이디로 초기화.
	if(nickname =="" || nickname == null){
		$("#sign_nickname").val("${myVO.user_username }");
	}
	
	if(nickname.length>10){
		
		$("#sign_nickname").focus();
		alert("닉네임은 10자 이내로 작성해주세요");
		return false;
	}
	
	if(user_intro.length > 50){
		
		$("#sign_intro").focus();
		alert("자기소개는 50자 이내로 작성해주세요");
		return false;
	}
	
	// 닉네임이 변경된 경우, ajax로 닉네임 중복 확인
	if(nickname != originNickname){
		$.ajax({
				type:"POST",
				async:false,
				url:"/checkNickname",
				data:{"user_nickname":nickname},
				dataType:"text",
				beforeSend: function(xhr) {
	                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	            }, 
				success: function(data){
					if(data == "bad"){
						$("#sign_nickname").focus();
						alert("이미 존재하는 닉네임입니다.");
						return false;
					}
				}
		});
	};
	
	// 문제가 없다면 비밀번호 확인 모달창을 띄운다.
	pwCheckModal.style.display = "block";
	
});

// 비밀번호 입력 후 확인 버튼 누르면.
$("#pwCheckBtn").click(function () {
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";
	
	var user_pw = $("#pwCheckBox").val();
	var user_num = ${myVO.user_num };
	// 비밀번호 없으면 다시 돌아감.
	if(user_pw == ""){
		$("#pwCheckBox").focus();
		alert("비밀번호 입력!");
		return false;
	}
	// 비밀번호 확인 ajax
	$.ajax({
		type:"POST",
		async:false,
		url:"/checkPW",
		data:{"user_pw":user_pw, "user_num":user_num},
		dataType:"text",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
		success: function(data){
			if(data == "bad"){
				$("#pwCheckBox").focus();
				alert("잘못된 비밀번호 입력");
				return false;
			}else{
				// 비밀번호가 제대로 입력되었으면, 모달창을 끄고 updateForm을 제출한다.
				pwCheckModal.style.display = "none";
				
				// form에 입력되있는 수정할 데이터를 보낸다. (ajax로 보냄.)
				var formData = new FormData();
				
				var inputFile = document.getElementById('profileImg');
				var fileList=inputFile.files;
				if(fileList && fileList[0]){
					var uploadFile =fileList[0];
					formData.append("uploadFile",uploadFile);
				}else if(imgchanged){
					var user_img = "user-upload/base_user.png"
					formData.append("user_img",user_img);
				}else{
					// 이미지가 업로드 되지 않은 경우에는 이전 필드값을 그대로 사용한다.
					var user_img = "${myVO.user_img }";
					formData.append("user_img",user_img);
				}
				
				var user_intro= $("#sign_intro").val();
				
				// 비공개 여부 체크됬으면 isopen을 1로, 아니면 0으로 초기화.
				if($("input:checkbox[id='isopen']").is(":checked")){
					var isopen = 1;
				}else{
					var isopen = 0;
				}

				var user_pw = $("#sign_password").val();
				
				var user_nickname= $("#sign_nickname").val();
				
				var user_name= $("#sign_name").val();
				
				formData.append("user_num", user_num);
				formData.append("user_intro", user_intro);
			    formData.append("isopen", isopen);
			    formData.append("user_pw", user_pw);
			    formData.append("user_nickname", user_nickname);
			    formData.append("user_name", user_name);
				
				$.ajax({
					type:"POST",
					async:false,
					url:"/updateProfile",
					data: formData,
					processData: false, 
				    contentType: false,
					beforeSend: function(xhr) {
		                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		            }, 
					success: function(data){
						if(data == "good"){
							alert("회원정보 수정 완료");
							location.reload();
						}else{
							alert("에러 발생");
							return false;
						}
					}
				});
			}
		}
	});
});

// pwCheckModal 종료
$('.close').click(function(){
	pwCheckModal.style.display = "none";
});
window.onclick = function(event) {
	if (event.target == pwCheckModal) {
		pwCheckModal.style.display = "none";
	}
};
  
</script>
</body>
</html>