<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<head>



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

		<div id="newPWModal" class="modal">
	
 		
	<!-- Login Modal -->
			<div class="new-modal-content block-heading-1">
				<span class="close">&times;</span>
				<h2 align="center">비 밀 번 호 변 경</h2>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="newpw_form" method = "post" >
				
						<div class="form-group">
							<label for="new_password">새로운 비밀번호 </label>&emsp; <span class="font-size-12 text-right" id="new_pwd_qual">영어 + 숫자 8 ~  15자 </span>
							<br> <p id="new_pw_chk_text" style="display:none; color:#FFA19D;" >패스워드 조건을 확인해주세요.</p><br> 
							<input type="password" class="form-control" id="new_password" name = "new_password" placeholder="비밀번호를 입력하세요..." autofocus>
						</div>
						<div class="form-group">
							<label for="new_chk_password">새로운 비밀번호 확인</label> 
							<br> <p id="new_pwchk_chk_text" style="display:none; color:#FFA19D;" >패스워드와 일치하지 않습니다.</p> <br> 
							<input type="password" class="form-control" id="new_chk_password" name="new_chk_password" placeholder="비밀번호를 다시 입력하세요...">
						</div>
						
						
						
                     
                     <input type="button" id="pw_submit" class="btn btn-success btn-block" value="비밀번호 변경">
						
					
						<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					</form>
				</div>
				
				

		</div>

	</div>


<script type="text/javascript">
	$("#pw_submit").on("click", function (e) {
		
		var paw1= $("#new_password").val();
		
		var paw2= $("#new_chk_password").val();
		var find_username= $("#find_username").val();
		
		
	

		
		var passRule = /^[A-Za-z0-9]{8,15}$/;//숫자와 문자 포함 형태의 8~15자리 이내의 암호 정규식
		 
		//정규식안맞는 경우 (비밀번호조건과 다를경우)
		if(!passRule.test(paw1)) {
		
			$("#new_password").css("background-color", "#FFA19D");
			$("#new_pwd_qual").css("color", "#FFA19D");
			$("#new_pw_chk_text").css("display", "inline");
			
		    return false;
		}	
		if(paw1 =="" || paw2 =="" || paw1 != paw2){
			
			$("#new_password").css("background-color", "#FFA19D");
			$("#new_chk_password").css("background-color", "#FFA19D");
			$("#new_pwd_qual").css("color", "#b8b8b8");
			$("#new_pw_chk_text").css("display", "none");
			$("#new_pwchk_chk_text").css("display", "inline");
			return false;
		}
		
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
			$.ajax({
		             type: "get",
		             url: "/newPw",
		             contentType:'application/json; charset=UTF-8',
		             data : {
		            	 "user_username" : find_username,
		            	 "user_pw" : paw1
		             },
		             dataType:'json',
		            
		             /* beforeSend: function(xhr) {
				          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				      },  */
		             success: function(data) {
		            	
		            	 
			            	 if(data == "0" ){
			            		console.log("dkdkdkkdkdkdkdkd");
			         			return false;
			            	 }else{
			            		alert("비밀번호가 성공적으로 변경되었습니다.");
			            		location.href="/main";
			            	 }

		            	
		             }, error: function(request,status,error){
		                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
		         });
		
	});

</script>
</body>
</html>