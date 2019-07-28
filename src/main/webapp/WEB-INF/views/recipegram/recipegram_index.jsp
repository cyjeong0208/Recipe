<%@page import="com.solrecipe.recipe.recipegram.service.RecipegramService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page import="com.solrecipe.recipe.recipegram.domain.RecipegramVO" %>
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
<!-- MetisMenu CSS -->
<link href="resources/css/metisMenu.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
	
<%
	
%>

<title>레시피그램</title>

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

.new_like {
	position: static;
	float: right;
	margin-top: -18%;
}

.btn-default {
	background: white;
	border: solid 1px #FFC69F;
	color: #FFC69F;
}

.foodImg {
	width: 100%;
	height: 370px;
}

.mainview {
	margin-bottom: 5%;
}

.reply {
	border: solid 1px;
	border-radius: 30px;
	background: white;
	padding: 4px;
}

@media ( max-width :400px) {
	.reply {
		width: 100%;
	}
}

.replycont {
	border: none;
	border-radius: 35px;
	width: 80%;
	outline: none;
	padding-left: 13px;
	margin-right: 20px;
}

.replybtn {
	border: none;
	border-radius: 30px;
	background: white;
	outline: none;
	float: right;
	color: #FFD7BE;
}

.info {
	ovreflow: hidden;
}

.info .info_data.hiddenCom {
	white-space: nowrap;
	word-wrap: normal;
	width: 89%;
	overflow: hidden;
	text-overflow: ellipsis;
	float: left;
}

.btn-moreInfo {
	/* display: none; */
	/* white-space: nowrap; */
	float: right;
}

@media screen and (min-width: 400px) {
	.info .info_data.hiddenCom {
		width: 70%;
	}
}

.carousel-inner>.carousel-item>img {
	width: 100%;
	min-height: 300px;
	max-height: 400px;
}

@media ( max-width :400px) {
	.favorite {
		margin-top: 5%;
	}
}
</style>

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

	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

 -->
<jsp:include page="../headNfoot/header.jsp" />

	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-12 col-lg-7 text-center search">

				<form id="searchText" method="get" action="/recipegram_index">
					<span class="icon"> 
						<input TYPE="IMAGE" id="search_icon" src="img/main/search.png" value="Submit">
					</span> 
						<input id="recipe_search" name="recipe_search" 
						value='<c:out value="${cri.recipe_search }"/>' placeholder="레시피그램을 찾아보아요">
				</form>
				
				<form id='rgActionForm' action="recipegram_index" method="get">
					<input type="hidden" name='recipe_search' value='<c:out value="${cri.recipe_search }"/>'/>
				</form>
				
				

				<div class="row"
					style="float: right; margin-top:-10%; margin-right: -20%;">
					<div class="col-xs-5 text-left">
						<div class="previous">
							<button type="button" id="button_new" class="btn btn-default btn-lg"  style="border:none;">
								<span class="">최신순</span>
							</button>
						</div>
					</div>
					&nbsp;
					<div class="col-xs-5 text-right">
						<div class="next">
							<button type="button" id="button_like" class="btn btn-default btn-lg" style="border:none;">
								<span class="">좋아요순</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="subsite-section bg-light" style="padding-bottom: 2%;">
		<!-- 로그인 시   -->
		<sec:authorize access="isAuthenticated()">
			<div class="container  text-right">
				<div class="next">
					<button type="button" class="btn btn-default btn-lg"style="border:none; background:none;">
						<span class="font-size-20"><a href="recipegram_write">+ 추가</a></span>
					</button>
				</div>
			</div>
		</sec:authorize>
		
		<c:forEach items="${list}" var="rglist" > 
		<!-- 나만보기가 아닐 경우...  -->
		<c:if test="${rglist.recipegram_secret eq 0}">
		<div class="container mainview" id="mainview" >
		
			
				<span id="nickname" class=" font-size-17" style="color: #65737e;"><c:out value="${rglist.user_nickname }"/></span>
				<br>
				<div class="row col-md-12 col-sm-12 col-xs-12">
					<!-- carousel -->
					<div id="demo${rglist.recipegram_num }" class="col-md-6 carousel" data-ride="carousel"
						data-interval="false">

						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#demo${rglist.recipegram_num }" data-slide-to="0" class="active"></li>
							<li data-target="#demo${rglist.recipegram_num }" data-slide-to="1"></li>
							<li data-target="#demo${rglist.recipegram_num }" data-slide-to="2"></li>
						</ul>
						<!-- The slideshow -->
						
						<div class="carousel-inner" role="listbox">
							<c:forEach items="${rglist.imgList }" var="img" varStatus="status">
								<c:if test="${status.index eq 0}">
									<div class="carousel-item active">
										<img src="./upload/${img.img_name }" alt="">
									</div>
								</c:if>
								<c:if test="${status.index > 0}">
									<div class="carousel-item">
										<img src="./upload/${img.img_name }">
									</div>
								</c:if>
								
							</c:forEach>
							
							
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo${rglist.recipegram_num }" data-slide="prev"
							role="button"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span>
						</a> 
						<a class="carousel-control-next" href="#demo${rglist.recipegram_num }" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span>
						</a>
						
					</div>

					<div class="col-md-6" style="padding-left: 1.5%; padding-top: 2%;">
						<div class="col-md-10 col-sm-12 col-xs-12">
							<!-- <input type="text" value="" readonly
							style="width: 100%;"> -->
						<div class="info" style="" id="info_data${rglist.recipegram_num }">
							<div class="info_data" class="font-size-17" style="color: black; width:100%;">
								${rglist.recipegram_content  }
									<c:set var="content" value="${rglist.recipegram_content }"/> 
									
								<span class="btn-moreInfo" class="font-size-17" id="btn-moreInfo${rglist.recipegram_num }"
									style="color: #d2d2d2;">더보기</span>
							</div>
						</div>
						</div>
						<div class="col-md-10 favorite" style="margin-top: 15%;">
							<img src="img/recipegram/favorite.png" style="width: 1.8rem;"
								onclick="ChangeImage()" name="favorite">&nbsp;
							 <img src="img/recipegram/add.png" style="width: 1.8rem;">
							 <span class="rgdate font-size-11" style="float:right;color: #d2d2d2;">  
							 	${fn:split(rglist.firstdate,'-')[0]}년 ${fn:split(rglist.firstdate,'-')[1]}월 ${fn:split(rglist.firstdate,'-')[2]}일 

							</span> 
						</div>
     	
     	
	     		<form id="replyListForm" name="replyListForm" method="post">
	        		<div id="replyList">
       
     					<div class="row col-md-12">
							<br>
							<div class="info_data2">
								<div class="col-md-12 rrr">
									<span class="font-size-17" style="color: #65737e;">레시피2</span>&nbsp;
									<span class="info_re font-size-17" style="color: black;">아아아아아아아아아아아
										보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>
									<span class="font-size-15" style="color:#d2d2d2; float:right;">답글 달기</span>	
								</div>
								
							</div>
						</div>
					  </div>
		   		 </form>
			<form id="replyForm" name="replyForm" method="post">
		
			<div class="col-md-10">
				
						<span id="load" class="font-size-17" style="width: 100%;">댓글 <span class="font-size-17" id="rCnt"></span>개 더보기</span><br>
						<fieldset class="reply">
							<input class="replycont" id="reply" name="reply" type="text" value="">
							<input class="replybtn"  type="button" value="게시" onClick="fn_comment('${result.code }')">
						</fieldset>
					
					</div>
					</form>	
				</div>
			</div>
			
				
		</div>
	<!-- </div> -->

</c:if>
	 </c:forEach>
	

	<jsp:include page="../headNfoot/footer.jsp" />

	

 

	<script type="text/javascript">
		var state = 0;
		var su = 0;
		function ChangeImage() {
			if (state == 0) {
				document.favorite.src = "img/recipegram/favorite.png"
				su++;
				state = 1;
			} else {
				document.favorite.src = "img/recipegram/hearts.png"
				su--;
				state = 0;
			}
		}
	</script>

	<script>


		jQuery(function($) {
			var colorbox = $('.info .info_data');
			var content = '${content}';
			colorbox.each(function() {
				$(this).outerHeight();
				
				if (content.length > 21) {
					$(this).addClass('hiddenCom');
					var btnMoreCmt = $(this).siblings('.btn-moreInfo');
					btnMoreCmt.show();
					btnMoreCmt.on("click", function() {
						$('.info_data').removeClass('hiddenCom');
						$('.info_data').show();
						$(this).remove();
					});
				}
			});
		});
	</script>
	
	<script type="text/javascript">
		var searchText = $("#searchText");
		
		$("#search_icon").on("click", function(e){
			if(!searchText.find("input[name='recipe_search']").val()){
				alert("카워드를 입력하세요.");
				return false;
			}
			
			e.preventDefault();
			
			searchText.submit();
		});
	</script>
	<script>
	// 무한스크롤
	var startNum = 3;
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";

	/* $(document).scroll(function() {
		// footer높이만큼 전체크기에서 제외
		var maxHeight = $(document).height()-$(".site-footer").outerHeight();
		var currentScroll = $(window).scrollTop() + $(window).height();

		if(maxHeight <= currentScroll+50){
			$.ajax({
				type:"POST",
				url:"/getMoreNewRecipegram",
				data:{"startNum":startNum},
				beforeSend: function(xhr) {
			          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    },
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
						 //var day = d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate();
						$("#mainview").append("<span id='nickname' class='font-size-17' style='color: #65737e;'><c:out value='${rglist.user_nickname }'/></span><br>"
								+"<div class='row col-md-12 col-sm-12 col-xs-12'>"
								+"<div id='demo${rglist.recipegram_num }' class='col-md-6 carousel' data-ride='carousel' data-interval='false'>"
								+"<ul class='carousel-indicators'>"
								+"<li data-target='#demo${rglist.recipegram_num }' data-slide-to='0' class='active'></li>"
								+"<li data-target='#demo${rglist.recipegram_num }' data-slide-to='1'></li>"
								+"<li data-target='#demo${rglist.recipegram_num }' data-slide-to='2'></li></ul>"							
								+"<div class='carousel-inner' role='listbox'>"
								+"<c:forEach items='${rglist.imgList }' var='img' varStatus='status'>"
								+"<c:if test='${status.index eq 0}'>"
								+"<div class='carousel-item active'>"
								+"<img src='./upload/${img.img_name }' alt=''></div></c:if>"
								+"<c:if test='${status.index > 0}'>"
								+"<div class='carousel-item'>"
								+"<img src='./upload/${img.img_name }'></div></c:if></c:forEach></div>"
								+"<a class='carousel-control-prev' href='#demo${rglist.recipegram_num }' data-slide='prev' role='button'>" 
								+"<span class='carousel-control-prev-icon' aria-hidden='true'></span> </a> "
								+"<a class='carousel-control-next' href='#demo${rglist.recipegram_num }' role='button' data-slide='next'>"
								+"<span class='carousel-control-next-icon' aria-hidden='true'></span> </a> </div>"
								+"<div class='col-md-6' style='padding-left: 1.5%; padding-top: 2%;'>"
								+"<div class='col-md-10 col-sm-12 col-xs-12'>"
								+"<div class='info_data' id='info_data${rglist.recipegram_num }'>"
								+"${rglist.recipegram_content  }"
								+"<c:set var='content' value='${rglist.recipegram_content }'/> "
								+"<span class='btn-moreInfo' class='font-size-17' id='btn-moreInfo${rglist.recipegram_num }' style='color: #d2d2d2;'>더보기</span></div></div>"
								+"<div class='col-md-10 favorite' style='margin-top: 15%;'>"
								+"<img src='img/recipegram/favorite.png' style='width: 1.8rem;'' onclick='ChangeImage()' name='favorite'>&nbsp;"
								+"<img src='img/recipegram/add.png' style='width: 1.8rem;'>"
								+"<span class='rgdate font-size-11' style='float:right;color: #d2d2d2;'>"  
								+"${fn:split(rglist.firstdate,'-')[0]}년 ${fn:split(rglist.firstdate,'-')[1]}월 ${fn:split(rglist.firstdate,'-')[2]}일 "
								+"</span>  </div>"
								+"<div class='row col-md-12'> <br>"
								+"<div class='info_data2'>"
								+"<div class='col-md-12 rrr'>"
								+"<span class='font-size-17' style='color: #65737e;'>레시피2</span>&nbsp;"
								+"<span class='info_re font-size-17' style='color: black;'>아아아아아아아아아아아 보여요!!!! 블라블라블라블라블라블라블라블라블라블라블라블라</span>"
								+"</div> </div> </div>"
					 			+"<div class='col-md-10'>"
								+"<span id='load' class='font-size-17' style='width: 100%;'>댓글 더보기</span><br>"
								+"<fieldset class='reply'>"
								+"<input class='replycont' type='text' value=''>"
								+"<input class='replybtn'  type='button' value='게시'>"
								+"</fieldset> </div> </div> </div>"
						);
		             });
				},
			});
			startNum += 3;
		}
	}); */
	</script>

<script>

// 댓글 등록하기(Ajax)

function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/insertReply'/>",
        data:$("#replyForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#reply").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 

// 초기 페이지 로딩시 댓글 불러오기

$(function(){
    
    getCommentList();
    
});
 

//댓글 불러오기(Ajax)

function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/replyList'/>",
        dataType : "json",
        data:$("#replyForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                	html += "<div class='row col-md-12'><br>";
                	html += "<div class='info_data2'>";
					html += "<div class='col-md-12 rrr'>";
					html += "<span class='font-size-17' style='color: #65737e;'>"+data[i].nickname+"</span>&nbsp";
					html += "<span class='info_re font-size-17' style='color: black;'>"+data[i].reply_content</span>
					html += "<span class='font-size-15' style='color:#d2d2d2; float:right;'>답글 달기</span>";	
					html += "</div> </div> </div>";
                	
                }
                
            }
            
            $("#rCnt").html(cCnt);
            $("#replyList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
</script>	

</body>
</html>