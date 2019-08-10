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

		<div id="msgModal" class="modal">
	
 		
	<!-- chatting Modal -->
			<div class="msg-modal-content block-heading-1">
				<span class="close">&times;</span>
				<h4 align="center">메 시 지</h4>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" method = "get" action="#">
					<fieldset>
						<div class="form-group">
							<label for="recv">연정쓰</label> 
								<input type="text" class="form-control ml-4 mb-2" id="recv" name = "recv"  
									value="광고글이 있어요. 레시피그램 아람언니꺼에 광고 댓글이 달려있네요!
											빠른 시일 내에 지워주세요 !!!!!!!!!!" style="width:90%;" readonly>
						</div>
						
						
						</fieldset>
						</form>
						
				
					<form role="form" method = "get" action="#">
					<fieldset>
						<div class="form-group mt-5">
							<label for="send">관리자</label> 
							<input type="text" class="form-control ml-4 mb-2" id="send" name = "send" placeholder="답장하기 .. ">
							<Button type="submit" id="send_button" class="btn btn-success btn-block" style=" float:right;">보내기</Button> 
						</div>
						
						
						</fieldset>
						</form>
				</div>
				
            </div>


			

	</div>

</body>
</html>