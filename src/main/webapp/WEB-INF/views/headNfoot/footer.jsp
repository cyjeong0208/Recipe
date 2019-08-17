<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Footer -->

    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-8">
                <h2 class="footer-heading mb-4">About Us</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque facere laudantium magnam voluptatum autem. Amet aliquid nesciunt veritatis aliquam.</p>
              </div>
              <div class="col-md-4 ml-auto">
                <h2 class="footer-heading mb-4">Features</h2>
                <ul class="list-unstyled">
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Press Releases</a></li>
                  <li><a href="#">Testimonials</a></li>
                  <li><a href="#">Terms of Service</a></li>
                  <li><a href="#">Privacy</a></li>
                  <li><a href="#">Contact Us</a></li>
                </ul>
              </div>
              
            </div>
          </div>
          <div class="col-md-4 ml-auto">

            <div class="mb-5">
              <div class="mb-5">
                <h2 class="footer-heading mb-4">Some Paragraph</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat nostrum libero iusto dolorum vero atque aliquid.</p>
              </div>
              <h2 class="footer-heading mb-4">Subscribe to Newsletter</h2>
              <form action="#" method="post">
                <div class="input-group mb-3">
                  <input type="text" class="form-control border-secondary text-white bg-transparent" placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary text-white" type="button" id="button-addon2">Subscribe</button>
                  </div>
                </div>
              </div>


              <h2 class="footer-heading mb-4">Follow Us</h2>
                <a href="#about-section" class="smoothscroll pl-0 pr-3"><span class="icon-facebook"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
            </form>
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
            </div>
          </div>
          <!-- 메시지 관련 -->
            <!-- 로그인 시   -->
		  <sec:authorize access="isAuthenticated()">
		  <sec:authentication property="principal.member.user_num" var="user_num"/>
          		<img src="img/user/message.png" class="message">
          </sec:authorize>
        <jsp:include page="../message/message_detail.jsp"/>
		<jsp:include page="../message/message_box.jsp"/>
		<jsp:include page="../message/message_write.jsp"/>
          <!-- 메시지 관련 끝-->
        </div>
      </div>
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>
<script>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";

// --------------------------------- 아래로 쪽지 관련 스크립트
// 쪽지함(message_box)
var boxmodal = document.getElementById('msgboxModal');
// 쪽지 자세히보기(message_detail)
var msgModal = document.getElementById('msgModal');
// 쪽지 쓰기(message_write)
var writeMsgModal = document.getElementById("write_msg");
// 쪽지함 현재 페이지
var page;


// footer에서 쪽지함 클릭하면 setMsgBox 함수에 의해 메시지박스가 초기화되고 모달창이 뜬다.
$('.message').click(function() {
	// 관리자라면 admin_message로 이동
	if("${user_num}" == 1){
		location.href = '/admin_message';
	}else{	// 아닌 경우, messageBox를 초기화하고 모달창을 띄운다.
		page = 1;
		setMsgBox(page);
		boxmodal.style.display = "block";
	}
});

// 메시지 박스 또는 특정 페이지를 누른 경우 message_box를 초기화 해서 띄우는 로직.
var setMsgBox = function(page){
	// 해당 페이지의 리스트를 불러와서 모달창에 출력하는 로직
	$.ajax({
		type:"POST",
		url:"/message.do",
		data:{"page":page},
		dataType:"json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
		success: function(data){
			// 모두 지우고 시작
			$("#msgBoxBody").empty();
			if(data.size==0){
				$("#msgBoxBody").append("<td colspan='5'>메세지함이 비어 있습니다.</td>")
			}
			// 1. 메시지리스트 띄워줌
			else{
				$.each(data, function(index, item){
				// 날짜변환
				var d = new Date(item.sendDate);
				var year = d.getFullYear();
				var month = d.getMonth()+1
				 if(month<10){
					 month = "0"+(d.getMonth()+1);
				 }
				var day = d.getDate();
				 if(day<10){
					 day = "0"+(d.getDate());
				 }
				 var date = year+"-"+month+"-"+day;
				 var htmlText;
				 htmlText += "<tr onclick='fn_msgDetail("+item.message_num+")' style='cursor:pointer;'>";
				 // 보낸사람이 관리자인 경우 색 입히기
				 if(item.sender_nickname == '관리자'){
					 htmlText += "<td class='msg' style='color : #FFC69F;'>"+item.sender_nickname+"</td>"
				 }else{
					 htmlText += "<td class='msg'>"+item.sender_nickname+"</td>"
				 }
				 htmlText += "<td class='msg'>"+item.recver_nickname+"</td>"
				 htmlText += "<td >"+item.index_content+"</td>";
				 htmlText += "<td>"+date+"</td>";
           		if (item.isRecvSend == 0){
           			if(item.sender_num == 1){ // 관리인에게 받은 것 중 처리가 되지 않은 쪽지 표시
           				htmlText += "<td style='color : #86D5FF;'>처리중</td>";
           			}else{
	           			htmlText += "<td>처리중</td>";
           			}
           		}else{
           			htmlText += "<td>답변완료</td>";
           		}
           		htmlText += "</tr>";
           		$("#msgBoxBody").append(htmlText);
			});
			
			}
		}
	});
	
	// 페이징 처리를 한 뒤 모달창에 표시하는 로직
	$.ajax({
		type:"POST",
		url:"/getPaging",
		data:{"page":page},
		dataType:"json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
		success: function(data){
			// 모두 지우고 시작
			$(".paginated").empty();
			var pageHTML = "<tr>"; 
			if(data.startPage != 1){
				pageHTML += "<td><a href='javascript:setMsgBox("+(data.startPage-1)+")'><i class='fas fa-angle-left' style='color:#FFC69F;'></i></a></td>"
			}
			for(i=data.startPage; i<=data.endPage; i++){
				if(i==data.page){
					pageHTML += "<td style='color:#FFC69F;'>"+i+"</td>"
				}
				else{
					pageHTML += "<td><a href='javascript:setMsgBox("+i+")'>"+i+"</a></td>"
				}
			}
			if(data.endPage < data.totalPage){
				pageHTML += "<td><a href='javascript:setMsgBox("+(data.endPage+1)+")'><i class='fas fa-angle-right' style='color:#FFC69F;'></i></td>"
			}
			pageHTML += "<tr>"; 
			
			$(".paginated").append(pageHTML);
		}
	});
}

// 특정 쪽지 행을 누르면 message_detail 모달을 불러오는 로직
var fn_msgDetail = function(message_num) {
	$.ajax({
		type:"POST",
		url:"/detailMsg",
		data:{"message_num":message_num},
		dataType:"json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
		success: function(data){
			$("#send_content").val(data.send_content);
			// value 초기화(message_num으로)
			$("#message_num").val(data.message_num);
			
			// 답변이 완료 된 경우에만 답변칸이 보임.
			if(data.isRecvSend == 1){
				$("#answer_div").css("display", "block");
				$("#answer_area").val(data.recv_content);
			}
			else{
				$("#answer_div").css("display", "none");
			}

			// 본인 쪽지칸에 분홍색 칠
			if(data.recver_num == "${user_num}"){
			// 본인이 받는 입장인 경우, 답변을 안한 경우에 답변칸을 만든다.
				if(data.isRecvSend == 0){
					$("#answerMsgFrm").css('display','block');
				}else{	// 답장을 한 경우에는 답장칸을 가린다.
					$("#answerMsgFrm").hide();
				}
				$("#send_content").css('background-color','#e9ecef');
				$("#answer_area").css('background-color','#FFD7BE');
			}else{	// 본인이 보낸 쪽지는 답장이 필요없다.
				$("#answerMsgFrm").hide();
				$("#answer_area").css('background-color','#e9ecef');
				$("#send_content").css('background-color','#FFD7BE');
			}
			// 쪽지함은 지우고, message_detail은 보이게 한다.
			boxmodal.style.display = "none";
			msgModal.style.display = "block";
		},
	});
}

// 글쓰기 모달 불러오는 로직
$("#msg_write").on("click", function(e){
	boxmodal.style.display = "none";
	writeMsgModal.style.display = "block";
});

// 다시 리스트로 돌아오는 로직 -> close버튼으로 대체
/* $(".message").on("click", function(e){

	boxmodal.style.display = "block";
	
	msgModal.style.display = "none";
	
	writeMsgModal.style.display = "none";
}); */


// 배경 누르면 종료되는 로직 (작동안됨 ㅠㅠㅠㅠㅠㅠㅠ)
window.onclick = function(event) {
   if (event.target == boxmodal) {
      boxmodal.style.display = "none";
   } else if (event.target == msgModal) {
	   msgModal.style.display = "none";
   }else if (event.target == writeMsgModal){
	   writeMsgModal.style.display ="none";
   }
}
// x버튼 누르면 현재 모달 없어지는 로직
$('.close').on("click",function(){
	
	boxmodal.style.display = "block";
	msgModal.style.display = "none";
	writeMsgModal.style.display = "none";
	// 작성했던 내용 지우기
	$("#send").val("");
	$("#recv").val("");
})
$('.closeMsgBox').on("click",function(){
	boxmodal.style.display = "none";
})

// 메세지 작성 텍스트 크기 늘리기
/* function CheckSize(){
	var textObj = document.getElementById('send');
	var textsize = textObj.value.length;
	textObj.setAttribute('size', textsize);
} */

</script>
    </footer>