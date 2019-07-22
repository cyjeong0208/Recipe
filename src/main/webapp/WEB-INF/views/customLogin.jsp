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
				
						<div class="form-group">
							<label for="username">Email</label> <!--type="email"  --><input type="text"
								class="form-control" id="username" name = "username" placeholder="Email을 입력하세요..." autofocus>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password" placeholder="Password를 입력하세요...">
						</div>
						
						<div class="checkbox">
						<!-- remember-me 이름으로 쿠키가 자동으로 생성 -->	
									
							<input type="checkbox" id="login_checkbox" name="remember-me" checked/> 
							<label for="login_checkbox" class="login_label"><span></span>로그인 상태 유지</label>
						</div>
						
							<a href="main.jsp" id="login_button" class="btn btn-success btn-block">로 그 인</a>
						
					
						<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					</form>
				</div>
				
				<div class="modal-footer">
					<!-- 카카오톡 로그인창으로 이동 -->
					<!-- <a id="custom-login-btn" href="javascript:loginWithKakao()">
						<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
					</a> -->
					
					<!-- 네이버 로그인 창으로 이동 -->
					<%-- <div id="naver_id_login" style="text-align:center">
					<a href="${url}">
						<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
					</a>
					</div> --%>

               		<p>
                  		아직 회원이 아니신가요? &emsp;<Button id="sign_up_btn" class="btn btn-success btn-block">회원가입</Button>
               		</p>
            </div>


		</div>

	</div>
	
<!-- 카카오톡로그인 -->	
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('b7729633f1d549cbd4206268166b37bf');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
</script>

<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<script type="text/javascript">
 		var naver_id_login = new naver_id_login("evUgZt2XmwphcjWKvj2K", "CallBack URL");	// Client ID, CallBack URL 삽입
											// 단 'localhost'가 포함된 CallBack URL
 		var state = naver_id_login.getUniqState();
		
 		naver_id_login.setButton("white", 2, 40);
 		naver_id_login.setDomain("서비스 URL");	//  URL
 		naver_id_login.setState(state);
 		naver_id_login.setPopup();
 		naver_id_login.init_naver_id_login();
</script>
</body>
</html>