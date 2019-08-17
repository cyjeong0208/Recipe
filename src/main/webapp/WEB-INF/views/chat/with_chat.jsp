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

<!-- 수정 사항: <div class="modal-body" id="chatting_contents">  , id 속성 추가 -->

<div id="chattingModal" class="modal chatModal" >
		
 		
	<!-- chatting Modal -->
		<div class="chat-modal-content block-heading-1">
				<span class="close" id="close"><i class="fas fa-times fa-2x"></i></span>
				
				<div class="container-fluid pt-5">
					<div class="topRow">
						<div class="col-md-11" style="margin-top:-4%;">	
							<h4 style="margin-left:5%;" id="ChattingRoomTitle"></h4>
						</div>
					</div>
					
					<!-- row 크기가 정해져야 한다. -->
					<div class="row midRow" style="height:550px;">
						<div class="col-md-9 modal-body-wrapper">
						<div class="modal-body" id="chatting_contents">
							<form role="form" method = "get" action="#">
							<fieldset id="chattingArea">
						
						<!-- <div class="form-group other">
							<label for="user1_nickname">연정쓰</label> 
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
ㅎㅇ
							</textarea>
						</div>
						<div class="form-group other">
							<label for="user2_nickname">아람쓰</label> 
							<textarea class="form-control mb-2"  id="user2_nickname" name = "user3_nickname" style="width:80%;" readonly>
안녕하세요
							</textarea>
						
							<textarea class="form-control mb-2"  id="user2_nickname" name = "user3_nickname" style="width:80%;" readonly>
감자팝니다.
							</textarea>
						</div>
						<div class="form-group other">
							<label for="user1_nickname">연정쓰</label> 
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
헐감자좋아용
							</textarea>
						
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
고구마랑 바꿀래요?
							</textarea>
						</div>
						<div class="form-group me">
							<textarea class="form-control mb-2"  id="user3_nickname" name = "user3_nickname" style="width:80%;" readonly>
조용히하세요.
							</textarea>
						
							<textarea class="form-control mb-2"  id="user3_nickname" name = "user3_nickname" style="width:80%;" readonly>
다들 나가주세요. 혼자있고싶네요.
							</textarea>
							<textarea class="form-control mb-2"  id="user3_nickname" name = "user3_nickname" style="width:80%;" readonly>
긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글긴글글긴글긴글긴글긴글긴글긴글긴글글긴글긴글긴글긴글긴글긴글긴글글긴글긴글긴글긴글긴글긴글긴글
							</textarea>
							<textarea class="form-control mb-2"  id="user3_nickname" name = "user3_nickname" style="width:80%;" readonly>
긴글다음글
							</textarea>
						</div>
						<div class="form-group other">
							<label for="user1_nickname">연정쓰</label> 
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
ㅎㅇ
							</textarea>
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
ㅎㅇ
							</textarea>
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
ㅎㅇ
							</textarea>
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
ㅎㅇ
							</textarea>
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
ㅎㅇ
							</textarea>
							<textarea class="form-control mb-2"  id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
ㅎㅇ
							</textarea>
							<textarea class="form-control mb-2"   id="user1_nickname" name = "user3_nickname" style="width:80%;" readonly>
ㅎㅇ
							</textarea>
 
						</div>
								 -->				
						
						</fieldset>
						</form>
					</div>
				</div>
					<div class="col-md-3 lists">
						<h4 style="text-align:center;">참여자 목록</h4>
						<hr style="border-top:2px solid #FFD7BE;">
						<br>
						<table style="display:block;" id="userList">
							<!-- <tr class="norwd" style="font-size:20px;">
								<td style="color:#FFC69F">
									연정쓰
								</td>
							</tr>
							<tr class="norwd" style="font-size:20px;">
								<td>
									아람쓰
								</td>
							</tr>
							<tr class="norwd" style="font-size:20px;">
								<td>
									갠수
								</td>
							</tr> -->
						</table>
					</div>
					</div>
					<div class="row botRow" style="padding-bottom:15px; margin-top:2%;">
						<div class="col-md-9 typingboxWrapper" style="margin-left:5%; padding-right:0; padding-left:0;">
							<textarea class="typingbox"></textarea>
						</div>
						<div class="col-md-2 submitBtnWrapper" style="padding-left:0; padding-right:0;">
							<input type="submit" class="btn btn-primary btn-xs submitBtn" value="전송" style="height: 50px; width: 70%;">
						</div>
					</div>
				</div>
				
            </div>


</div>
	
</body>
</html>