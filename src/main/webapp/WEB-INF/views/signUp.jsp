<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<body>

<!-- 회원가입 모달창 -->
<div id="sign_up_Modal" class="modal">
         <div class="sign_up_content block-heading-1">
            <span class="close">&times;</span>
            <h2 align="center">회 원 가 입</h2>
            <div class="sign_up_body" style="padding: 40px 50px;">
              <form method = "post" id="signup_form" name="signup_form" action="/signup"> 
                  <div class="form_sign_up_group">
                     <label for="user_username">Email</label><br> 
                     <input type="email" class="form-control" id="user_username"  name="user_username" readonly><br> 
                     
                     <label for="user_pw">Password</label> &emsp; <span class="font-size-12 text-right">영어 + 숫자 8 ~  15자 </span><br> 
                     <input type="password" class="form-control" id="user_pw"name="user_pw" placeholder="원하는 암호를 입력하세요.."><br>
                     
                     <label for="user_pw_check">Password 확인</label><br> 
                     <input type="password" class="form-control" id="user_pw_check"name="user_pw_check" placeholder="원하는 암호를 다시 입력해주세요.."> <br> 
                    
                     <label for="user_name">이 름</label> <br> 
                     <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름을 입력해주세요.."> <br>
                     
                     <label for="user_nickname">닉네임</label> <br> 
                     <input type="text" class="form-control" id="user_nickname" name="user_nickname" placeholder="닉네임을 입력해주세요.."> <br>
                     
                   <br> 
                     <input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
                     <input type="hidden" id="user_auth" name = "user_auth" value = "ROLE_USER"/>
                     
                     <!-- <button type="submit" id="move_email" class="btn btn-success btn-block" >뒤로가기 </button>
                      -->
                     <button id="sign_submit" class="btn btn-success btn-block" >회원가입 </button>

                  </div>
				</form>
               

            </div>

         </div>
       </div>




<script type="text/javascript">
	$("#sign_submit").click(function () {
		
		var id= $("#user_username").val();
		
		var paw1= $("#user_pw").val();
		
		var paw2= $("#user_pw_check").val();
		
		var Name= $("#user_name").val();
	
		var Nickname= $("#user_nickname").val();
		
		//alert(name + ", " + Email + ", " + nickname);
	

		
		var passRule = /^[A-Za-z0-9]{8,15}$/;//숫자와 문자 포함 형태의 8~15자리 이내의 암호 정규식
		 
		//정규식안맞는 경우 (비밀번호조건과 다를경우)
		if(!passRule.test(paw1)) {
		
			$("#user_pw").css("background-color", "#FFA19D");
		    return false;
		}	
		if(paw1 =="" || paw2 =="" || paw1 != paw2){
			
			$("#user_pw").css("background-color", "#FFA19D");
			$("#user_pw_check").css("background-color", "#FFA19D");
			return false;
		}
		if(Name =="" || Name == null){
			
			$("#user_pw").css("background-color", "#fff");
			$("#user_pw_check").css("background-color", "#fff");
			$("#user_name").css("background-color", "#FFA19D");
			return false;
		}

	
		

		alert("회원가입이 완료되었습니다.");
		signup_form.submit();
	});

</script>


</body>
</html>