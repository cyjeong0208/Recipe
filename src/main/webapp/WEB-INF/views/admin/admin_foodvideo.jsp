<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<title>영상관리</title>

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

<!-- tablesorter : 정렬 -->
<script type="text/javascript" src="../resources/js/jquery.tablesorter.min.js"></script>
<!-- <script src="../resources/js/jquery-3.3.1.min.js"></script> -->
<script src="../resources/js/jquery-ui.js"></script>
<!-- 정렬 -->

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>
<script>

$(document).ready(function(){ 
    $("#foodvideo_tb").tablesorter();
 });

</script>
<script>
if ("${isDeleted}" != null && "${isDeleted}"== "1")
	alert("삭제 완료");
</script>
<style>


.search {
	/* margin-top: -250px; */
}

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
</style>

</head>


<body bgcolor="black" data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
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
              <a href="/admin_index" ><img src="../img/admin/admin_logo.png" width="10%"/></a>
            </div>
         </div>
       </div>
    </header>
    
    
  
    <div class="bg-dark" >
		
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center search">
      
                
				<form id="searchText" action="/admin_searchfoodvideo" method="get">
					<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					<span class="icon">
						<input  TYPE="IMAGE" id="search_icon" src="../img/main/search.png" type="submit" value="Submit" >
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
              <h4>- 영 상 관 리 -</h4>
            </div>
          </div>
          <div class="col-3 text-right">
          	<div class="block-heading-1" style="color:#FFC69F;">
             	${totalPosts }
          	</div>
          </div>
        </div>
         <div class="row mb-5">
        	<!-- tablesorter : 정렬 -->
			 <table class="table table-hover tablesorter text-center" id="foodvideo_tb">
			 	<thead>
			 		<tr>
				 		<th>
				 			번 호
				 		</th>
				 		<th>
				 			제 목
				 		</th>
				 		<th>
				 			수정날짜
				 		</th>
				 		<th>
				 			찜 수
				 		</th>
				 		<th>
				 			삭 제
				 		</th>
				 	</tr>
				 </thead>
				 <tbody>
				 	<c:forEach var="fvVO" items="${foodvideoList}">
				 		<tr>
					 		<td>
					 			${fvVO.video_num }
					 		</td>
					 		<td>
					 			<a href="/foodvideo_detail?video_num=${fvVO.video_num }">${fvVO.video_title }</a>
					 		</td>
					 		<td>
					 			${fvVO.firstdate }
					 		</td>
					 		<td>
					 			${fvVO.video_mark_cnt }
					 		</td>
					 		<td>
					 			<a href="javascript:deleteVideo(${fvVO.video_num })">
					 				삭제
					 			</a>
					 		</td>
				 		</tr>
					</c:forEach> 
			 		<!-- 
			 		<tr>
				 		<td>
				 			1
				 		</td>
				 		<td>
				 			[강식당2] 김치밥
				 		</td>
				 		<td>
				 			2019-02-16
				 		</td>
				 		<td>
				 			9,323,442회
				 		</td>
				 		<td>
				 			삭 제
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			4
				 		</td>
				 		<td>
				 			[백종원의 요리비책] 만능양파볶음 활용
				 		</td>
				 		<td>
				 			2019-01-08
				 		</td>
				 		<td>
				 			581,723회
				 		</td>
				 		<td>
				 			삭 제
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			2
				 		</td>
				 		<td>
				 			[백종원의 요리비책] 초간단 김치찌개
				 		</td>
				 		<td>
				 			2019-08-09
				 		</td>
				 		<td>
				 			3,700,000회
				 		</td>
				 		<td>
				 			삭 제
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			3
				 		</td>
				 		<td>
				 			[강식당1] 강호동 탕수육 라면 & 이수근 삼겹살 김밥
				 		</td>
				 		<td>
				 			2018-07-27
				 		</td>
				 		<td>
				 			1,720,000회
				 		</td>
				 		<td>
				 			삭 제
				 		</td>
				 	</tr> 
				 	-->
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
					<a href='javascript:movePage("${endPage+1 }")'><i class="fas fa-angle-right"  style="color:#FFC69F;"></i></a>
					<%} %>
				</div>	
			</div>
			<div class="row" style="margin-top:5%;"></div>
			
		</div>
	</div>
      

   </div> 
           
<script>
// 페이지 이동 함수
var search = "${search}"
function movePage(page){
	// 검색 안한 경우
	if(search==""){
		location.href="admin_foodvideo?page="+page;	
	}
	// 검색한 경우
	else{
		location.href="admin_searchfoodvideo?page="+page+"&search="+search;
	}
}

// 삭제 함수
function deleteVideo(video_num){
	if (confirm("정말 삭제하시겠습니까?")==true){    //확인
		location.href="admin_foodvideo_delete?video_num="+video_num+"&page="+"${page}"+"&search="+search;
	 }else{   //취소
		return false;
	 }
}

</script>

</body>
</html>