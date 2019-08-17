<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.solrecipe.recipe.foodvideo.FoodVideoVO"%>
<%
	FoodVideoVO fvVO = (FoodVideoVO)request.getAttribute("fvVO");
//	ArrayList<FoodVideoVO> playList = (ArrayList)request.getAttribute("playList");
	int isMarked = (int)request.getAttribute("isMarked");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/aos.css">
<link rel="stylesheet" href="resources/css/style.css">
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

/* 썸네일 스크롤바 */
.thumbnails::-webkit-scrollbar-track
{
	border-radius: 10px;
	background-color: #F8F9FA;
}

.thumbnails::-webkit-scrollbar
{
	width: 8px;
	background-color: #F5F5F5;
}

.thumbnails::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	background-color: #FFD7BE;
}

/* 반응형 */
@media(max-width:500px){
	.thumbnails{
		margin-left:0.5rem;
		margin-right:0.5rem;
	}
	.thumbnails::-webkit-scrollbar
	{
	width: 4px;
	}
}

</style>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
// 추천영상 클릭시
function goDetail(video_num){
	location.href="foodvideo_detail?video_num="+video_num;
}
	


// ----------------추천영상목록을 띄우는 로직
/* 
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
*/

</script>

</head> 
<body>
<script src="resources/js/jquery-ui.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="resources/js/main.js"></script>
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
						<iframe width="560" height="315" src="https://www.youtube.com/embed/<%=fvVO.getVideo_id() %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
				</div>	
				
				<!-- 좌측 하단 -->
				<div class="col-md-12 vContent" style="letter-spacing: 1px; word-spacing: 3px; line-height: 200%;">
				<br><br>
					<h1 style="color:#FFC69F;"><%=fvVO.getVideo_title() %></h1> &nbsp; &nbsp; 
					<%if(isMarked == 0){ %>
					<i id="markIcon" class="far fa-star" style="font-size:2rem;" onClick=marking() title="찜하기"></i>
					<%}else if(isMarked == 1){ %>
					<i id="markIcon" class="fas fa-star" style="font-size:2rem;" onClick=unmarking() title="이미 찜 된 영상입니다."></i>
					<%}else{} %>
					<br>
					<span id="markCntArea" style="font-size:1rem;">찜횟수 ${fvVO.video_mark_cnt }회</span>
					<p><hr><br>
					<%=fvVO.getVideo_content() %>
				
	 				<br><br>
				</div>
			</div>
			
			<!-- 1행 우측 부분 -->
			<div class="col-md-2 thumbnails pt-3" id="thumbnails">
				<div style="text-align:center;"><h4 style="color:#FFD7BE;">이런 영상은 어때요?</h4><br></div>
				<c:forEach var="fvVO" items="${playList }">
					<div class="col-md-12 thumbnailcontainer">
						<a href='javascript:goDetail("${fvVO.video_num }")'><img class="thumbnail" src="${fvVO.video_thumbnail }"></a>
					<br>${fvVO.video_title }
					<br><hr>
					</div>
				</c:forEach> 
			</div>
		</div>
		<div class="row" style="height:3rem;"></div>
	</div>
	
	<jsp:include page="../headNfoot/footer.jsp"/>
	
<script>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";
//무한스크롤 구현
var thumbnails = document.getElementsByClassName("thumbnails")[0];
    
var startNum=5;
$(".thumbnails").scroll(function() {
	var maxHeight = thumbnails.scrollHeight;
	var currentScroll = thumbnails.clientHeight + thumbnails.scrollTop;
	if (maxHeight <= currentScroll) {
		$.ajax({
			type:"POST",
			async:false,
			url:"/getMorePlaylist",
			data:{"startNum":startNum, "playList":"<%=fvVO.getVideo_playlist() %>"},
			dataType:"json",
			beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
			success: function(data){
				 $.each(data, function(index, item){
					$(".thumbnails").append("<div class='col-md-12 thumbnailcontainer'>"
						+"<a href='javascript:goDetail("+item.video_num+")'>"
						+"<img class='thumbnail' src='"+item.video_thumbnail+"'></a>"
						+"<br>"+item.video_title
						+"<br><hr>"
						+"</div>"
					);
	             });
			}
		});
		startNum += 5;
	};
});

<%-- 
var startNum=5;

	$(".thumbnails").scroll(function() {
	var maxHeight = thumbnails.scrollHeight;
	var currentScroll = thumbnails.clientHeight + thumbnails.scrollTop;
		if (maxHeight <= currentScroll+50) {
			
			for(k=startNum; k<startNum+5; k++){
	 			$(".thumbnails").append("<div class='col-md-12 thumbnailcontainer'>");
		 		$(".thumbnails").append("<a href='javascript:goDetail(<%=playList.get(k).getVideo_num()%>)'>");
		 		$(".thumbnails").append("<img class='thumbnail' src=<%=playList.get(k).getVideo_thumbnail() %>></a>");
		 		$(".thumbnails").append("<br><%=playList.get(k).getVideo_title() %>");
		 		$(".thumbnails").append("<br><hr>");
		 		$(".thumbnails").append("</div>");
 			
			};
	 		startNum += 5;
	 		System.out.println(startNum);
	}
})
 --%>

	// 찜
	var markCnt = ${fvVO.video_mark_cnt};
	var user_num = ${user_num};
	function marking(){
		$.ajax({
			type:"GET",
			async:false,
			url:"/markVideo",
			data:{"video_num": <%=fvVO.getVideo_num() %>, "user_num": user_num},
			dataType:"text",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
			success: function(data){
				markCnt ++;
				$("#markCntArea").html("찜횟수 "+(markCnt)+"회");
				$("#markIcon").attr('class', 'fas fa-star');
				$("#markIcon").attr('onClick', "unmarking()");
			},
			error:function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	}

	function unmarking(){
		$.ajax({
			type:"GET",
			async:false,
			url:"/unmarkVideo",
			data:{"video_num":<%=fvVO.getVideo_num() %>, "user_num":user_num },
			dataType:"text",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
			success: function(data){
				markCnt--;
				$("#markCntArea").html("찜횟수 "+(markCnt)+"회");
				$("#markIcon").attr('class', 'far fa-star');
				$("#markIcon").attr('onClick', "marking()");
			},
			error:function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	}	
	
</script>
</body>
</html>