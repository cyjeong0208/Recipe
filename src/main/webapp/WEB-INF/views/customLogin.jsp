<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- <meta name="description" content="">
<meta name="author" content="">
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="구글API아이디.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script> -->

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
					<form role="form" class="mb-3" id="login_form" method = "post" action="/login">
				
						<div class="form-group">
							<label for="username">이메일</label> <!--type="email"  --><input type="email"
								class="form-control" id="username" name = "username" placeholder="이메일을 입력하세요..." autofocus>
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요...">
						</div>
						
						<div class="checkbox">
						<!-- remember-me 이름으로 쿠키가 자동으로 생성 -->	
									
							<input type="checkbox" id="login_checkbox" name="remember-me" checked/> 
							<label for="login_checkbox" class="login_label"><span></span>로그인 상태 유지</label>
						</div>
						
							<a href="/main" id="login_button" class="btn btn-success btn-block">로 그 인</a>
						
					
						<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					</form>
					
					<!-- 카카오톡 로그인창으로 이동 -->
					
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=883e28a352b418b05e174ad11fdd3a07&redirect_uri=http://localhost:8080/kakao_login&response_type=code">
						<img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="250">
					</a>
					<!-- 네이버 로그인 창으로 이동 -->
				
					<a id="naver_id_login"  href="${url}">
						<img width="200" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
					</a>
					
					<!-- 구글 로그인 창으로 이동 -->
					<a class="g-signin2" data-onsuccess="onSignIn">
					</a>
				</div>
				
				<div class="modal-footer">
					
					<div style="text-align:left; margin-right:35%; margin-top:-12%;">
						<a id="findPW_btn" >비밀번호를 잊으셨나요? </a>
                  	</div>
                  	
               		<p>
                  		아직 회원이 아니신가요? &emsp;<Button id="sign_up_btn" class="btn btn-success btn-block">회원가입</Button>
               		</p>
            </div>


		</div>

	</div>
	

<!-- 카카오톡로그인 -->	
<script type='text/javascript'>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";


/* //<![CDATA[ // 사용할 앱의 JavaScript 키를 설정해 주세요. 
Kakao.init('2f41b5e7e4b906f259fd989c962a98d0'); //여기서 아까 발급받은 키 중 javascript키를 사용해준다. 
// 카카오 로그인 버튼을 생성합니다.
Kakao.Auth.createLoginButton({ 
	  container: '#kakao-login-btn', 
	  success: function(authObj){
		  Kakao.API.request({
		       url: '/v1/user/me',
		     
		       success: function(res) {
		           //  alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
		           //  alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
		        
		           console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
		             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
		             console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
		             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
		             
		             
		             modal_sign_up.style.display = "none";
		             modal_kakao_sign_up.style.display = "block";
		             
		    		$.ajax({
		         		url:'/kakaoLogin',
		         		type:'post', //여기서 String값으로 받고 밑에서 비교하는것을 success,fail로 비교하자!!
		         		contentType:'application/json; charset=UTF-8',
			             
		         		 data:{"user_username":res.id, "user_nickname":res.properties['nickname']},
		         		 dataType : "text",
		         		 beforeSend: function(xhr) {
					          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					      },  
		         		success : function(data) {
		         			alert('성공'+data);
		         			location.href=data;
		         				}, 
		         		error : function(request,status,error){
		  		    	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    		    }
		 			}); 
		       }
		         })
	  }, 
	fail: function(err) { 
		alert("실패"+JSON.stringify(err)); 
		}
		  }); //]]>
 */
 
    </script>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<!-- <script type="text/javascript">
 		var naver_id_login = new naver_id_login("evUgZt2XmwphcjWKvj2K", "CallBack URL");	// Client ID, CallBack URL 삽입
											// 단 'localhost'가 포함된 CallBack URL
 		var state = naver_id_login.getUniqState();
		
 		naver_id_login.setButton("white", 2, 40);
 		naver_id_login.setDomain("서비스 URL");	//  URL
 		naver_id_login.setState(state);
 		naver_id_login.setPopup();
 		naver_id_login.init_naver_id_login();
</script> -->
</body>
</html>