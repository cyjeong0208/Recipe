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


	<div id="write_msg" class="modal">
	
 	
 	
	<!-- chatting Modal -->
	<div class="modal-content block-heading-1" >
		<span style="width:10%; margin-left:90%;" class="close" id="close"><i class="fas fa-times fa-2x"></i></span>
		<h4 align="center">문 의 하 기</h4>
		<div  class="modal-body" style="padding: 10px 10px;">
			<h4 class="messageHeads">내용</h4>
			<fieldset>
			<div class="form-group">
				<textarea rows="7" class="form-control ml-4 mb-2 messageC" id="recv" name = "message_content" style="width:90%; border: 1px solid; resize: none; max-height:400px;" onkeyup="writeTextHeight();"></textarea>
			</div>
			
			
			</fieldset>
			<Button type="button" id="write_btn" class="btn btn-success btn-block" style="float:right;">보내기</Button> 
		</div>
        </div>
	</div>
	
	
<script>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";

var boxmodal = document.getElementById('msgboxModal');

var msgModal = document.getElementById('msgModal');

var writeMsgModal = document.getElementById("write_msg");

// 보내기버튼 누르면
$("#write_btn").click(function(){
	if($('#recv').val() == ""){
		alert("메시지를 작성하세요!");
		return false;
	}
	$.ajax({
		type:"POST",
		url:"/sendMsg",
		data:{"message_content": $('#recv').val()},
		dataType:"text",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
		success: function(data){
			if(data == "good"){
				alert("메시지 발송 완료");
				// 쪽지함 재생성
				setMsgBox(1);
				// 글쓰기모달 지우고 쪽지함 열기
				writeMsgModal.style.display = "none";
				boxmodal.style.display = "block";
			}else{
				alert("메시지 발송 실패! 잠시 후 다시 시도하세요.");
			}
		}
	});	
});
	
//메세지 작성 시 자동 크기 변환
function writeTextHeight() {
  var textEle = $('#recv');
  textEle[0].style.height = 'auto';
  var textEleHeight = textEle.prop('scrollHeight');
  textEle.css('height', textEleHeight);
};

</script>

</body>
</html>