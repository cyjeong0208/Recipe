<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<body>
<div id="msgboxModal" class="modal">
		<div class="modal-content block-heading-1">
						<span style="width:10%; margin-left:90%; cursor:pointer;"class="closeMsgBox" id="close"><i class="fas fa-times fa-2x"></i></span>
					<h3 align="center" style="color:#FFC69F;">쪽 지 함</h3>
				<h4 id="msg_write"  align="right" style="color:#FFC69F; cursor:pointer; margin-top:1rem;">- 쪽지 보내기 -</h4>
			<div class="modal-body" style="padding: 20px 50px; ">
         <form role="form" method = "get" action="#">
			 <table class="table table-hover tablesorter text-center" id="message_tb">
			 	<thead>
			 		<tr>
				 		<th>
				 			보낸이
				 		</th>
				 		<th>
				 			받는이
				 		</th>
				 		<th>
				 			내 용
				 		</th>
				 		<th>
				 			날 짜
				 		</th>
				 		<th>
				 			답변여부
				 		</th>
				 	</tr>
				 </thead>
				 <tbody id="msgBoxBody">
					<!-- ajax로 추가 -->
				 	<%-- <c:if test="${!empty list}">
					 	<c:forEach var="item" items="${list}">
					 		<tr onclick="fn_msgDetail(${item.sendmsg_num}, '${item.message_content}', '${item.sender_num}', '${item.recevMessage_content}' )">
					 		${item.sendmsg_num}, '${item.message_content}', '${item.sender_num}
					 			<td>
					 				${item.sendmsg_num}
					 			</td>
					 			<td>
					 				${item.sender_num}
					 			</td>
					 			<td>
					 			
					 				${item.message_content}
					 			</td>
					 			<td>
					 			<fmt:formatDate value="${item.firstdate}" pattern="yyyy-MM-dd" />
					 			</td>
					 			<td>
					 			<c:if test="${item.isread_num == 0}">
					 					<c:if test="${user_num!=1}">
					 					처리중
					 					</c:if>
					 					<c:if test="${user_num ==1}">
					 					미답변
					 					</c:if>
					 				</c:if>
					 				<c:if test="${item.isread_num == 1}">
					 					답변완료
					 				</c:if>
					 			</td>
					 		</tr>
					 	</c:forEach>
				 	</c:if>
				 	<c:if test="${empty list}">
				 	<tr>
				 		<td colspan="5">
				 			메세지함이 비어 있습니다.
				 		</td>
				 	</tr>
				 	</c:if> --%>
				 	
				 	
			 		<!-- <tr>
				 		<td>
				 			1
				 		</td>
				 		<td>
				 			연정쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			광고글이 있어요. 레시피그램 아람언니꺼에 .....
							</button>
				 		</td>
				 		<td>
				 			2019-02-16
				 		</td>
				 		<td>
				 			읽 음
				 		</td>
				 		
				 	</tr> -->
				 	
				 </tbody>
				 
			 </table>
			 
		</form>
		<table class="text-center paginated" style="width:20%; margin-left : 40%; margin-top:2rem;">
		</table>
		</div>
		</div>
		
	</div>
</body>
</html>