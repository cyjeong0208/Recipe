<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	<div class="modal-content block-heading-1">
		<span style="width:10%; margin-left:90%;" class="close" id="close"><i class="fas fa-times fa-2x"></i></span>
		<h4 align="center">메 시 지</h4>
		<div class="modal-body" style="padding: 10px 10px;">
			<form role="form" method = "get" action="recverMessage.do">
			
			<fieldset>
				<div align="left" class="form-group">
					<h4 class="messageHeads">　내용</h4>
					<textarea class="form-control ml-4 mb-2 messageC" id="send_content" name = "send_content" style="width:80%; height:200px; resize: none;" readonly></textarea>
				</div>
				<div align="right" class="form-group" style="display: none;" id="answer_div">
					<h4 class="messageHeads">　답변</h4>
					<textarea class="form-control mb-2 messageC" id="answer_area" name = "answer" style="width:80%; height:200px; resize: none;" readonly></textarea>
				</div>
			</fieldset>
			</form>
				<form action="recverMessage.do" id="answerMsgFrm">
					<input type="hidden" id="message_num" name="message_num">
					 <fieldset>
						<div class="form-group mt-5">
							<textarea rows="7" class="form-control mb-2 messageC" id="send" name = "recevMessage_content" style="height:100px; resize: none; max-height:200px;"placeholder="답장하기 .. "onkeyup="recvTextHeight();"></textarea>
							<Button type="button" id="send_button" class="btn btn-success btn-block" style="float:right;">보내기</Button> 
						</div>
					</fieldset> 
				</form>
		</div>
        </div>
	</div>
	
	
<!-- 작성 textarea 글자수에 따른 높이 증가  -->
<script>
var boxmodal = document.getElementById('msgboxModal');

var msgModal = document.getElementById('msgModal');

var writeMsgModal = document.getElementById("write_msg");

var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";

$("#send_button").click(function () {
	var message_num = $("#message_num").val();
	var recv_content = $("#send").val();
	$.ajax({
		url:"/answerMsg",
		type: "post",
		data:{"message_num":message_num, "recv_content" : recv_content },
       dataType:'text',
          beforeSend: function(xhr) {
              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
          },
		success:function(data){
			if(data == "good"){
				alert("메세지를 성공적으로 보냈습니다.");
				
				// 쪽지함 재생성
				setMsgBox(1);
				
				// 작성했던 내용 지우기
				$("#send").val("");
				// 상세보기박스 지우고 쪽지함 연다
				msgModal.style.display = "none";
				boxmodal.style.display = "block";
			}else{
				alert("메세지 전송에 실패하였습니다.");
			}
		},
		error:function(error){
			alert("실패");
		}
	})
});

//답변 작성 시 자동 크기 변환
function recvTextHeight() {
  var textEle = $('#send');
  textEle[0].style.height = 'auto';
  var textEleHeight = textEle.prop('scrollHeight');
  textEle.css('height', textEleHeight);
};

</script>

</body>
</html>