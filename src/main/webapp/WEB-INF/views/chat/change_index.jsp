<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<%
	int startPage = (int) request.getAttribute("startPage");
	int endPage = (int) request.getAttribute("endPage");
	int totalPage = (int) request.getAttribute("totalPage");
	Integer select  = 0; // 물물교환과, 공동구매를 구별하는 정수이다. 0: 물물교환, 1: 공동구매
%>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>물물교환 채팅방</title>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>

<style>
.searchContainer {
	/*    background-color: #FFD7BE;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px; */
	margin-top: 3%;
	margin-bottom: 5%;
}

/* -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
           두개는 테두리를 둥글게  */

/* 검색바 설정 */
.dbSearchBar {
	min-height: 50px;
	width: 100%;
	height: auto;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: #FFD7BE;
	opacity: 0.5;
	border: none;
	margin-left: -4%;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.5rem;
	letter-spacing: 5px;
	padding-left: 8%;
	padding-right: 8%;
}
/* 상, 하단 검색바 세부설정 */
input#localSearch {
	margin-top: 4%;
	margin-bottom: 2%;
}

input#titleSearch {
	margin-bottom: 4%;
}

/* 클릭 시 파란테두리 없애기  */
.text-center input.dbSearchBar:focus, .text-center .dbIcon #dbSearch_icon:focus,
	button#login, button#signup {
	outline: none;
}

/* placeholder */
.text-center .placeholder {
	padding-left: 20%;
	font-size: 1.5rem;
	color: #65737e;
}

/* z-index : 숫자가 적으면 뒤로 배치 크면 앞으로 배치 */
.text-center .dbIcon {
	position: absolute;
	margin-left: 30%;
	top: 35%;
	z-index: 1;
}

.text-center .dbIcon #dbSearch_icon {
	height: 45px;
	width: 45px;
	opacity: 0.6;
}

.video-team-member-1 {
	margin-bottom: 20%;
	padding-bottom: 7%;
	border: solid 1px #D8D8D8;
}

.rowBlock {
	padding-top: 2%;
	padding-right: 2%;
	padding-left: 2%;
	margin-bottom: 5%;
	border: solid 1px #D8D8D8;
	margin-bottom: 5%;
	padding-right: 2%;
}

.rowBlock {
	position: relative;
	overflow: hidden;
}

input:focus::-webkit-input-placeholder {
	color: transparent;
}

input:focus::-moz-placeholder {
	color: transparent;
}

input:focus:-ms-input-placeholder {
	color: transparent;
}

input:focus::-ms-input-placeholder {
	color: transparent;
}
/* 글쓰기 모달 관련! */
.chatWriteModal {
	display: none;
	position: fixed;
	z-index: 2000; /* Sit on top */
	left: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.chatWrite-modal-content {
	background-color: #fefefe;
	margin: 1% auto; /* 15% from the top and centered */
	padding: 1%;
	border: 1px solid #888;
	width: 700px; /* Could be more or less, depending on screen size */
	height: 520px;
}

/* 글쓰기모달 끝 */

/* 채팅 모달 관련! */
/* The Modal (background) */
.chatModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 2000; /* Sit on top */
	left: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.chat-modal-content {
	background-color: #fefefe;
	margin: 1% auto; /* 15% from the top and centered */
	padding: 1%;
	border: 1px solid #888;
	width: 75%; /* Could be more or less, depending on screen size */
	height: 720px;
}

.modal-body {
	padding-left: 5%;
	padding-right: 0;
	padding-bottom: 5%;
	overflow-y: scroll;
	max-height: 100%;
}

.modal-body::-webkit-scrollbar {
	display: none;
}

.typingbox {
	height: 50px;
	width: 100%;
	font-size: 1rem;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-color: #FFD7BE;
}

/* 채팅방 내부 UI */
.modal-body-wrapper {
	max-height: 100%;
}

.me textarea {
	margin-left: 13%;
}

.other textarea {
	background-color: #FFD7BE !important;
}

label {
	margin-bottom: 0;
}

.form-group {
	margin-bottom: 0;
}

.form-control {
	line-height: 1.2;
}

.form-group textarea::-webkit-scrollbar {
	display: none;
}

.typingbox::-webkit-scrollbar {
	display: none;
}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/*로그인 상태 유지*/
.checkbox {
	clear: both;
	overflow: hidden;
}

.checkbox label {
	width: 100%;
	border-radius: 3px;
	border: 1px solid #D1D3D4;
	font-weight: normal;
}

.checkbox input[type="checkbox"]:empty {
	display: none;
}

.checkbox input[type="checkbox"]:empty ~ label {
	position: relative;
	line-height: 2.5em;
	text-indent: 3.25em;
	margin-top: 2em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.checkbox input[type="checkbox"]:empty ~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

.checkbox input[type="checkbox"]:hover:not (:checked ) ~ label {
	color: #888;
}

.checkbox input[type="checkbox"]:hover:not (:checked ) ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

.checkbox input[type="checkbox"]:checked ~ label {
	color: #777;
}

.checkbox input[type="checkbox"]:checked ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #333;
	background-color: #ccc;
}

.checkbox input[type="checkbox"]:focus ~ label:before {
	box-shadow: 0 0 0 3px #999;
}

.checkbox input[type="checkbox"]:checked ~ label:before {
	color: #fff;
	background-color: #FFC69F;
}

/* 반응형 */
@media ( max-width :500px) {
	/* 상단 물물교환/공동구매 배열 변환 */
	.rwd_top h1 {
		font-size: 1.5rem;
	}
	.rwd_top>.col-md-4 {
		width: 40%;
	}
	/* 검색바 중앙배치 */
	.dbSearchBar {
		margin-right: 18%;
		width: 80%;
	}
	.chat-modal-content {
		width: 90%;
		height: 80%;
		margin-top: 10%;
	}

	/* 채팅방 내부 UI */
	.form-control {
		font-size: 0.5rem;
	}
	.modal-body-wrapper {
		max-height: 90%;
	}
	.topRow {
		margin-top: -13%;
	}
	.midRow {
		height: 290px !important;
	}
	.midRow>.col-md-3 h4, hr {
		display: none;
	}
	.botRow {
		height: 85px;
	}
	.lists {
		font-size: 5px;
	}
	.norwd {
		display: none !important;
	}
	.rwd {
		display: block !important;
	}
	.typingboxWrapper {
		margin-left: 0 !important;
	}
	.submitBtnWrapper {
		text-align: center;
	}
	.submitBtn {
		width: 100% !important;
	}
	.form-group label {
		font-size: 0.5rem !important;
	}

	/* 채팅방개설 UI*/
	.chatWrite-modal-content {
		background-color: #fefefe;
		margin: 1% auto; /* 15% from the top and centered */
		padding: 1%;
		border: 1px solid #888;
		width: 100%; /* Could be more or less, depending on screen size */
		height: 70%;
	}
	.chatWrite-body {
		font-size: 1rem !important;
	}
	.chatWrite-body input {
		width: 100% !important;
	}
	.chatWrite-body #searchIcon {
		height: 30px !important;
		width: 30px !important;
	}
	.writeBtn {
		margin-top: 5%;
		height: 50px important;
		margin-left: 0 !important;
		width: 100% !important;
	}
}

@media ( max-height :560px) {
	.chat-modal-content {
		height: 100%;
	}
	.chatWrite-modal-content {
		height: 100%;
	}
}
</style>

</head>

<jsp:include page="change_chat.jsp" />
<jsp:include page="change_chat_write.jsp" />

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/bootstrap3-typeahead.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/jquery.sticky.js"></script>
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/js/aos.js"></script>

	<script src="resources/js/main.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/js/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/js/sb-admin-2.js"></script>
	<jsp:include page="../headNfoot/header.jsp" />

	<div class="subsite-section">
		<div class="container">
			<div class="row rwd_top">
				<div class="col-md-4 col-lg-3 mb-1 text-center">
					<div class="block-heading-1">

						<a href="/change_index" id="change"><h4 class="clickmy">물물교환</h4></a>

					</div>
				</div>

				<div class="col-md-4 col-lg-3 mb-1 text-center">
					<div class="block-heading-1">
						<a href="/change_index?select=1" id="with"><h4 class="my">공동구매</h4></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 본문 -->
	<div class="site-wrap bg-light" id="home-section"
		style="min-height: 900px;">

		<!-- 검색바 -->
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-md-12 col-lg-7 text-center searchContainer">
					<!-- 상단검색바 -->
					<form id="Search" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="col-md-10">
						<!-- <form id="lSearch" method="post"> -->
							<input type="text" class="dbSearchBar" id="localSearch" name="localSearch"	placeholder="지역 검색" value='${localSearch==null?"":localSearch}'>
						<!-- </form> -->
					</div>
					<!-- 하단검색바 -->
					<div class="col-md-10">
						<!-- <form id="tSearch" method="post"> -->
							<input type="text" class="dbSearchBar" id="titleSearch" name="titleSearch"	placeholder="제목 검색" value='${titleSearch==null?"":titleSearch}'>
						<!-- </form> -->
					</div>
					</form>
					<!-- 검색아이콘 -->
					<span class="dbIcon" onclick="if($('.dbSearchBar')[0].value || $('.dbSearchBar')[1].value){$('#Search').submit();}"> <input TYPE="IMAGE" id="dbSearch_icon"
						src="img/main/search.png" value="Submit">
					</span>
				</div>
			</div>
		</div>

		<!-- 테이블 -->
		<div class="subsite-section" style="min-height: 600px;">
			<div class="container">
				<div class="row mb-2">

					<div class="col-6 text-left"
						style="font-size: 20px; color: #FFC69F;">- 물물교환 -</div>
					<div class="col-6 text-right"
						style="font-size: 20px; color: #FFC69F;">
						<span class="writing" style="cursor: default">글쓰기</span>
					</div>
				</div>
				<div class="row">

					<table class="table table-hover tablesorter text-center"
						id="chat_tb">
						<thead>
							<tr>
								<th>번 호</th>
								<th>인 원</th>
								<th>지 역</th>
								<th>제 목</th>
								<th>방 장</th>
								<th>진행 / 마감</th>
								<th>날 짜</th>
							</tr>
						</thead>
						<tbody style="font-size: 19px;">
							<c:forEach var="chatRoomVO" items="${chatList}">
								<tr>
									<td>${chatRoomVO.chatroom_num}</td>
									<td>${chatRoomVO.chat_curmember }/${chatRoomVO.chat_maxmember}</td>
									<td>[ ${chatRoomVO.chat_address } ]</td>
									<td>
										<button class="font-gray-7 chatting" data-chatroom_num='${chatRoomVO.chatroom_num}' style="border: none; background: none;">
											${chatRoomVO.chat_title}  
										</button>
									</td>
									<td>${chatRoomVO.memberVO.user_nickname }</td>
									<td>${chatRoomVO.chat_status==1? "진행":"마감"}</td>
									<td><fmt:formatDate value="${chatRoomVO.firstdate}" pattern="yyyy-MM-dd"/></td>
									
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>
				<div class="row" style="margin-top: 20%; font-size: 23px;">
					<div class="col-12 text-center">
						<%
							if (startPage != 1) {
						%>
								<a href='javascript:movePage("${startPage-5 }")'><i	class="fas fa-angle-left"></i></a>
						<%
							}
						%>
						<%
							for (int i = startPage; i <= endPage; i++) {
						%>
								&nbsp; <a href='javascript:movePage(<%=i%>)'><%=i%></a> &nbsp;
						<%
							}
						%>
						<%
							if (endPage != totalPage) {
						%>
								<a href='javascript:movePage("${endPage+1 }")'><i class="fas fa-angle-right"></i></a>
						<%
							}
						%>
					</div>
				</div>
				<div class="row" style="margin-top: 5%;"></div>
			</div>
		</div>
		

	</div>
	
	
	<!-- <input type="text" class="typeahead form-control" autocomplete="false"> -->

	<jsp:include page="../headNfoot/footer.jsp" />
	<!-- sockjs, stomp 라이브러리 추가 -->
	<script src="/webjars/sockjs-client/1.1.2/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/2.3.3-1/stomp.min.js"></script>
	<script>

	
		// 페이지 이동 함수
		function movePage(page){
			
			if('${localSearch}'||'${titleSearch}') {
				location.href="change_index?page="+page+"&localSearch="+encodeURIComponent(localSearch)+"&titleSearch="+encodeURIComponent(titleSearch);
			}
			
			location.href="change_index?page="+page;
		}
		

		var chatModal = document.getElementById('chattingModal');
		var writeModal = document.getElementById('chatWriteModal')
		var closeSpan = document.getElementById("close");
		var closeWriteSpan = document.getElementById("closeWrite");
		var write = document.getElementsByClassName("writing")[0];
		

		// 전송버튼
		var submitBtn = document.getElementsByClassName("submitBtn")[0];
		// 채팅이 출력될 공간
		var chattingArea = document.getElementById("chattingArea");
		
		var chatRoomTitle = document.getElementById("ChattingRoomTitle");
		
		var reconnect; // 접속 에러 시 재접속 시도를 위한 변수	
		var subscription; // 구독, 구독 취소를 관리하기 위한 변수
		var sock; // 소켓
		var stompClient; // stomp
		var roomNum;	// 보낼 방 번호
		var newRoom = false; // 새로운 방 개설인지 아닌지...
		var isError = false; // 에러에 의한 방진입이 안되는 경우를 판별한다.
		
		/* var address = [];	 */// 오픈API를 사용하기 위함이다.
		
		
		//방을 만든 경우 -> 자신이 만든 방으로 자동 입장.
		$(document).ready(function(){
			/* if("${createdRoomNum}" != ''){
				var buttons = $('.chatting').toArray();
				//1. 개설한 방의 번호와 일치하는 table의 row를 찾아서 ,            
				var $btn = $(buttons.find(data => {return $(data).data('chatroom_num') == "${createdRoomNum}" }));
		        //2. 자동을 해당 row의 제목을 "click" 한다.
		        $btn.trigger("click");
			} */
			
			  //방 을 개설했을 때 insertSuccess 에 값이 들어온다,
		      //방 개설에 실패햇을 시에는 -1
		      //방 개설에 성공했을 시에는 해당 방의 번호를 반환한다.
		      var createdRoomNum =  '${createdRoomNum}';//아무값도 없으면 ''
		      if(createdRoomNum) {
		         var chatroom_num = parseInt(createdRoomNum);
		         
		         if(chatroom_num !=-1) {//방 개설에 성공했을 시에.
		            
		        	 
		        	newRoom = true;
		            //alert(chatroom_num +' 번 채팅방이 개설되었습니다');
		            var buttons = $('.chatting').toArray();
		            
		            //1. 개설한 방의 번호와 일치하는 table의 row를 찾아서 ,            
		            var $btn = $(buttons.find(data => { return $(data).data('chatroom_num') == chatroom_num;}));
		            $('h4#ChattingRoomTitle').append($btn[0].innerText);
		            //2. 자동을 해당 row의 제목을 "click" 한다.
		            $btn.trigger("click");
		            
		         } else {
		            alert('채팅방 개설에 실패하셨습니다. 인터넷 상태를 확인해보시기 바랍니다.');
		         }
		      
		      }

		})
		
		var connect = function(){
			

			// 매 접속마다 sock을 새로 생성해줘야함! 안그러면 재접속 에러.
			sock = new SockJS("/ws-stomp"); // 소켓 생성
			stompClient = Stomp.over(sock); //stompClient에 socket을 넣어준다.
			
			stompClient.connect({}, function() { // 접속
				// change(with)_user_tb에 본인 추가하는 ajax 추가.
				
				// subscribe(구독주소 , 콜백함수(메시지 받을 때 작동할 함수))                 //숫자 0 추가
				subscription = stompClient.subscribe("/sub/chat/room/"+roomNum+"/select/change", function(message) {
						// 콜백함수 -> 내가 구독한 주소로 메시지 도착 시 작동함.
						if(message.body){
							//STOMP 메시지는 반드시 string이어야한다. 만약 당신이 JSON object를 보내고 받기를 원한다면, JSON.stringfy()를 사용할 수 있고,
							//JSON object를 String으로 바꾸기 위해, JSON.parse()를 사용할 수 있다.
							var recv = JSON.parse(message.body);
							
							// 만약에 에러가 나는 경우에는 subscribe와 disconnect를 수행한다.
							if(recv['sender'] === 'ERROR') {
								
								//에러의 원인은 message로 전달된다.
								alert(recv['message']);
								isError = true;
								closeSpan.click();
								
							} else {
								//에러가 나지 않으면 다음과 ㄱ
								isError = false;
								outputs(recv['sender'], recv['message']);
								
								//방을 새로 개설했거나 채팅방에 새로운 인원이 새로 들어왔을 때만 아래 if문을 행한다.
								if(recv['userList']) {
									$('table#userList').empty();// 새로들어온 거면 userList를 다시 지웠다가 넣어준다.
									appendUserList(recv['userList']);
									//recv['chatroomDetail']['chat_title']
									//console.log(recv);
									chatRoomTitle.innerText = '('+recv['chatroomDetail']['chat_curmember'] +'/'+recv['chatroomDetail']['chat_maxmember']+') '+recv['chatroomDetail']['chat_title'];
								}
							}
						}
				    });
				// 해당 위치로 메시지 보냄 -> MessageHandler가 url 매칭되서 받음
			    // -> json 타입으로 보낸 ChatMessage 필드와 동일한 데이터들로 message 메소드의 매개변수 chatMapper 자동초기화됨.
			    //send(destination , header(없으면 {}), body(보낼 메시지, 여기선 JSON타입))
			    
			    
			    if(newRoom){
			    	stompClient.send("/pub/chat/message/change", {}, JSON.stringify({type:'NEW', roomId: roomNum, sender:"${nickname}",userNum:"${userNum}"}));
			    } else {
					stompClient.send("/pub/chat/message/change", {}, JSON.stringify({type:'JOIN', roomId: roomNum, sender:"${nickname}",userNum:"${userNum}"}));
			    }
			    
			}, function(error) {
		        if(reconnect++ <= 5) {
		            setTimeout(function() {
		                console.log("connection reconnect");
		                sock = new SockJS("/ws-stomp");
		                stompClient = Stomp.over(sock);
		                connect();
		            },10*1000);
		        }
		     });
		}
		
		
		// 채팅방에 들어가는 경우.
		$('.chatting').click(function() {
			
			// roomNum 정보를 가져온다.
			roomNum = $(this).data('chatroom_num');
			
			// 소켓 접속
			connect();
				
			// 모달창 비운 후에
			$('#chattingArea').empty();
			// 채팅자 명단을 비운다.
			$('table#userList').empty();
			// 채당방 제목을 비운다.
			$('h4#ChattingRoomTitle').empty();
			
			// 모달창 띄워줌
			chatModal.style.display = "block";
			 
			// 입력창으로 채팅커서 이동
			$('.typingbox').focus();
		
		});
		
		$('.writing').click(function(){
			writeModal.style.display = "block";
		});
		
		
		$('.writing').hover(function(){
			write.style.color = "#939393";
		}, function(){
			write.style.color = "#FFC69F";
		});
		
		closeSpan.onclick = function() {
			if(isError) {
				stompClient.send("/pub/chat/message/change", {}, JSON.stringify({type:'EXIT', roomId: roomNum, sender:"${nickname}", userNum : "${userNum}",message:"byError"}));
			} else {
				stompClient.send("/pub/chat/message/change", {}, JSON.stringify({type:'EXIT', roomId: roomNum, sender:"${nickname}", userNum : "${userNum}"}));
			}
			subscription.unsubscribe()
			stompClient.disconnect()
			chatModal.style.display = "none";
		};
		closeWriteSpan.onclick = function() {
			writeModal.style.display = "none";
		};
		
		// window.onclick 두개 있으면 함수 안 먹힐 수도 있다!!!!!!!!!!!!!!!!!
		window.onclick = function(event) {
			if (event.target == chatModal) {
				stompClient.send("/pub/chat/message/change", {}, JSON.stringify({type:'EXIT', roomId: roomNum, sender:"${nickname}", userNum : "${userNum}"}));
				subscription.unsubscribe()
				stompClient.disconnect()
				chatModal.style.display = "none";
			}
			if (event.target == writeModal) {
				writeModal.style.display = "none";
			}
		};
		
		var output = "";
		// 메시지 함수.
		var outputs = function(from, message){
			if (from == "${nickname}"){
				output += "<div class='form-group me'>";
			}
			
			else{
				output += "<div class='form-group other'>";
				output += "<label>"+from+"</label> "
			}
			
			output += "<textarea class='form-control mb-2' style='width:80%;' readonly>";
			output += message;
			output += "</textarea>";
			output += "</div>";
			chattingArea.innerHTML += output;
			output = "";
			
			chatting_contents.scrollTop = chatting_contents.scrollHeight;//채팅화면 스크롤은 항상 맨 아래로
		}
		
		function appendUserList(userList) {  
            userList.forEach(function(data){
               $('table#userList').append('<tr class="norwd" style="font-size:20px;"><td>'+data['user_nickname']+'</td></tr>');
            });
         }
		
		

		// sendButton 이벤트
		var input;
		submitBtn.onclick = function(){
				input = document.getElementsByClassName("typingbox")[0].value;
				document.getElementsByClassName("typingbox")[0].value = "";
				// 내용이 있을 경우에만 출력해준다.
				if(input !=""){
					
					stompClient.send("/pub/chat/message/change", {}, JSON.stringify({type:'TALK', roomId : roomNum, sender:"${nickname}", message: input, userNum : "${userNum}"}));
					input = "";
				}
				// 채팅창으로 키보드커서 이동
				$('.typingbox').focus();
				
			}
				
		// enter 누르면 채팅 전송.
		$('textarea.typingbox').keydown(function(e){
			if(chatModal.style.display == "block"){
			   var code = e.keyCode ? e.keyCode : e.which;
			   if(code == 13) {//엔터
			      if(e.shiftKey === false) { //shift 키를 누르지 않고 엔터하면 전송
			         submitBtn.click();
			      }
			     return false;
			   }
			 }
		}); 
		
		
		

		$(document).ready(function(){
			$('#chat_address').typeahead({
				source : function(query,result){
					//alert(query);
					 $.ajax({
						url:'http://api.vworld.kr/req/data',
						dataType: "jsonp",
						data: {
							"service":"data" , 
							"request" : "GetFeature" ,
							"data" : "LT_C_ADEMD_INFO" , 
							"key" : "FF9B70DC-66E7-3BC7-8C7F-5C02633F2E45",
							"domain" : 'http://localhost:8090/change_index', 
							"attrFilter" : "emd_kor_nm:like:"+query ,
							"geometry" : "false" , 
							"size" : "20" , 
							"columns" : "full_nm,emd_kor_nm"
						},
						jsonp: "callback",
						success: function(data) {
							let address = [];
							console.log(data);
							result($.map(data,function(item){
								if(item['status']=='OK') {
									
									//console.log(item);
									let addArr = item['result']['featureCollection']['features'];
									//console.log(item['result']['featureCollection']['features']);
									console.log(addArr[0]);
									
									$.each(addArr,function(index,item){
										address.push(item['properties']['full_nm']);
									});
									return address;
								}
								
							})) 
						}
					}); 
					
				}
			});
		});
		
		
		// 주소 입력창 엔터 누를 때 submit방지
		$('input#chat_address').keydown(function(e) {
			  if (e.keyCode === 13) {
			    e.preventDefault();
			    $('input[name=chat_title]').focus();
			};
		});
		
	</script>				
</body>
</html>