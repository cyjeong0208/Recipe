<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
	input.form-control{
		background-color: rgb(232, 240, 254);
	}
</style>
</head>
<body>
     
<div class="modal" id="email_signupModal">
	<div class="email_sign_up_content block-heading-1">
		
				<span class="close">&times;</span>
				<h2 align="center">이메일 인증 </h2> 
				<div class="modal-body" style="padding: 40px 50px;">
					<form method = "post" id="sendMail_form" name="sendMail_form" target="param"><!-- action="/mail/send" -->
					<fieldset>
						<div class="form-group">
							<label for="email">Email</label> &emsp; <p id="email_chk_text" style="display:none; color:#FFA19D;" >중복된 이메일입니다.</p>
								<input type="email" class="form-control" id="email" name = "email" placeholder="Email을 입력하세요..." autofocus>
							<input type="button" id="send_btn" class="btn btn-success btn-block" value = "전  송" onclick = "send('send');">
							
						</div>
						
						<div class="form-group">
							<label for="joinCode">인증번호</label> &emsp; <p id="joinCode_chk_text" style="display:none; color:#FFA19D;" >인증번호가 일치하지 않습니다.</p>
							<input type="text" class="form-control" id="joinCode" name = "joinCode" placeholder="인증번호를 입력하세요..." autofocus>
							<input type="button" id="check_btn" class="btn btn-success btn-block" value="확인" onclick="send('check');">
						</div>
						 
						<!-- <button type="submit" class="btn btn-success btn-block" id="login_button">
							 로 그 인
						</button>-->
						</fieldset>
				
               			
						<input type="button" class="btn btn-success btn-block" id="signup_btn" value="다음" >
						
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				</div>
				
             
            </div>
            
            
	
      </div>          
           <!-- iframe 설정 -->
    <iframe  name="param" style="visibility:hidden; height:1px;"></iframe>

    <!-- end of modal -->
 <script>
 
 function send(val){
	 var email_form = document.sendMail_form;
	

			 if(val == "send"){
				 var send_btn = document.getElementById("send_btn");
				 send_btn.disabled = 'disabled'; 
				 email_form.action = "/mail/send";
			 }else if(val == "check"){
				 var check_btn = document.getElementById("check_btn");
				 check_btn.disabled = 'disabled'; 
				 email_form.action = "/mail/check";
			 }
			 email_form.submit();
		
 }

 
 </script>



<!-- <script type="text/javascript">

$(document).ready(function(){
	  //페이지에 들어오자마자 모달창이 뜨게 한다.
	  /* $("#myModal").modal("show"); */
	  
	  
	  /* 모달창이 닫힐 때 일어나는 이벤트는  hide.bs.modal이다 */
	  /* 이 이벤트를 잡아서 다시 전 페이지로 돌아가는 기능을 넣어줬다.(로그인 버튼이 있던 그 페이지로) */
	  $("#myModal").on('hide.bs.modal', function(){
	    alert('다시 이메일 버튼으로 돌아갑니다.');
	    history.go(-1);
	  });
	  
});
</script> -->

</body>
</html>