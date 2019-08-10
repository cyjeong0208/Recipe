<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<title>레시피그램</title>

<style>
body {
	font-family: 'Jua', sans-serif;
}


/* 클릭 시 파란테두리 없애기  */
.user .row input#user_info
	button#login, button#signup {
	outline: none;
}

.user{
	-webkit-border-radius: 10px;
  	-moz-border-radius: 10px;
}
@media ( max-width :500px) {
	.user{
		margin-left:0.5%;
		
	}
	
}

.user #user_img{
	width:100%;
}@media ( max-width :500px) {
	.user #user_img{
		width:40%;
	}
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
.text-center input#recipe_search:focus, .text-center .icon #search_icon:focus, #user_nickname:focus,#user_info:focus,
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
	border: solid 1px rgba(0,0,0,.15);
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
	margin-top: 1%;
	margin-left:5%;
}

.info {
	ovreflow: hidden;
}

.info .info_data.hidden {
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
	.info .info_data.hidden {
		width: 70%;
	}
}

.carousel-inner>.carousel-item>img {
	width: 100%;
	height: 457px;

}

@media (max-width: 400px) {
	.carousel-inner>.carousel-item>img {
		width: 100%;
		height:40%;
	}
}

.info_data{
	color: black; 
	width: 100%;

}

 @media (max-width: 400px) {
	.info_data {
		width: 100%;
		height:100px;
	}
} 

@media ( max-width :400px) {
	.favorite {
		margin-top: 5%;
	}
}

textarea {
	resize: none;
}

.contentCss {
	white-space: nowrap;
	word-wrap: normal;
	width: 50%;
	overflow: hidden;
	text-overflow: ellipsis;
	float: left;
}




.rereplybtn {
	border: none;
	border-radius: 30px;
	background: none;
	outline: none;
	
	color: #939393;
	margin-top : 2%;
}

.con{
   width:100%;
   height: 300px;
   overflow-y:scroll;
   -ms-overflow-style:none;
}

.con::-webkit-scrollbar{
   display:none;
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
	<c:if test = "${userlist.isopen eq 0 }">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-12 col-lg-7 text-center ">

				<div class="row col-md-12 text-center mt-5 user"
					style="float: center; margin-right: -20%; border:2px solid #FFD7BE;">
					<c:choose>
					
					<c:when test="${userlist.isopen eq 0 }">
						<div class="col-lg-3 col-md-3 mt-2 mb-2">
						<c:choose>
							<c:when test = "${userlist.user_img eq '' || userlist.user_img eq null}">
								<img src="img/user/base_user.png" id="user_img" />
							</c:when>
							<c:otherwise>
								<img src="./user/${userlist.user_img }" id="user_img" />
							</c:otherwise>
						</c:choose>		
							
						</div>
						<div class="col-lg-9 col-md-9 mt-4 mb-2">
							<input type="text" class="text-center" id="user_nickname" style="border:none; color:#FFC69F;" value="[ ${userlist.user_nickname } ]"readonly>
							<c:choose>
							<c:when test = "${userlist.user_intro eq '' || userlist.user_intro eq null}">
								<div id="user_info" class="mt-3" contenteditable="true" style="border:none; color:#FFC69F; ">[  등록된 소개가 없습니다...  ]</div>
							</c:when>
							<c:otherwise>
								<div id="user_info" class="mt-3" contenteditable="true" style="border:none; color:#FFC69F;">${userlist.user_intro }</div>
							</c:otherwise>
							</c:choose>
						</div>
					</c:when>	
					<c:otherwise>
						<div class="font-size-20"style="align:center;"> 비공개 회원입니다... </div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</c:if>
<div class="subsite-section bg-light" style="padding-bottom: 2%;">
		
	<div class="container mainview " id="mainview" >
		<c:forEach items="${list}" var="rglist" > 
		<!-- 나만보기가 아닐 경우...  -->
		<c:if test="${rglist.recipegram_secret eq 0}">
			<c:set var="recipegram_num" value="${rglist.recipegram_num }"/>
			<div class="col-md-12 ">
			<form id="form${rglist.recipegram_num }" name="form${rglist.recipegram_num }" method = "post" >
				<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
				<input type="hidden" id="user_nickname" name="user_nickname" value="${rglist.user_nickname }">
				<span id="nickname" class=" font-size-17 " style="color: #65737e;" onclick="user_list(${rglist.recipegram_num });"><c:out value="${rglist.user_nickname }"/></span>
			</form>		
			<c:if test = "${rglist.user_num eq user_num }">	
			
		        		<img src="../img/user/recipegram_update.png" class="mr-2 recipegram_update " style="width:2.5%; margin-top:-1.5%; margin-left:90%;"/>
		        		<i class="fas fa-times fa-2x recipegram_delete "></i>
		        	
		        	
		      </c:if> 	
			</div>
				<div class="row col-md-12 col-sm-12 col-xs-12" style="background-color : white; border:1px solid rgba(0,0,0,.0975); margin-bottom:5rem;padding-left:0;">
					<!-- carousel -->
							<div id="demo${rglist.recipegram_num }" class="col-md-6 carousel" style="padding-left:0;"data-ride="carousel" data-interval="false" >
								<!-- Indicators -->
								<ul class="carousel-indicators" id="indi${rglist.recipegram_num }">
								 <c:forEach items="${rglist.imgList }" var="img"> 
									<%-- <li data-target="#demo${rglist.recipegram_num }" data-slide-to="0" class="active"></li>
									<li data-target="#demo${rglist.recipegram_num }" data-slide-to="1"></li>
									<li data-target="#demo${rglist.recipegram_num }" data-slide-to="2"></li>
									<li data-target="#demo${rglist.recipegram_num }" data-slide-to="3"></li>
									<li data-target="#demo${rglist.recipegram_num }" data-slide-to="4"></li> --%>
								</c:forEach>
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
								</div><!-- carousel-inner -->

								<!-- Left and right controls -->
								<a class="carousel-control-prev" href="#demo${rglist.recipegram_num }" data-slide="prev" role="button"> 
									<span class="carousel-control-prev-icon"aria-hidden="true"></span>
								</a> 
								<a class="carousel-control-next" href="#demo${rglist.recipegram_num }" role="button" data-slide="next"> 
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
								</a>

							</div><!-- col-md-6 carousel -->

					<div class="col-md-6" style="padding-left: 1.5%; padding-top: 1%;">
					
							<div class="con">
								<div class=" col-sm-12 col-xs-12">
									<!-- <input type="text" value="" readonly style="width: 100%;"> -->
									<%-- <div class="info " style="" id="info_data${rglist.recipegram_num }"> --%>
										<div class="info_data " id="btn_info${rglist.recipegram_num }" class="font-size-17" >
											${rglist.recipegram_content  }
										</div>
										<span class="col-sm-12 rgdate font-size-13" style="float:right;color: #d2d2d2;padding-top:2%;">  
										 	${fn:split(rglist.firstdate,'-')[0]}년 ${fn:split(rglist.firstdate,'-')[1]}월 ${fn:split(rglist.firstdate,'-')[2]}일 
												<hr>
										</span> 
										
					
									<!-- </div> -->
								</div><!-- col-md-10 col-sm-12 col-xs-12 -->
								
								<%-- <span class="btn-moreInfo" class="font-size-17" id="btn-moreInfo${rglist.recipegram_num }" style="color: #d2d2d2;">
									<button onclick="moreCont(${rglist.recipegram_num })">더보기</button> 
								</span> --%>
						
						
						
						
     					
     			
	    
       					<div class='row col-md-12 mt-4'><br>
       						<div class='info_data2 col-sm-12 ' id="reply_list${rglist.recipegram_num }">
       						
       						</div>
       					
       					</div>
     					</div>
					
		   		<div class="col-md-10 favorite" style="margin-top: 4%; ">
							
							<img src="img/recipegram/favorite.png" style="width: 1.8rem;" 
								onclick="ChangeImage(${recipegram_num})" name="favorite"  id="favorite${rglist.recipegram_num }">
						
							
							<img src="img/recipegram/hearts.png" style="width: 1.8rem;display:none;"
								onclick="ChangeImage(${recipegram_num})" name="hearts" id="hearts${rglist.recipegram_num }">&nbsp;
							
						
							 <img src="img/recipegram/add.png" style="width: 1.8rem;">
							 
						</div>
			<span class="col-md-10 rgdate font-size-13" style="float:left;color: #65737e;padding-top:1%;">  
							 	<input type="text" name="cnt_like${rglist.recipegram_num }" value="${rglist.recipegram_like_cnt }" style="background:none; border:none;color: #65737e;width:5%;">명이 좋아합니다.
							</span> 
			
			<sec:authorize access="isAuthenticated()">
			<div class="row col-md-12 reply" style="margin-left:0">
				<c:set var="recipegram_num" value="${rglist.recipegram_num }"/>
				
	    		<%-- <c:set var = "user_nickname" value="${rglist.user_nickname }"/> --%>
	    		
		
						
							<textarea class="replycont" id="reply${rglist.recipegram_num }" name="reply${rglist.recipegram_num }"rows="1" cols="30" ></textarea>
							<input class="replybtn" id="insert${rglist.recipegram_num }"  type="button" onclick="insertReply(${recipegram_num })" value="게시" >
						
				
					</div>
				</sec:authorize>	
					
				
			</div>
			
				
		</div>
	<!-- </div> -->

</c:if>
</c:forEach>
</div>
</div>

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
			colorbox.each(function() {
				$(this).outerHeight();
				if ($(this).outerHeight() > 21) {
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

</body>
</html>