<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.solrecipe.recipe.foodvideo.FoodVideoVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/style.css">

<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
   rel="stylesheet">

<style>
 
 body {
   font-family: 'Jua', sans-serif;
}

.text-center input#recipe_search {
   margin-top: 6%;
   margin-bottom: 23%;
   min-width: 500px;
   min-height: 85px;
   width: auto;
   height: auto;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   background-color: #FFD7BE;
   opacity: 0.5;
   border: none;
   margin-left: -50px;
   /* 텍스트 크기, 간격, 위치 */
   font-size: 1.5rem;
   letter-spacing: 5px;
   padding-left: 10%;
}

/* 클릭 시 파란테두리 없애기  */
.text-center input#recipe_search:focus, .text-center .icon #search_icon:focus,
   button#login, button#signup {
   outline: none;
}

.videoAtag{
	color: #939393;
}
.videoAtag:hover {
  color: #FFC69F;
  text-decoration: none; 
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
   top: 0%; 
   width: 70px;
   height: 90px;
   margin-left: 370px;
   margin-top: 9%;
   z-index: 1;
}

.text-center .icon #search_icon {
   height: 45px;
   width: 45px;
   opacity: 0.6;
}

.video-team-member-1 {
   margin-bottom: 20%;
   padding-bottom: 7%;
   border: solid 1px #D8D8D8;
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

.play_button2 {
   width: 100%;
   height: 100%;
   position: absolute;
   background:
      url("https://t1.daumcdn.net/cfile/tistory/272B024E567617E839")
      no-repeat;
   background-position: 45% 20%;
   background-size: 16%;
   text-align: center;
}

.thumbnail {
   width: 100%;
   height: 100%;
}

.col-lg-4, .video-team-member-1 {
   display: grid;
   grid-template-rows: auto;
}

</style>

<title>요리영상Search</title>


</head>

<body>
<script src="resources/js/jquery-3.3.1.min.js"></script>
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

<jsp:include page="../headNfoot/header.jsp" />

   <div class="container">
         <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center search">

               <form id="searchText" action="/foodvideo_search" method="get">
                  <span class="icon"> 
                     <input TYPE="IMAGE" id="search_icon" src="img/main/search.png" value="Submit">
                  </span> 
                     <input type="text" id="recipe_search" name="recipe_search" 
                     value='<c:out value="${cri.recipe_search }"/>' placeholder="영상을 찾아보아요"/>
               </form>
               
               <form id='actionForm' action="/foodvideo_search" method="get">
                  <input type="hidden" name='recipe_search' value='<c:out value="${cri.recipe_search }"/>'/>
               </form>
            </div>
         </div>
      </div>
   
   <div class="subsite-section bg-light" style="padding-top:4%; margin-top:-5%">
      <div class="container searchResult" style="margin-top: -2.5%">
         <div class="row resultList" id="thumbnails">
            <c:forEach items="${list}" var='fvideo'>
               <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                  <div class="video-team-member-1 text-center rounded">
                     <a class='videoAtag' href='javascript:goDetail("${fvideo.video_num }")'>
                     <span class="play_button2"></span>
                     <img class="thumbnail" src="${fvideo.video_thumbnail}" style="height:220px;">
                     <br><div style="margin-top:2%;">${fvVO.video_title }</div></a>
                     <br>
                     <div style="text-align:center; font-size:0.8rem;">찜횟수 ${fvVO.video_mark_cnt}
					 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
					 ${fvVO.firstdate }</div>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>
   </div>
   <jsp:include page="../headNfoot/footer.jsp" />

<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/jquery-ui.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/jquery.sticky.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/aos.js"></script>

<script src="/resources/js/main.js"></script>

<script type="text/javascript">
   var searchForm = $("#searchText");
   
   $("#search_icon").on("click", function(e){
      if(!searchForm.find("input[name='recipe_search']").val()){
         alert("키워드를 입력하세요.")
         return false;
      }
      
      e.preventDefault();
      
      searchForm.submit();
   });
</script>

<script>
// 특정 영상 선택시 detail로 이동
function goDetail(video_num){
	location.href="foodvideo_detail?video_num="+video_num;
}

// 무한스크롤
var startNum = 9;
$(document).scroll(function() {
	// footer높이만큼 전체크기에서 제외
	var maxHeight = $(document).height()-$(".site-footer").outerHeight();
	var currentScroll = $(window).scrollTop() + $(window).height();
	if(maxHeight <= currentScroll+50){
		$.ajax({
			type:"POST",
			url:"/getMoreSearchlist",
			// 이렇게 보내도 컨트롤러에서 객체 초기화된다. 신기.
			data:{"startNum":startNum, "recipe_search":"${cri_Recipe_search}" },
			dataType:"json",
			success: function(data){
				 $.each(data, function(index, item){
					 // date객체는 자바스크립트에서 본인들만의 형식으로 변환되므로, 아래와같은 변환과정을 거쳐야한다.
					 var d = new Date(item.firstdate);
					 year = d.getFullYear();
					 month = d.getMonth()+1
					 if(month<10){
						 month = "0"+(d.getMonth()+1);
					 }
					 day = d.getDate();
					 if(day<10){
						 day = "0"+(d.getDate());
					 }
					 var date = year+"-"+month+"-"+day
					 //var day = d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate();
					$("#thumbnails").append("<div class='col-lg-4 col-md-6 mb-4 mb-lg-0'>"
						+"<div class='video-team-member-1 text-center rounded'>"
						+"<a class='videoAtag' href='javascript:goDetail("+item.video_num+")'>"
						+"<span class='play_button2'></span>"
						+"<img class='thumbnail' src='"+item.video_thumbnail+"'style='height:220px;'>"
						+"<br><div>"+item.video_title+"</div></a>"
						+"<br><div style='text-align:center; font-size:0.8rem;'>찜횟수 " +item.video_mark_cnt
						+"&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;"
						+ date+"</div>"
						+"</div>"
						+"</div>"
					);
	             });
			},
		});
		startNum += 6;
	}
});
</script>

</body>
</html>
