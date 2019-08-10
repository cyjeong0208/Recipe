<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%
	// 영상을 iframe으로 띄워주기 위해, videoId를 받아온다.
	String videoId = "0hYm1QOJZeo";
	if(request.getParameter("videoId")!=null){
		videoId = request.getParameter("videoId");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/jquery-ui.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../resources/css/aos.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

<style>
.thumbnails{
	overflow-y: scroll;
	border-color: #FFD7BE;
	border-style: solid;
	border-width: 1.5px;
	height: 100%;
	max-height : 1100px;
	padding-left : 0.5em;
	padding-right : 0.5em;
	margin-left : 1rem;
}
.thumbnails hr{
	border-top:1px solid #FFD7BE;
	margin-bottom:0.5rem;
}
.thumbnailcontainer{
	height:17%;
	width:1;
	padding-top:5%;
	padding-bottom:5%;
	font-size: 1rem;
}
.thumbnail{
	height:80%;
	width:100%;
}
.vContent{
	font-size:1.3rem;
}
.vContent h1{
	display:inline;
	font-size:2.3rem;
	font-family: 'Jua', sans-serif;
}
/* 영상 가로 크기로 비율 맞추기. 가로 크기는 전체 비율의 8/12(col-md-8) */
.vWrapper {
position: relative;
padding-bottom: 56.25%; /* 16:9 비율인 경우 */
/* padding-bottom값은 4:3 비율인 경우 75%로 설정합니다 */
padding-top: 25px;
height: 0;
}
.vWrapper iframe {
position: absolute;
top: 0;
left: 0;
width: 100%;
height: 100%;
}

/* 추천영상 스크롤바 없애기 */
.thumbnails::-webkit-scrollbar { 
    display: none; 
}
</style>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
// ----------------추천영상목록을 띄우는 로직
$(document).ready(function(){
var thumbnails = document.getElementById("thumbnails"); 
// 플레이리스트 아이디들
var x = "PLoABXt5mipg6mIdGKBuJlv5tmQFAQ3OYr,PLoABXt5mipg4vsOpJb0Aeldlj3A6xq4jQ,PLoABXt5mipg4lPwTJdH3Bv_4NRZHIhAQK";
var playlistIds = x.split(',');
	for(var l in playlistIds){
	$.get(
		"https://www.googleapis.com/youtube/v3/playlistItems", {
		    part: 'snippet',
		    maxResults: 50,
		    playlistId: playlistIds[l],
		    key: 'AIzaSyAry2Rne3QM_vNXaA2RoEgPXB2srNNdszI'},
		    function(data){
		        $.each(data.items, function(i, item){
			    	var output='';
			    	output += '<div class="col-md-12 thumbnailcontainer">';
			    	// 수정 필요
			    	output += '<a href="이동위치?'+item.snippet.resourceId.videoId+'">';
			    	output += '<img class="thumbnail" src="'+item.snippet.thumbnails.medium.url+'"></a>';
			    	output += '<br>'+item.snippet.title;
			    	output += '<br><hr>';
			    	output += '</div>';
			    	thumbnails.innerHTML += output;
				})
			}
		);
	}
});
</script>
</head> 
<body>
<script src="../resources/js/jquery-ui.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/jquery.magnific-popup.min.js"></script>
	<script src="../resources/js/jquery.sticky.js"></script>
	<script src="../resources/js/jquery.waypoints.min.js"></script>
	<script src="../resources/js/jquery.animateNumber.min.js"></script>
	<script src="../resources/js/aos.js"></script>
	<script src="../resources/js/main.js"></script>
	<script src="https://kit.fontawesome.com/d2c6942021.js"></script>
	
<jsp:include page="../headNfoot/header.jsp"/>

	<!-- 본문 -->
	<div class="container-fluid pt-5 bg-light">
		<div class="row">
			<!-- 좌측 -->
			<div class="col-md-1"></div>
			<div class="col-md-8 pt-3">
				<!-- 좌측 상단 -->
				<div class="col-md-12">
					<div class="vWrapper">
						<iframe width="560" height="315" src="https://www.youtube.com/embed/<%=videoId %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
				</div>	
				
				<!-- 좌측 하단 -->
				<div class="col-md-12 vContent">
				<br><br>
					<h1>강식당2 비빔국수 레시피 (백종원표)</h1> &nbsp; &nbsp; <i class="far fa-star" style="font-size:1.5rem;" title="찜하기"></i><i class="fas fa-star" style="font-size:1.5rem;" title="이미 찜 된 영상입니다."></i>
					<p><br>
					강식당2 비빔국수 만드는 방법 (백종원표)<br> 
	 				- 프로그램명: 강식당2<br> 
	 				- 회차: 5<br> 
	 				- 방영일: 2019.06.28.<br> 
	 				- 방송사: tvN<br></p>
	 				<br><br>
				</div>
			</div>
			
			<!-- 1행 우측 부분 -->
			<div class="col-md-2 thumbnails pt-3" id="thumbnails">
				<div style="text-align:center;"><h4 style="color:#FFD7BE;">이런 영상은 어때요?</h4><br></div>
				<!-- 단일 썸네일 부분 -->
				<!--
				<div class="col-md-12 thumbnailcontainer">
					<a href="#"><img class="thumbnail" src="http://img.youtube.com/vi/V0Vg2WtcXxU/0.jpg"></a>
					<br>&lt;누구보다 맛있는 오징어짬뽕&gt;
					<br><hr>
				</div> 
				-->
			</div>
		</div>
		<div class="row" style="height:3rem;"></div>
	</div>

	
	<jsp:include page="../headNfoot/footer.jsp"/>

</body>
</html>