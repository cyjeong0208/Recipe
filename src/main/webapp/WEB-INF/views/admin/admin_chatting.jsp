<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<head>



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

		<div id="chattingModal" class="modal">
	
 		
	<!-- chatting Modal -->
			<div class="chat-modal-content block-heading-1">
				<span class="close">&times;</span>
				<h4 align="center">공동구매 1번 채팅방</h4>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" method = "get" action="#">
					<fieldset>
						<div class="form-group">
							<label for="user1_nickname">연정쓰</label> 
								<input type="text" class="form-control ml-4 mb-2" id="user1_nickname" name = "user1_nickname"  value="안녕하세요!!" 
									style="width:90%;" readonly>
						</div>
						<div class="form-group">
							<label for="user2_nickname">아람쓰</label> 
								<input type="text" class="form-control ml-4 mb-2" id="user2_nickname" name="user2_nickname" value="안녕하세요!! ^^" 
									style="width:90%;" readonly>
						 
								<input type="text" class="form-control ml-4 mb-2" id="user2_nickname" name="user2_nickname" value="양파공동구매하시나요??" 
									style="width:90%;" readonly>
						</div>
						<div class="form-group">
							<label for="user1_nickname">연정쓰</label> 
								<input type="text" class="form-control ml-4 mb-2" id="user1_nickname" name = "user1_nickname"  value="네!!! :)" 
									style="width:90%; " readonly>
						
								<input type="text" class="form-control ml-4 mb-2" id="user1_nickname" name = "user1_nickname"  value="어느 마트가 편하세요?" 
									style="width:90%;" readonly>
						</div>
						
						</fieldset>
						</form>
						
				</div>
				
            </div>


			

	</div>

</body>
</html>