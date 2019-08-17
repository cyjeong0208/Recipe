<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.solrecipe.recipe.user.domain.MemberVO" %>
<!DOCTYPE html>
<html>
<%
	int startPage = (int)request.getAttribute("startPage");
	int endPage = (int)request.getAttribute("endPage");
	int totalPage = (int)request.getAttribute("totalPage");
	int curPage = (int)request.getAttribute("page");
%>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>회원관리</title>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/jquery-ui.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">

<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">

<link rel="stylesheet" href="../resources/css/aos.css">

<link rel="stylesheet" href="../resources/css/style.css">
<!-- MetisMenu CSS -->
<link href="../resources/css/metisMenu.min.css" rel="stylesheet">


<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript" src="../resources/js/jquery.tablesorter.min.js"></script>
<!-- <script src="../resources/js/jquery-3.3.1.min.js"></script> -->
<script src="../resources/js/jquery-ui.js"></script>
<script>

$(document).ready(function(){ 
    $("#users_tb").tablesorter();
 });

</script>
<style>



/* -webkit-border-radius: 5px;
  			-moz-border-radius: 5px;
  			두개는 테두리를 둥글게  */
.text-center input#search {
	width: 100%;
	height: 7.0rem;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: white;
	opacity: 0.7;
	border: none;
	margin-left: -2%;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.5rem;
	letter-spacing: 5px;
	padding-left: 10%;
}

/* 클릭 시 파란테두리 없애기  */
.text-center input#search:focus, .text-center .icon #search_icon:focus
	{
	outline: none;
}

/* placeholder */
.text-center .placeholder {
	padding-left: 20%;
	font-size: 1.5rem;
	color: #65737e;
}

/* z-index : 숫자가 적으면 뒤로 배치 크면 앞으로 배치 */
.text-center .icon {
	position: absolute;
	top: 10%;
	width: 75%;
	/* height: 30%; */
	margin-left: 45%;
	margin-top: 3%;
	z-index: 1;
}

.text-center .icon #search_icon {
	height: 50px;
	width: 50px;
	opacity: 0.8;
}

@media (max-width:500px){
	.table {
		font-size : 0.7em;
	}
}

.btns{
	border:none; 
	background:none;
	color:#939393;
	outline:none;
}


/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.msg-modal-content {
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
	height: auto;
}@media (max-width:500px){
	.msg-modal-content{
		margin: 2% 5%; /* 15% from the top and centered */
		padding: 1%;
		width: 93%;
	}
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

</style>

</head>


<body bgcolor="black">

 <%-- <jsp:include page = "../message/message_write.jsp"/> --%>

<div class="site-wrap"  id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
      
   <!-- Header -->
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">
		<div class="container">
        <div class="row align-items-center position-relative">
          
            <!-- 로고 -->
            <div class="site-logo">
              <a href="admin_index.jsp" ><img src="../img/admin/admin_logo.png" width="10%"/></a>
            </div>
         </div>
       </div>
    </header>
    
    
    <div class="bg-dark" >
		
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center search">
      
                
				<form id="searchText" action="/admin_searchuserlist" method="get">
					<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					<span class="icon">
						<input  TYPE="IMAGE" id="search_icon" src="../img/main/search.png" value="Submit" >
					</span>
					<input type="text" id="search" name="search" value="${search }">
				</form>
            </div>
          </div>
        </div>

      </div>
	
	 <div class="subsite-section">
      <div class="container">
        <div class="row mb-2">
        
          <div class="col-9 text-left">
           <div class="block-heading-1">
              <h4>- 회 원 관 리 -</h4>
            </div>
          </div>
         <div class="col-3 text-right">
          	<div class="block-heading-1" style="color:#FFC69F;">
             	${totalPosts }
          	</div>
          </div>
        </div>
          <div class="row mb-5">
        
			 <table class="table table-hover tablesorter text-center" id="users_tb">
			 	<thead>
			 		<tr>
				 		<th>
				 			번 호
				 		</th>
				 		<th>
				 			이메일
				 		</th>
				 		<th>
				 			이 름
				 		</th>
				 		<th>
				 			닉네임
				 		</th>
				 		<th>
				 			경 고
				 		</th>
				 		<th>
				 			블 랙
				 		</th>
				 	</tr>
				 </thead>
				 <tbody>
					<c:forEach items="${userlist}" var="userList"> 
					<%-- <%for(int i=0; i<userlist.size(); i++){ %> --%>
			 		<tr>
				 		<td>
				 		   ${userList.user_num} 
				 		   <%-- <%=userlist.get(i).getUser_num() %> --%>
				 		</td>
				 		<td>
				 		   ${userList.user_username } 
				 		 	<%-- <%=userlist.get(i).getUser_username() %> --%>
				 		</td>
				 		<td>
				 		  ${userList.user_name }
				 			<%--  <%=userlist.get(i).getUser_name() %> --%>
				 		</td>
				 		<td>
				 		 ${userList.user_nickname }
				 			<%--  <%=userlist.get(i).getUser_nickname() %> --%>
				 		</td>
				 		<td>
				 			<input type="button" class="btns" id="warning_btn${userList.user_num }" onclick="warning_click(${userList.user_num});" value="${userList.user_warning }"/>
				 		</td>
				 		<td>
				 			<input type="button" class="btns" id="black_btn${userList.user_num }" <%-- onclick="black_click(${userList.user_num});" --%> value="${userList.user_black }"/> 
				 		</td> 
				 	</tr>
					  </c:forEach>
					  <%-- <%} %> --%>
				 </tbody>
				 
			 </table>
		
		</div>
		
		<!-- 페이징 -->
		<div class="row" style="font-size:23px;">
				<div class="col-12 text-center">
					<%if(startPage != 1){ %>
					<a href='javascript:movePage("${startPage-10 }")'><i class="fas fa-angle-left" style="color:#FFC69F;"></i></a>
					&nbsp;
					&nbsp;
					<%}%>
					<%for(int i=startPage; i<=endPage; i++){
						if (i==curPage){
					%>
						<a href='javascript:movePage(<%=i %>)' style="color:white;"><%=i %></a>
						&nbsp;
						&nbsp;
					<%}else{ %>
						<a href='javascript:movePage(<%=i %>)'><%=i %></a>
						&nbsp;
						&nbsp;
					<%}} %>
					<%if(endPage != totalPage){ %>
					<a href='javascript:movePage("${endPage+1 }")'><i class="fas fa-angle-right"  ></i></a>
					<%} %>
				</div>	
			</div>
			<div class="row" style="margin-top:5%;"></div> 
		</div>
	</div>
      

    </div>
    
<script type="text/javascript">
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";

var modal = document.getElementById('write_msg');
var span1 = document.getElementsByClassName("close")[0];


	function black_click(userNum){
		var black_cnt = document.getElementById('black_btn' + userNum).value;
		console.log(black_cnt);
		
	 		$.ajax({
				url:"/admin_black",
				type:"POST",
				dataType:"text",
				data: {"user_num":userNum, "user_black":black_cnt, "user_username" : userName},
			    beforeSend: function(xhr) {
				          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success:function(data){
					console.log(userNum);
					console.log(typeof data);
					console.log("aaaa: " +black_cnt);
					
				/* 	if(black_cnt == 0){
						
						var data_plus = parseInt(data)+1;
						console.log(typeof data_plus);
						console.log('result1 : ' + data_plus);
						
						document.getElementById('black_btn' + userNum).value = '1';
						
					}else{ */
						/* var data_m = parseInt(data)-1;
						console.log(typeof data_m);
						console.log('result2 : ' + data_m); */
					if(black_cnt == 1){	
						document.getElementById('black_btn' + userNum).value = '0';
						
					}
					
				},
				error:function(request, status, error){
					console.log("code : " + request.status +"\n" + "message : " + request.responseText + "\n" + " error : " + error);
					alert("실패" + userNum + "&" + black_cnt);
				}
			}); 
			 
	}

	
	function warning_click(userNum){
		
		var warning_cnt = document.getElementById('warning_btn' + userNum).value;
		var black_cnt = document.getElementById('black_btn' + userNum).value;
		
		var warning_btn = document.getElementById('warning_btn' + userNum);
		console.log(warning_cnt);

	/* 	var black_name =  document.getElementById('black_name' + userNum).value;
		console.log(black_name); */
		
 		$.ajax({
			url:"/admin_warning",
			type:"POST",
			dataType:"text",
			data: {"user_num":userNum, "user_warning":warning_cnt, "user_black": black_cnt},
		    beforeSend: function(xhr) {
			          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(data){
				console.log(userNum);
				console.log(typeof data);
				console.log("warning: " + warning_cnt);
				
				if(warning_cnt == 0){
					
					document.getElementById('warning_btn' + userNum).value = 1;
					
					/* modal.style.display = "block";
					span1.onclick = function() { modal.style.display = "none"; } */

				}else  if(warning_cnt==1){
					
					document.getElementById('warning_btn' + userNum).value = 2;
					/* modal.style.display = "block";
					span1.onclick = function() { modal.style.display = "none"; } */
					
				}else if(warning_cnt==2){
				
					document.getElementById('warning_btn' + userNum).value = 3;
					document.getElementById('black_btn' + userNum).value = 1;
				
				/* 	document.getElementById('black_name' + userNum).value= userNum;  
					
					console.log(document.getElementById('black_name' + userNum).value); */
					
					/* modal.style.display = "block";
					span1.onclick = function() { modal.style.display = "none";  } */
				}
				
			},
			error:function(request, status, error){
				console.log("code : " + request.status +"\n" + "message : " + request.responseText + "\n" + " error : " + error);
				alert("실패" + userNum + "&" + warning_cnt);
			}
		}); 
	}
</script>


<script type="text/javascript">
	//페이지 이동 함수
	var search = "${search}"
	function movePage(page){
		//검색 안한 경우
		if(search==""){
			location.href="admin_users?page="+page;
		}
		//검색한 경우
		else{
			location.href="admin_searchuserlist?page="+page+"&search="+search;
		}
	}
</script>
    
          
           
</body>
</html>