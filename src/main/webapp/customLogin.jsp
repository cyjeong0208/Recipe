<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="description" content="">
<meta name="author" content="">
<head>



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

		<div id="loginModal" class="modal">
	
 		
	<!-- Login Modal -->
			<div class="modal-content block-heading-1">
				<span class="close">&times;</span>
				<h2 align="center">로 그 인</h2>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="login_form" method = "post" action="/login">
					<fieldset>
						<div class="form-group">
							<label for="id">Email</label> <!--type="email"  --><input type="text"
								class="form-control" id="username" name = "username" placeholder="Email을 입력하세요..." autofocus>
						</div>
						<div class="form-group">
							<label for="pwd">Password</label> <input type="password"
								class="form-control" id="password" name="password" placeholder="Password를 입력하세요...">
						</div>
						
						<div class="checkbox">
						<!-- remember-me 이름으로 쿠키가 자동으로 생성 -->			
							<input type="checkbox" id="login_checkbox" name="remember-me" /> 
							<label for="login_checkbox" class="login_label"><span></span>로그인 상태 유지</label>
						</div>
						
							<a href="main.jsp" id="login_button" class="btn btn-success btn-block">로 그 인</a>
						
							
						<!-- <button type="submit" class="btn btn-success btn-block" id="login_button">
							 로 그 인
						</button>-->
						</fieldset>
						<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					</form>
				</div>
				<div class="modal-footer">
               		<p>
                  		아직 회원이 아니신가요? &emsp;<Button id="sign_up_btn" class="btn btn-success btn-block">회원가입</Button>
               </p>
            </div>


			</div>

	</div>
	

</body>
</html>