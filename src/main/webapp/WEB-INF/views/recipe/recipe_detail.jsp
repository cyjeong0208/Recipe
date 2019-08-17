<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="/resources/css/aos.css" rel="stylesheet">
<link href="/resources/css/bootstrap-datepicker.css" rel="stylesheet">
<link href="/resources/css/jquery-ui.css" rel="stylesheet">
<link href="/resources/css/magnific-popup.css" rel="stylesheet">
<!-- <link href="/resources/css/mediaelementplayer.css" rel="stylesheet"> -->
<link href="/resources/css/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/css/owl.theme.default.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
	<!-- 여기부분 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  
	<link rel="stylesheet" href="/resources/css/SYS.css">
	<script type="text/javascript">
	var recipe_delete = location.pathname.replace("recipe_detail","recipe_delete");
	var recipe_modify = location.pathname.replace("recipe_detail","recipe_modify");
	var recipe_dib = location.pathname.replace("recipe_detail","recipe_dib");
	
	var pathname = location['pathname'];
	var excel = pathname.split("/")[2];
	var recipe_num = pathname.split("/")[3];
	
	<sec:authorize access="isAuthenticated()">
	var user_num = '<sec:authentication property="principal.member.user_num"/>'; 
	</sec:authorize>
	
	<sec:authorize access="isAnonymous()">
	var user_num = '';
	</sec:authorize>
	
	
	
	
	</script>
	<style>
	input:focus, div:focus, button:focus {
	outline: none;
}
#mob_timer{
		display:none;
	}
	@media (max-width:500px){
		#mob_timer {
			display:block;
			font-size : 0.7em;
			
		}
		.cooking_dc{
			height:	40%;
		}
		
		
		
	}
	</style>
<title>Home</title>
</head>
<body>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/aos.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/jquery.stellar.min.js"></script>
	<script src="/resources/js/jquery.sticky.js"></script>
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/main.js"></script>
	<!-- <script src="/resources/js/mediaelement-and-player.min.js"></script> -->
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/slick.min.js"></script>
	<script src="/resources/js/typed.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>

		<jsp:include page="../headNfoot/header.jsp"></jsp:include>
		<%-- <%@include file="../headNfoot/header.jsp" %> 이상하게 에러 걸림;;;--%>
	<div class="subsite-section bg-light" style="padding-bottom: 2%;padding-top:1.5em; font-family: 'Jua', sans-serif;">
	
	
		<div class="container pt-2">
		<div class="row col-md-11 col-sm-12 col-xs-12" style="padding-left:75%;">
		
			<c:if test="${not empty isWriter}">
					<button style="background:none; border:none; color:#FFC69F; font-family: 'Jua', sans-serif;"  onclick="location.href= recipe_modify">수정하기</button>
					<button style="background:none; border:none; color:#FFC69F; font-family: 'Jua', sans-serif;" onclick="location.href = recipe_delete">삭제하기</button>
					</c:if>
					<c:if test="${not empty isLogin and isDib == 'dib'}">
						<button style="background:none; border:none; color:#FFC69F; font-family: 'Jua', sans-serif;" id="recipe_dibBtn">찜해제</button>
					</c:if>
					<c:if test="${not empty isLogin and isDib == 'not_dib'}">
						<button style="background:none; border:none; color:#FFC69F;font-family: 'Jua', sans-serif; " id="recipe_dibBtn">찜하기</button>
					</c:if>
		</div>
		</div>
		
		
		<div class="container pt-3 " >
		<div class="row col-md-8 col-sm-12 col-xs-12 font-size-28" style=" border-top:1px solid rgba(0,0,0,.0975); border-bottom:1px solid rgba(0,0,0,.0975); margin-left:15%;">
			<input type="text" class="pt-3 pb-3" style="background:none; border:none; text-align:center; width:100%; font-family: 'Jua', sans-serif;" value="${basic.recipe_title}"/>
					
					
		</div>
		</div>
	<!-- test -->
		
		
		<div class="container pt-5 ">			
		<div class="row col-md-11 col-sm-12 col-xs-12" style="margin-left:15%; height:50%; ">

			<!-- 대표 이미지 -->

				<img src="${basic .recipe_img}" class="img-fluid rounded" style="float: center; height:100%;">
	
			
			
		</div>
		
		<div class="container mt-5 ml-5">
		<!-- 레시피 이름, 주재료, 부재료,  -->
			<div class="row col-md-8 col-sm-12 col-xs-12" style="border-top:1px solid rgba(0,0,0,.0975); border-bottom:1px solid rgba(0,0,0,.0975); margin-left:5%;">
				<div class="col-md-12 col-sm-12 col-xs-12 pt-2 pb-2 font-size-22">
				 주재료 리스트
				
				</div>
				
				<c:forEach items="${fn:split(basic.recipe_food_main,',')}" var="recipe_food_main">

				<div class="col-md-3 col-sm-12 col-xs-12 pt-2 pb-2 font-size-18" style="color:#65737e;">
					
					${recipe_food_main}
				</div>
				</c:forEach>
				
				<div class="col-md-12 col-sm-12 col-xs-12 pt-2 pb-2 font-size-22">
				<br>
				 부재료 리스트
				
				</div>
				
				<c:forEach items="${fn:split(basic.recipe_food_suv,',')}" var="recipe_food_suv">

				<div class="col-md-3 col-sm-12 col-xs-12 pt-2 pb-2 font-size-18" style="color:#939393;">
					
					${recipe_food_suv}
				</div>
				</c:forEach>
				
							
					
			</div>
			
		</div>
		
		<br>
		<div class="row mb-2 col-md-10 col-sm-12 col-xs-12 ml-5 " contentEditable="true" style="clear: both; padding-left:10px; padding-bottom:10px; width: 100%; border: 1; overflow: visible; text-overflow: ellipsis; border:1px solid rgba(0,0,0,.0975);table-layout: fixed; background-color:#fff;"">
		<!-- 	<div class="col-sm-11 " contentEditable="true" style="padding-left:10px; padding-bottom:10px; width: 100%; border: 1; overflow: visible; text-overflow: ellipsis; border:1px solid rgba(0,0,0,.0975);table-layout: fixed; background-color:#fff;">
			 --><div class=" text-center mt-3" id="mob_timer" >
        
				        <!-- Timer -->
				
				       <span class="minutes"style="color:#FFC69F; " >00</span> : <span class="seconds" style="color:#FFC69F; " >00</span>
				        
				                <button class="btn  " data-action="start"> <!-- Data- Allows you to create custome HTML elements for Js purposes -->
				                    Start
				                </button>
				                <button class="btn  " data-action="stop">
				                    Stop
				                </button>
				                <button class="btn  " data-action="reset">
				                    Reset
				                </button>
				            
				    
				</div>
			
				<c:forEach var="item" items="${cooking_list}" varStatus="index">
				<div class="col-md-12" style="height:100%;">
					<br>
					<div  class="col-md-6 font-size-20" >
						${item.cooking_num}.&nbsp;${item.cooking_content}
					</div>
					
					<c:if test="${item.cooking_img != null}">
					
						<img src="${item.cooking_img}" class="col-md-5"style="width: 100%; float:right; padding-top:0;"/>
					
					</c:if>
					
					
				</div>
				<div class="col-md-12" >
				<c:if test="${!index.last}">
					<hr>
					</c:if>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<aside class="sidebar" >
         <jsp:include page="recipe_timer.jsp"/>
    </aside> 
	


	<script type="text/javascript">
	
		
		$('header').addClass(' border-bottom');
		
		var flag=true;
		
		//필요한 거  user_num, recipe_num, excel
		$(document).ready(function() {
			$('#recipe_dibBtn').on("click",function(e){
				
				if(!flag){return;}
				flag= false;
				
				if($(this).text()==='찜하기'){
					$.ajax({
						url: "/recipe_dib",
						data: {user_num: user_num,excel: excel, recipe_num : recipe_num},
						success: function(response){
							if(response==='-1'){
								alert('이미 찜하신 레시피입니다');
							} else {
								console.log(response);
								alert('레시피를 찜했습니다');
							}
							$('#recipe_dibBtn').text('찜해제')
							
						},
						error: function(error) {
							console.log("error")
					    },
					    complete: function() {
					    	flag = true;
					    }
					});	 
				} else {
					$.ajax({
						url: "/recipe_dib_delete",
						data: {user_num: user_num,excel: excel, recipe_num : recipe_num},
						success: function(response){
							console.log(response);
							alert('레시피 찜을 해제했습니다');
							$('#recipe_dibBtn').text('찜하기')
						},
						error: function(error) {
							console.log("error");
					    },
					    complete: function() {
					    	flag = true;
					    }
					});
				}
			
			});
		})
	
		$('.site-logo span').attr('style','color:#FFC69F !important');
		
		
	</script>
	
	<%@include file="../headNfoot/footer.jsp"%>
</body>
</html>