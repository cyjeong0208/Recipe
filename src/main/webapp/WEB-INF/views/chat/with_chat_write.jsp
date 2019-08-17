<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<head>
<style>
.chatWrite-body{
	font-size:2rem;
}
.chatWrite-body .searchBtn {
	vertical-align:middle;
	position: relative;
	margin-left: 20%;
	z-index: 1;
}
.chatWrite-body #searchIcon {
	height: 40px;
	width: 40px;
	opacity: 0.6;
}
.chatWrite-body input{
	padding: 5px;
	padding-left:20px;
	padding-right:20px;
	width : 590px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	outline: none;
	font-size:1.5rem;
}
.chatWrite-body input::placeholder{
	opacity:0.2;
}
.chatWrite-body select{
	padding: 10px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	outline: none;
	height:80%;
}
.chatWrite-body .eachRow{
	padding-top:3%;
}
.writeBtn{
	height: 45px;
	width: 20%;
	margin-left:80%;
}

#address input{
  position: relative !important;
  top: 7px;
}

</style>

</head>

<body>

<div id="chatWriteModal" class="chatWriteModal" >
	<div class="chatWrite-modal-content block-heading-1">
		<span class="close" id="closeWrite"><i class="fas fa-times fa-2x"></i></span>
			
			<!-- 수정: form에 id,method 추가 -->
			<form id="chatRoomForm" action="/makeChatRoom" method="POST" accept-charset="utf-8">
			
			<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="user_num" value='<sec:authentication property="principal.member.user_num"/>'> 		
			</sec:authorize>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			<!-- 수정: Change인지 With인지 구별하기 위함, 0이면 CHANGE_TB , 1이면 WITH_TB에 insert -->
			<input type="hidden" name="select" value="1"/>
			<table class="chatWrite-body">
				<tr>
					<td colspan="2" style="text-align:center; font-size:2.5rem; color:#FFC69F;">
						&nbsp; 물물교환 채팅방 개설
					</td>
					
				</tr>
				<tr>
					<td class="eachRow">
						&nbsp; &nbsp; 지역
					</td>
				</tr>
				<tr>
					<td id="address">
						<!-- 수정: name = "chat_address"  추가-->
						<input type="text" id="chat_address" name="chat_address" placeholder="읍, 면, 동 단위로 입력 후 검색" autocomplete="off">
					</td>
					<td>
						<span class="searchBtn"><img src="img/main/search.png" id="searchIcon"></span>
					</td>
				</tr>			
				<tr>
					<td  class="eachRow">
						&nbsp; &nbsp; 제목
					</td>
				</tr>
				<tr>
					<td>
						<!-- 수정: name = "chat_title"  추가-->
						<input type="text" name="chat_title" placeholder="방 제목을 입력하세요" maxlength="20">
					</td>
				</tr>
				<tr>
					<td  class="eachRow">
						&nbsp; &nbsp; 인원
						
						<!-- 수정: name="chat_maxmember" 추가 -->
						<select name="chat_maxmember">
	    					<option value="2">2명</option>
	    					<option value="3">3명</option>
	    					<option value="4">4명</option>
	    					<option value="5">5명</option>
						</select>
					</td>
					<td>
					</td>
				</tr>
			</table>
				<span>
					<input type="submit" id="createBtn" class="btn btn-primary btn-xs writeBtn" value="개설하기">
				</span>
			</form>
<!-- 		<div class="container chatWrite-body">
			<form>
			<div class="row">
				<div class="md-col-2">
					지역
				</div>
				<div class="md-col-9">
					<input type="text"> <span class="searchBtn"><img src="img/main/search.png" id="searchIcon"></span>
				</div>
			</div>
			
			<div class="row">
				<div class="md-col-2">
					제목
				</div>
				<div class="md-col-9">
					<input type="text">
				</div>
			</div>
			
			<div class="row">
				<div class="md-col-2">
					인원
				</div>
				<div class="md-col-9">
					<select>
    					<option value="2">2</option>
    					<option value="3">3</option>
    					<option value="4">4</option>
    					<option value="5">5</option>
					</select>
				</div>
			</div>
			</form>
		</div> -->
	</div>
</div>
	
</body>
</html>