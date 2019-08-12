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
<div id="kakao_sign_up_Modal" class="modal">
         <div class="kakao_sign_up_content block-heading-1">
            <span class="close">&times;</span>
            <h2 align="center">간 편 회 원 가 입</h2>
            <div class="sign_up_body" style="padding: 40px 50px;">
              <form method = "post" id="kakao_signup_form" name="kakao_signup_form" > 
                  <div class="form_sign_up_group">
                     <input type="hidden" class="form-control" id="kakao_user_username"  name="kakao_user_username" value="<%=session.getAttribute("userId")%>" ><br> 
              
                     <label for="kakao_user_name">이 름</label><br> <p id="kakao_name_chk_text" style="display:none; color:#FFA19D;" >이름을 작성해주세요.</p> <br> 
                     <input type="text" class="form-control" id="kakao_user_name" name="kakao_user_name" placeholder="이름을 입력해주세요.."> <br>
                     
                     <label for="kakao_user_nickname">닉네임</label>  &emsp; <span class="font-size-12 text-right" id="kakao_nick">10자 이하  </span> 
                     <input type="text" class="form-control" id="kakao_user_nickname" name="kakao_user_nickname" value="<%=session.getAttribute("userNickname")%>" readonly> <br>
                     
                   <br> 
                     <input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
                     <input type="hidden" id="kakao_user_auth" name = "kakao_user_auth" value = "ROLE_USER"/>
                     
                     <!-- <button type="submit" id="move_email" class="btn btn-success btn-block" >뒤로가기 </button>
                      -->
                     <input type="button" id="kakao_signsubmit" class="btn btn-success btn-block" value="회원가입">

                  </div>
				</form>
               

            </div>

         </div>
       </div>




<script type="text/javascript">
	$("#kakao_signsubmit").on("click", function (e) {
		
		
		var Name= $("#kakao_user_name").val();
	
	
		//alert(name + ", " + Email + ", " + nickname);
	

		
		if(Name =="" || Name == null){
			
			$("#kakao_user_pw").css("background-color", "#fff");
			$("#kakao_pwd_qual").css("color", "#b8b8b8");
			$("#kakao_pw_chk_text").css("display", "none");
			$("#kakao_user_pw_check").css("background-color", "#fff");
			$("#kakao_pwchk_chk_text").css("display", "none");
			$("#kakao_user_name").css("background-color", "#FFA19D");
			$("#kakao_name_chk_text").css("display", "inline");
			return false;
		}
		
		
		
		kakao_signup_form.action = "/kakao_signup";
		kakao_signup_form.submit();
	});

</script>


</body>
</html>