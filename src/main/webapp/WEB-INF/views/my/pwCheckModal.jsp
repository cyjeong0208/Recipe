<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<head>
</head>
<body>
	<div id="pwCheckModal">
	
	<div class="text-center" id="pwCheckModal-modal-content">
		<span class="close" id="closeWrite"><i class="fas fa-times fa-2x"></i></span>
	
		<h4>비밀번호 확인</h4>
		<input type="password" id = "pwCheckBox" type="text" placeholder = "비밀번호를 입력하세요."/>
		<button id="pwCheckBtn" class="btn btn-success btn-block font-size-20 mt-5" >확 인</button> 
	</div>
	</div>
			
</body>
</html>