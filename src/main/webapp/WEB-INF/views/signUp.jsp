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
              <form method = "post" id="signup_form" name="signup_form" > 
                  <div class="form_sign_up_group">
                     <label for="user_username">이메일</label><br> 
                     <input type="email" class="form-control" id="user_username"  name="user_username" readonly><br> 
                     
                     <label for="user_pw">비밀번호</label> &emsp; <span class="font-size-12 text-right" id="pwd_qual">영어 + 숫자 8 ~  15자 </span>
                    	<br> <p id="pw_chk_text" style="display:none; color:#FFA19D;" >패스워드 조건을 확인해주세요.</p><br> 
                     <input type="password" class="form-control" id="user_pw"name="user_pw" placeholder="비밀번호를 입력하세요.."><br>
                     
                     <label for="user_pw_check">비밀번호 확인</label> <br> <p id="pwchk_chk_text" style="display:none; color:#FFA19D;" >패스워드와 일치하지 않습니다.</p> <br> 
                     <input type="password" class="form-control" id="user_pw_check"name="user_pw_check" placeholder="비밀번호를 다시 입력해주세요.."> <br> 
                    
                     <label for="user_name">이 름</label><br> <p id="name_chk_text" style="display:none; color:#FFA19D;" >이름을 작성해주세요.</p> <p id="name_text" style="display:none; color:#FFA19D;" >10자이하입니다. </p> <br> 
                     <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름을 입력해주세요.."> <br>
                     
                     <label for="user_nickname">닉네임</label>  &emsp; <span class="font-size-12 text-right" id="nick">10자 이하  </span>
                     <br> <p id="nickname_text" style="display:none; color:#FFA19D;" >닉네임 조건을 확인해주세요. </p> <p id="nickname_chk_text" style="display:none; color:#FFA19D;" >중복된 닉네임입니다. </p><br> 
                     <input type="text" class="form-control" id="user_nickname" name="user_nickname" placeholder="닉네임을 입력해주세요.."> <br>
                     
                   <br> 
                     <input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
                     <input type="hidden" id="user_auth" name = "user_auth" value = "ROLE_USER"/>
                     
                     <!-- <button type="submit" id="move_email" class="btn btn-success btn-block" >뒤로가기 </button>
                      -->
                     <input type="button" id="sign_submit" class="btn btn-success btn-block" value="회원가입">

                  </div>
				</form>
               

            </div>

         </div>
       </div>




<script type="text/javascript">
	$("#sign_submit").on("click", function (e) {
		
		var id= $("#user_username").val();
		
		var paw1= $("#user_pw").val();
		
		var paw2= $("#user_pw_check").val();
		
		var Name= $("#user_name").val();
	
		var Nickname= $("#user_nickname").val();
		
		//alert(name + ", " + Email + ", " + nickname);
		var signup_form = document.signup_form;
		

		
		var passRule = /^[A-Za-z0-9]{8,15}$/;//숫자와 문자 포함 형태의 8~15자리 이내의 암호 정규식
		 
		//정규식안맞는 경우 (비밀번호조건과 다를경우)
		if(!passRule.test(paw1)) {
		
			$("#user_pw").css("background-color", "#FFA19D");
			$("#pwd_qual").css("color", "#FFA19D");
			$("#pw_chk_text").css("display", "inline");
			
		    return false;
		}	
		if(paw1 =="" || paw2 =="" || paw1 != paw2){
			
			$("#user_pw").css("background-color", "#FFA19D");
			$("#user_pw_check").css("background-color", "#FFA19D");
			$("#pwd_qual").css("color", "#b8b8b8");
			$("#pw_chk_text").css("display", "none");
			$("#pwchk_chk_text").css("display", "inline");
			return false;
		}
		if(Name =="" || Name == null){
			
			$("#user_pw").css("background-color", "#fff");
			$("#pwd_qual").css("color", "#b8b8b8");
			$("#pw_chk_text").css("display", "none");
			$("#user_pw_check").css("background-color", "#fff");
			$("#pwchk_chk_text").css("display", "none");
			$("#user_name").css("background-color", "#FFA19D");
			$("#name_chk_text").css("display", "inline");
			return false;
		}
		if(Name.length >10){
			$("#user_pw").css("background-color", "#fff");
			$("#pwd_qual").css("color", "#b8b8b8");
			$("#pw_chk_text").css("display", "none");
			$("#user_pw_check").css("background-color", "#fff");
			$("#pwchk_chk_text").css("display", "none");
			$("#user_name").css("background-color", "#FFA19D");
			$("#name_chk_text").css("display", "none");
			$("#name_text").css("display", "inline");
			return false;
		}
		if(Nickname.length >10){
			$("#user_pw").css("background-color", "#fff");
			$("#pwd_qual").css("color", "#b8b8b8");
			$("#pw_chk_text").css("display", "none");
			$("#user_pw_check").css("background-color", "#fff");
			$("#pwchk_chk_text").css("display", "none");
			$("#user_name").css("background-color", "#fff");
			$("#name_chk_text").css("display", "none");
			$("#user_nickname").css("background-color", "#FFA19D");
			$("#nickname_text").css("display", "inline");
			return false;
		}
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
		
		
			$.ajax({
		             type: "get",
		             url: "/chkNickname",
		             contentType:'application/json; charset=UTF-8',
		             data : {
		            	 "user_nickname" : Nickname
		             },
		             dataType:'json',
		            
		             /* beforeSend: function(xhr) {
				          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				      },  */
		             success: function(data) {
		            	
		            	 /* $.each(data, function(idx, val) {
		            		 alert("idx " +idx);
		            		 alert("val " +val); */
			            	 if(data == "1" ){
			            	
			            		$("#user_pw").css("background-color", "#fff");
			         			$("#pwd_qual").css("color", "#b8b8b8");
			         			$("#pw_chk_text").css("display", "none");
			         			$("#user_pw_check").css("background-color", "#fff");
			         			$("#pwchk_chk_text").css("display", "none");
			         			$("#user_name").css("background-color", "#fff");
			         			$("#name_chk_text").css("display", "none");
			         			$("#user_nickname").css("background-color", "#FFA19D");
			         			$("#nickname_text").css("display", "none");
			         			$("#nickname_chk_text").css("display", "inline");
			         			return false;
			            	 }else{
			            		 signup_form.action = "/signup";
			            		 signup_form.submit();
			            	 }

		            	 /* }); */
		             }, error: function(request,status,error){
		                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
		         });
		
		
		//signup_form.submit();
	});

</script>


</body>
</html>