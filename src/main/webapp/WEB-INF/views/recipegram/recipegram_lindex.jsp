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
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>


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
	border: solid 1px rgba(0,0,0,.15);
	border-radius: 30px;
	background: white;
	padding: 4px;
}

@media ( max-width :500px) {
	.reply {
		width: 100%;
	}
}

.replycont {
	border: none;
	border-radius: 35px;
	width: 75%;
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

@media screen and (min-width: 500px) {
	.info .info_data.hidden {
		width: 70%;
	}
}

.carousel-inner>.carousel-item>img {
	width: 100%;
	height: 457px;

}

@media (max-width: 500px) {
	.carousel-inner>.carousel-item>img {
		width: 100%;
		height:40%;
	}
}

.info_data{
	color: black; 
	width: 100%;

}

 @media (max-width: 500px) {
	.info_data {
		width: 100%;
		height:100px;
	}
} 

@media ( max-width :500px) {
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
   height: 265px;
   overflow-y:scroll;
   -ms-overflow-style:none;
   padding-top:2%;
   margin-top:2%;
}

.con::-webkit-scrollbar{
   display:none;
}

.rg_con{
	margin-left:5%;
	
}
 @media (max-width: 500px) {
	.rg_con{
	margin-left:.5%;
	padding-right:0;
	
}
} 

.new_like_btn{
	margin-top:2%;
} @media (max-width: 500px) {
	.new_like_btn{
	margin-top:5%;
	
	
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
			
			<div class="col-md-9">
			</div>
				<div class="col-md-3 row new_like_btn" style="float: right;  margin-top: 2%;">
               <div class="col-xs-5 text-right">
                  <div class="previous">
                     <button type="button" id="button_new" class="btn btn-default btn-lg" style="border: none;" >
                     <a href="/recipegram_index" value="최신순">최신순</a>
                        <!-- <span class="">최신순</span> -->
                     </button>
                  </div>
               </div>
               &nbsp;
               <div class="col-xs-5 text-right">
                  <div class="next">
                     <button type="button" id="button_like" class="btn btn-default btn-lg" style="border: none;">
                        <a href="/getRecipegramLike"" value="좋아요순">좋아요순</a>
                        <!-- <span class="">좋아요순</span> -->
                     </button>
                  </div>
               </div>
            </div>
		
		</div>
	</div>



	<div class="subsite-section bg-light" style="padding-bottom: 2%;padding-top:1.5em;">
		<!-- 로그인 시   -->
		<sec:authorize access="isAuthenticated()">
		<sec:authentication var="user_num" property="principal.member.user_num"/>
						<sec:authentication var="user_nickname" property="principal.member.user_nickname"/> 
				    		<input type="hidden" id="user_num" name="user_num" value="${user_num }">
				    		<input type="hidden" id="login_nickname" name="login_nickname" value="${user_nickname }">
											
			<div class="container  text-right">
				<div class="next">
					<button type="button" class="btn btn-default btn-lg"style="border:none; background:none;">
						<span class="font-size-20"><a href="recipegram_write">+ 추가</a></span>
					</button>
				</div>
			</div>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
		
				<input type="hidden" id="user_num" name="user_num" value="-1">	
				
						
		</sec:authorize>
		
		<div class="container mainview " id="mainview" >
		<c:forEach items="${list}" var="rglist" > 
		<!-- 나만보기가 아닐 경우...  -->
		<c:if test="${rglist.recipegram_secret eq 0}">
			<c:set var="recipegram_num" value="${rglist.recipegram_num }"/>
			
				<div class="row col-md-10 col-sm-12 col-xs-12 rg_con" style="background-color : white; border:1px solid rgba(0,0,0,.0975); margin-bottom:4rem;padding-left:0; ">
					<!-- carousel -->
							<div id="demo${rglist.recipegram_num }" class="col-md-7 carousel" style="padding-left:0;"data-ride="carousel" data-interval="false" >
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
							
							
							

					<div class="col-md-5" style="padding-left: 1.5%; padding-top: 1%;">
						<form id="form${rglist.recipegram_num }" name="form${rglist.recipegram_num }" method = "post" >
							<div style="border-bottom:1px solid rgba(0,0,0,.0975); margin-top:3%; padding-bottom:3%;" >
								<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
								<input type="hidden" id="user_nickname" name="user_nickname" value="${rglist.user_nickname }">
								<span id="nckname" class=" font-size-17 " style="color: #65737e ;" onclick="user_list(${rglist.recipegram_num });"><c:out value="${rglist.user_nickname }"/></span>
					
								
						<!-- 관리자시...  -->                  
				        <sec:authorize access="hasRole('ROLE_ADMIN')">
				        <c:choose>
				       		<c:when test = "${rglist.user_num eq user_num }">	
								<img src="../img/user/recipegram_update.png" class="mr-2 recipegram_update " style="width:3.5%; margin-top:-1.5%; margin-left:75%;" onclick="modify(${rglist.recipegram_num })"/>
						        
						        <i class="fas fa-times fa-x recipegram_delete " onclick="rg_delete(${rglist.recipegram_num})"></i>
						        	
						        	
						      </c:when> 
						     <c:otherwise> 
				        		<i class="fas fa-times fa-x recipegram_delete " onclick="rg_delete(${rglist.recipegram_num})" style="margin-top:-1.5%; margin-left:80%;"></i>
				        	</c:otherwise>
				        </c:choose>
				        </sec:authorize>		
				        <!-- 일반 user -->
						<sec:authorize access="!hasRole('ROLE_ADMIN')">
							<c:if test = "${rglist.user_num eq user_num }">	
								<img src="../img/user/recipegram_update.png" class="mr-2 recipegram_update " style="width:2.5%; margin-top:-1.5%; margin-left:75%;" onclick="modify(${rglist.recipegram_num })"/>
						        
						        		<i class="fas fa-times fa-x recipegram_delete " onclick="rg_delete(${rglist.recipegram_num})"></i>
						        	
						        	
						      </c:if> 
						 </sec:authorize>
						 
						
						</div>
					</form>	
					
					
							<div class="con" >
								<div class=" col-sm-12 col-xs-12">
									<!-- <input type="text" value="" readonly style="width: 100%;"> -->
									<%-- <div class="info " style="" id="info_data${rglist.recipegram_num }"> --%>
										<div class="info_data " id="btn_info${rglist.recipegram_num }" class="font-size-17" >
											${rglist.recipegram_content  }
										</div>
										<span class="col-sm-12 rgdate font-size-13" style="float:right;color: #d2d2d2;padding-top:1%;">  
										 	${fn:split(rglist.firstdate,'-')[0]}년 ${fn:split(rglist.firstdate,'-')[1]}월 ${fn:split(rglist.firstdate,'-')[2]}일 
												
										</span> 
										
					
									<!-- </div> -->
								</div><!-- col-md-10 col-sm-12 col-xs-12 -->
								
								<%-- <span class="btn-moreInfo" class="font-size-17" id="btn-moreInfo${rglist.recipegram_num }" style="color: #d2d2d2;">
									<button onclick="moreCont(${rglist.recipegram_num })">더보기</button> 
								</span> --%>
						
						
						
						
     					
     			
	    
       					<div class='row col-md-12 mt-4 pt-3'><br>
       						<div class='info_data2 col-sm-12 ' id="reply_list${rglist.recipegram_num }">
       						
       						</div>
       					
       					</div>
     					</div>
					
		   		<div class="col-md-10 favorite" style="margin-top: 4%; ">
							
							<img src="img/recipegram/favorite.png" style="width: 1.8rem;" 
								onclick="ChangeImage(${recipegram_num})" name="favorite"  id="favorite${rglist.recipegram_num }">
						
							
							<img src="img/recipegram/hearts.png" style="width: 1.8rem;display:none;"
								onclick="ChangeImage(${recipegram_num})" name="hearts" id="hearts${rglist.recipegram_num }">&nbsp;
							
						
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

	<script>
	function modify(recipegram_num){
		window.location.href="getmodifyRecipegram?recipegram_num=" + recipegram_num;
	}
	function user_list(num){
		
		var form_id = "form" + num;
		console.log(form_id);
		
		document.getElementById(form_id).action="/recipegram_user_index";
		document.getElementById(form_id).submit();
	}
	
	function rg_delete(recipegram_num){
		
		$.ajax({
	        type:'post',
	        url : '/deleteRecipegram',
	        dataType : "json",
	        data:{"recipegram_num" : recipegram_num},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
	        success : function(data){
	        	alert("레시피그램 삭제완료!");
	        	location.href="/recipegram_index";
	        },
	        error:function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	         
	     });
	}
	
	</script>

 

	<script type="text/javascript">
	
		
		var cnt =1;
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
		<c:forEach var="imgList" items="${list}">
		 var num = "${imgList.recipegram_num }";
		 $.ajax({
			type:"POST",
			url:"/img_list",
			dataType:"json",
			data:{"recipegram_num" : num},
				beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		      },
		    success: function(data){
		    	console.log(data);
		    	$.each(data, function(index, item){
		   			if(index==0){
		    			$('#indi' + item.recipegram_num).append("<li class='active' data-target=#demo" + item.recipegram_num  + " data-slide-to=" + index + ">" + "</li> " );
		    			
		    			
		   			}else
		   				$('#indi' + item.recipegram_num).append("<li  data-target=#demo" + item.recipegram_num  + " data-slide-to=" + index + ">" + "</li> " );
		   			
		    	});
		    },
		    error:function(){
				alert('통신실패!');
			}
		});
	 </c:forEach> 

	<c:forEach items="${list}" var="rglist" >
		
			var rgnum = ${rglist.recipegram_num};
			var like_state = document.getElementsByName;
			var hearts = "hearts"+rgnum;
			var favorite = "favorite"+rgnum;
			var like_hearts =document.getElementById(hearts);
			var like_favorite = document.getElementById(favorite);
			
			var user_num = document.getElementById('user_num').value;
		
			
			//ajax 로 좋아요 상태 가져오기..
		
			$.ajax({
				url:'/getLike',
				type:'get',
		        async : false, 

				data: {"user_num" : user_num},
				beforeSend: function(xhr) {
			          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    },
			    success: function(data){
			          //console.log(data); 
			          $.each(data, function(index, item){
			        	  
			        	  console.log("rgnum : " + rgnum);
			        	  if(item.recipegram_num == rgnum){
			        		 
			        		  document.getElementById("hearts"+rgnum).style.display='inline';
			        		  document.getElementById("favorite"+rgnum).style.display='none';
					          
			        		  return false;
			        	  }else{
			        		  document.getElementById("hearts"+rgnum).style.display='none';
			        		  document.getElementById("favorite"+rgnum).style.display='inline';
			        	  }
			          });
			    },error:function(request,status,error){
			    	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }

			 
			      
			});
			
			</c:forEach> 

	 
function getLikeSt(rgnum){	
		/* <c:forEach items="${list}" var="rglist" >
		 */
		var rgnum = rgnum;
		var like_state = document.getElementsByName;
		var hearts = "hearts"+rgnum;
		var favorite = "favorite"+rgnum;
		var like_hearts =document.getElementById(hearts);
		var like_favorite = document.getElementById(favorite);
		
		var user_num = document.getElementById('user_num').value;
	
		
		//ajax 로 좋아요 상태 가져오기..
	
		$.ajax({
			url:'/getLike',
			type:'get',
	        async : false, 

			data: {"user_num" : user_num},
			beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
		    success: function(data){
		          //console.log(data); 
		          $.each(data, function(index, item){
		        	 
		        	  if(item.recipegram_num == rgnum){
		        		 
		        		  document.getElementById("hearts"+rgnum).style.display='inline';
		        		  document.getElementById("favorite"+rgnum).style.display='none';
				          
		        		  return false;
		        	  }else{
		        		  document.getElementById("hearts"+rgnum).style.display='none';
		        		  document.getElementById("favorite"+rgnum).style.display='inline';
		        	  }
		          });
		    },error:function(request,status,error){
		    	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }

		 
		      
		});
		
		/* </c:forEach> */
}

		//좋아요개수 띄우기.. 
	
		function ChangeImage(num) {
			
			var recipegram_num = num;
			var user_num = document.getElementById('user_num').value;
			
			
			
			if (document.getElementById("hearts"+num).style.display == 'none') {
				document.getElementById("hearts"+num).style.display='inline';
				document.getElementById("favorite"+num).style.display='none';
	        	
				$.ajax({
				      url: '/insertLike',
				      data: { 
				    	  "recipegram_num" : recipegram_num, 
				    	  "user_num":user_num
				      		},
				      type: 'POST',
				      beforeSend: function(xhr) {
				          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				      },
				      dataType:'json',
				      success: function(result){
				          console.log(result); 
				          $.each(result, function(index, item){
				        	 
					  			if(item.recipegram_num == recipegram_num){
					  				 console.log(item.recipegram_num +" / " + recipegram_num);
					  				 console.log(user_num);
							          console.log(item.recipegram_like_cnt);
					          		$('input[name=cnt_like'+recipegram_num+']').attr('value', item.recipegram_like_cnt+1);
					  			}
				          });
				      },error:function(request,status,error){
				    	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }

				    }); //$.ajax
			} else{
				document.getElementById("hearts"+num).style.display='none';
				document.getElementById("favorite"+num).style.display='inline';
	        	
				$.ajax({
				      url: '/deleteLike',
				      data: {
				    	  "recipegram_num" : recipegram_num, 
				    	  "user_num":user_num
				      		},
				      type: 'POST',
				      beforeSend: function(xhr) {
				          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				      },
				      dataType:'json',
				      success: function(result){
				          //console.log(result); 
				          $.each(result, function(index, item){
					        	 
					  			if(item.recipegram_num == recipegram_num){
					  				 console.log(item.recipegram_num +" / " + recipegram_num);
							          console.log(item.recipegram_like_cnt);
					          		$('input[name=cnt_like'+recipegram_num+']').attr('value', item.recipegram_like_cnt-1);
					  			}
				          });
				         
				      },error:function(request,status,error){
				    	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }

				    }); //$.ajax
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

// 댓글 등록하기(Ajax)



function insertReply(code){
	var user_num = document.getElementById('user_num').value;
	var user_nickname = document.getElementById('login_nickname').value;
	var recipegram_num = code;
	var reply = document.getElementById('reply'+recipegram_num).value;
	
	console.log(user_nickname);
    $.ajax({
        type:'POST',
        url : '/insertReply',
        data:{
        	"user_num" : user_num,
        	"user_nickname" : user_nickname,
        	"recipegram_num" : recipegram_num,
        	"reply" : reply
        },
        beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    },
        success : function(data){
        	
           getReplyList();
           $("#reply"+recipegram_num).val("");
            
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 // 답글달기 
function Rereply(code, num){
	var user_num = document.getElementById('user_num').value;
	var user_nickname = document.getElementById('login_nickname').value;
	var reply_num = num;
	console.log("nickname : "+user_nickname);
	console.log("nicknum : "+user_num);
	var recipegram_num = code;
	var reply = document.getElementById('reply'+recipegram_num).value;
	var reply_user =  document.getElementById('reply_user' + reply_num).innerHTML;
	
	
	console.log(reply_user);
	$("#reply"+recipegram_num).val("@" + reply_user);
	
	
	document.getElementById("insert"+code).onclick="";
	 document.getElementById("insert"+code).onclick=function(){
		 insertRereply(recipegram_num, reply_num);
		};
	 
	

	
} 
 
//답답글달기 
function Rerereply(code, num){
	var user_num = document.getElementById('user_num').value;
	var user_nickname = document.getElementById('login_nickname').value;
	var reply_num = num;
	console.log("nickname : "+user_nickname);
	console.log("nicknum : "+user_num);
	var recipegram_num = code;
	var reply = document.getElementById('reply'+recipegram_num).value;
	var reply_user = document.getElementById('rereply_user' + reply_num).innerHTML;

	$("#reply"+recipegram_num).val("@" + reply_user);
	
	document.getElementById("insert"+code).onclick="";
	 document.getElementById("insert"+code).onclick=function(){
		 
		 insertRereply(recipegram_num, reply_num);
	};
	 
	

	
} 
 
function insertRereply(code, num){
	var rere_user_num = document.getElementById('user_num').value;
	var rere_user_nickname = document.getElementById('login_nickname').value;
	//var user_nickname = "${rglist.user_nickname }";

	var reply_num = num;
	
	var recipegram_num = code;
	var reply = document.getElementById('reply'+recipegram_num).value;
	var reply_user = document.getElementById('reply_user' + reply_num).innerHTML;
	

	$.ajax({
        type:'POST',
        url : '/insertRereply',
        data:{
        	"rere_user_num" : rere_user_num,
        	"rere_user_nickname" : rere_user_nickname,
        	"recipegram_num" : recipegram_num,
        	"reply" : reply,
        	"reply_num" : reply_num
        },
        beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    },
        success : function(data){
        	
           getReplyList();
           $("#reply"+recipegram_num).val("");
            
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
} 
	 
	

// 초기 페이지 로딩시 댓글 불러오기

$(function(){
    
	getReplyList();
	
});
 

//댓글 불러오기(Ajax)
		
function getReplyList(){
	<c:forEach items="${list}" var="rglist" >
	var user_nickname = "${rglist.user_nickname }";

	var user_num = document.getElementById('user_num').value;

	var recipegram_num = ${rglist.recipegram_num };
	
	$.ajax({
        type:'GET',
        url : '/replyList',
        dataType : "json",
        data:{"recipegram_num" : recipegram_num
        	},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    },
        success : function(data){
            
            
            //console.log(data);
            
            //댓글 출력!
            $.each(data, function(index, item){
            	//console.log(data);
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
					 
					 $("#reply_content"+item.recipegram_reply_num).remove();
					 //로그인 시... 
					 $("#reply_list"+item.recipegram_num).append("<sec:authorize access='isAuthenticated()'> <sec:authentication var='user_num' property='principal.member.user_num'/>");
					 
					//작성자일때ㅔ... 
						if(user_num == item.user_num){
							
							$("#reply_list"+item.recipegram_num).append("<div class='col-md-12 rrr' id='reply_content"+item.recipegram_reply_num+"'>"
									+"<span class='font-size-17 ' id='reply_user"+item.recipegram_reply_num+"' style='color: #65737e;'>"+item.user_nickname+"</span>&nbsp"
									+"<span class='info_re font-size-16 pl-3' style='color: black;'>"+item.recipegram_reply_content+"</span>"
									+"<span class='font-size-13'style='float:right' onclick='deleteReply("+item.recipegram_reply_num+")'>삭제</span><br>"
									
									+"<span class='font-size-13 pl-3'style='color: #d2d2d2;'>"+year+"년 " +month + "월 " + day + "일 </span>"
									+"<input class='rereplybtn pl-3'  type='button' onclick='Rereply("+item.recipegram_num+", "+item.recipegram_reply_num+")' value='답글 달기' >"

									+"<br><span id='more-hide"+item.recipegram_reply_num+"' class='pl-5' onclick ='rereplyDisplay("+item.recipegram_reply_num+")'style='display:none'>ㅡ 답글 보기</span>"
									+"  </div>");
						
						}else{
							
							$("#reply_list"+item.recipegram_num).append("<div class='col-md-12 rrr' id='reply_content"+item.recipegram_reply_num+"'>"
									+"<span class='font-size-17 ' id='reply_user"+item.recipegram_reply_num+"' style='color: #65737e;'>"+item.user_nickname+"</span>&nbsp"
									+"<span class='info_re font-size-16 pl-3' style='color: black;'>"+item.recipegram_reply_content+"</span><br>"
									+"<span class='font-size-13 pl-3' style='color: #d2d2d2;'>"+year+"년 " +month + "월 " + day + "일 </span>"
									+"<input class='rereplybtn pl-3'  type='button' onclick='Rereply("+item.recipegram_num+", "+item.recipegram_reply_num+")' value='답글 달기' >"

									+"<br><span id='more-hide"+item.recipegram_reply_num+"' class='pl-5' onclick ='rereplyDisplay("+item.recipegram_reply_num+")'style='display:none'>ㅡ 답글 보기</span>"
									+"</div> ");
							
						}
							
						$("#reply_list"+item.recipegram_num).append("</sec:authorize>");
						
						
						 //비 로그인 시... 
						 $("#reply_list"+item.recipegram_num).append("<sec:authorize access='isAnonymous()'>"
						 
								 +"<div class='col-md-12 rrr' id='reply_content"+item.recipegram_reply_num+"'>"
									+"<span class='font-size-17 ' id='reply_user"+item.recipegram_reply_num+"' style='color: #65737e;'>"+item.user_nickname+"</span>&nbsp"
									+"<span class='info_re font-size-16 pl-3' style='color: black;'>"+item.recipegram_reply_content+"</span><br>"
									+"<span class='font-size-13 pl-3' style='color: #d2d2d2;'>"+year+"년 " +month + "월 " + day + "일 </span>"

									+"<br><span id='more-hide"+item.recipegram_reply_num+"' class='pl-5' onclick ='rereplyDisplay("+item.recipegram_reply_num+")'style='display:none'>ㅡ 답글 보기</span>"
									+"  </div> "
									+"</sec:authorize>");
					
						 
					
					//대댓글 출력!
            	 	$.each(item.rereplyList, function(val1, val2){
            	 		/* console.log(val1 + " / " +val2.user_num);*/
                	 	
  						if(val2.recipegram_rereply_num != 0){
  							document.getElementById('more-hide'+item.recipegram_reply_num).style.display='';
  						 
  							var v = new Date(val2.firstdate);
  							 year = v.getFullYear();
  							 month = v.getMonth()+1
  							 if(month<10){
  								 month = "0"+(v.getMonth()+1);
  							 }
  							 day = v.getDate();
  							 if(day<10){
  								 day = "0"+(v.getDate());
  							 }
  							 //console.log(val2.recipegram_rereply_num);
  							 
  							 
  							$("#rereply_content"+val2.recipegram_rereply_num).remove();
  							//로그인 시... 
  							$("#reply_content"+item.recipegram_reply_num).append("<sec:authorize access='isAuthenticated()'> <sec:authentication var='user_num' property='principal.member.user_num'/>");
  							 
  							//작성자일때ㅔ... 
  								if(user_num == val2.rere_user_num){
  									
  									$("#reply_content"+item.recipegram_reply_num).append("<div class='col-md-12 rrr rereply_content"+item.recipegram_reply_num+"' id='rereply_content"+val2.recipegram_rereply_num+"' style='display:none;'>"
  			  								+"<span class='font-size-17 pl-4' id='rereply_user"+val2.recipegram_rereply_num+"' style='color: #65737e;'>"+val2.rere_user_nickname+"</span>&nbsp"
  			  								+"<span class='info_rere font-size-16 pl-3' style='color: black;'>"+val2.recipegram_rereply_content+"</span>"
  			  								+"<span class='font-size-13'style='float:right'onclick='deleteRereply("+val2.recipegram_rereply_num+")'>삭제</span><br>"
			  								
  			  								+"<span class='font-size-13 pl-5' style='color: #d2d2d2;'>"+year+"년 " +month + "월 " + day + "일 </span>"
  			  								+"<input class='rereplybtn pl-3'  type='button' onclick='Rerereply("+item.recipegram_num+", "+item.recipegram_reply_num+")' value='답글 달기' >"

  			  								
  			  								+"</div>");
  								
  								}else{
  									
  									$("#reply_content"+item.recipegram_reply_num).append("<div class='col-md-12 rrr rereply_content"+item.recipegram_reply_num+"' id='rereply_content"+val2.recipegram_rereply_num+"' style='display:none;'>"
  			  								+"<span class='font-size-17 pl-4' id='rereply_user"+val2.recipegram_rereply_num+"' style='color: #65737e;'>"+val2.rere_user_nickname+"</span>&nbsp"
  			  								+"<span class='info_rere font-size-16 pl-3' style='color: black;'>"+val2.recipegram_rereply_content+"</span><br>"
  			  								+"<span class='font-size-13 pl-5' style='color: #d2d2d2;'>"+year+"년 " +month + "월 " + day + "일 </span>"
  			  								+"<input class='rereplybtn pl-3'  type='button' onclick='Rerereply("+item.recipegram_num+", "+item.recipegram_reply_num+")' value='답글 달기' >"

  			  								+"</div>");
  								}
  									
  								$("#reply_content"+item.recipegram_reply_num).append("</sec:authorize>");
  								
  								
  								 //비 로그인 시... 
  								 $("#reply_content"+item.recipegram_reply_num).append("<sec:authorize access='isAnonymous()'>"
  								 
  										+"<div class='col-md-12 rrr rereply_content"+item.recipegram_reply_num+"' id='rereply_content"+val2.recipegram_rereply_num+"' style='display:none;'>"
  		  								+"<span class='font-size-17 pl-4' id='rereply_user"+val2.recipegram_rereply_num+"' style='color: #65737e;'>"+val2.rere_user_nickname+"</span>&nbsp"
  		  								+"<span class='info_rere font-size-16 pl-3' style='color: black;'>"+val2.recipegram_rereply_content+"</span><br>"
  		  								+"<span class='font-size-13 pl-5' style='color: #d2d2d2;'>"+year+"년 " +month + "월 " + day + "일 </span>"
  		  								
  		  								+"</div></sec:authorize>");
  							 
  							 
  						
  							
  							
  						}
  						
							$("#reply_list"+item.recipegram_num).append("</div> </div>");
            	 	 	//console.log(val2.recipegram_rereply_num);
            	 	});
					 // date객체는 자바스크립트에서 본인들만의 형식으로 변환되므로, 아래와같은 변환과정을 거쳐야한다.
					 
            });
            
            //$("#rCnt").html(cCnt);
           // $("#reply_content"+rglist.recipegram_num).append(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
	
    </c:forEach>
};

//접기 숨기기 
function rereplyDisplay(num){
	
	var mh_id = "more-hide"+num;
	
	
	//var rereply = $(re_id).siblings().eq(0);
	var morehide = document.getElementById("more-hide"+num);
	//console.log("hide : " + rereply.style.display );
	if('none' == $(".rereply_content"+num).css('display')){
		$(".rereply_content"+num).css('display', '');
		morehide.innerText = "ㅡ 답글 숨기기";
	}else{
		$(".rereply_content"+num).css('display', 'none');
		morehide.innerText = "ㅡ 답글 보기";
	}
}

function deleteReply(num){
	var recipegram_reply_num = num;
	
	$.ajax({
        type:'post',
        url : '/deleteReply',
        dataType : "json",
        data:{"recipegram_reply_num" : recipegram_reply_num},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    },
        success : function(data){
        	alert("삭제완료!");
        	location.href="/recipegram_index";
        },
        error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
         
     });
}

function deleteRereply(num){
	var recipegram_rereply_num = num;
	
	$.ajax({
        type:'post',
        url : '/deleteRereply',
        dataType : "json",
        data:{"recipegram_rereply_num" : recipegram_rereply_num},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    },
        success : function(data){
        	alert("삭제완료!");
        	location.href="/recipegram_index";
        },
        error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
         
     });
}


</script>	




<script>
	// 무한스크롤
	var startNum = 1;
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";

	$(document).scroll(function() {
		// footer높이만큼 전체크기에서 제외
		var maxHeight = $(document).height()-$(".site-footer").outerHeight();
		var currentScroll = $(window).scrollTop() + $(window).height();
		
		var cri = document.location.href.split("="); 
		
		console.log("cri : " + cri[1]);
		
		/* console.log("cu : " + currentScroll);
		console.log("max : " + maxHeight);
		console.log("Start : " +startNum); */

		if(maxHeight <= currentScroll + 50){
			$.ajax({
				type:"POST",
				url:"/getMoreLikeNewRecipegram",
				async :false,
				data:{"startNum":startNum,
					"recipe_search":cri[1]
				},
			
				beforeSend: function(xhr) {
			          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    },
			    dataType:"json",
				success: function(data){
					 $.each(data, function(index, item){
						 var user_num = document.getElementById('user_num').value;

						 console.log(data);
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
						
							
						if(item.recipegram_secret == 0){	
						
					 		
						$("#mainview").append("<div class='row col-md-10 col-sm-12 col-xs-12 rg_con' id='row"+item.recipegram_num+"' style='background-color : white; border:1px solid rgba(0,0,0,.0975); margin-bottom:5rem;padding-left:0;'>"
							+"<div id='demo"+item.recipegram_num +"' class='col-md-7 carousel' style='padding-left:0;'data-ride='carousel' data-interval='false' >"
							+"<ul class='carousel-indicators' id='indi"+item.recipegram_num +"'>");
						
						for(var i=0; i<item.imgList.length; i++){
							var img = item.imgList[i];
							if(i==0){
								$("#indi"+item.recipegram_num).append("<li class='active' data-target='#demo"+item.recipegram_num+"' data-slide-to='"+i+"'>");
										
							}else{
								$("#indi"+item.recipegram_num).append("<li data-target='#demo"+item.recipegram_num +"' data-slide-to='"+i+"'></li>");
								
							}
							
						}
							/* +"<c:forEach items='${rglist.imgList }' var='img'> "
							+"</c:forEach>" */
							
						$("#demo"+item.recipegram_num ).append("</ul>"
							+"<div class='carousel-inner' id='carousel"+item.recipegram_num+"' role='listbox'>");
							
						for(var i=0; i<item.imgList.length; i++){
							var img = item.imgList[i];
						
							if(i == 0){
								console.log("i==0 : " +img.img_name);
								$("#carousel"+item.recipegram_num).append("<div class='carousel-item active'>"
										+"<img src='./upload/"+img.img_name +"' alt=''>"
										+"</div>");
							}
							if(i>0){
								console.log(img.img_name);
								$("#carousel"+item.recipegram_num).append("<div class='carousel-item'>"
										+"<img src='./upload/"+img.img_name +"'>"
										+"</div>");
							}
							
						}
							/* +"<c:forEach items='${rglist.imgList }' var='img' varStatus='status'>"
							+"<c:if test='${status.index eq 0}'>" */
							
						/* $("#mainview").append("<div class='carousel-item active'>"
							+"<img src='./upload/${img.img_name }' alt=''>"
							+"</div>"
							
							+"</c:if>"
							+"<c:if test='${status.index > 0}'>"
							+"<div class='carousel-item'>"
							+"<img src='./upload/${img.img_name }'>"
							+"</div>"
							+"</c:if>"
							+"</c:forEach>" */
							
					$("#demo"+item.recipegram_num ).append("</div><a class='carousel-control-prev' href='#demo"+item.recipegram_num +"' data-slide='prev' role='button'>" 
							+"<span class='carousel-control-prev-icon'aria-hidden='true'></span>"
							+"</a>"
							+"<a class='carousel-control-next' href='#demo"+item.recipegram_num +"' role='button' data-slide='next'> "
							+"<span class='carousel-control-next-icon' aria-hidden='true'></span>"
							+"</a>"
							+"</div>");
							
					$("#row"+item.recipegram_num).append("<div class='col-md-5' style='padding-left: 1.5%; padding-top: 1%;' id='cont_"+item.recipegram_num+"'>"
							+"<form id='form"+item.recipegram_num +"' name='form"+item.recipegram_num +"' method = 'post'>"
							+"<div style='border-bottom:1px solid rgba(0,0,0,.0975); margin-top:3%; padding-bottom:3%;'id='nick_"+item.recipegram_num+"' >"
										
							+"<input type='hidden' name = '${_csrf.parameterName }' value = '${_csrf.token }'/>"
							+"<input type='hidden' id='user_nickname' name='user_nickname' value='"+item.user_nickname +"'>"
							+"<span id='nckname' class='font-size-17' style='color: #65737e;'  onclick='user_list("+item.recipegram_num+")'> "
							+item.user_nickname 
					 		+"</span>");
					
					if(item.user_num == user_num){
						$("#nick_"+item.recipegram_num).append("<img src='../img/user/recipegram_update.png' class='mr-2 recipegram_update ' style='width:3.5%; margin-top:-1.5%; margin-left:75%;' onclick='modify("+item.recipegram_num +")'/>"
			        		+"<i class='fas fa-times fa-x recipegram_delete' onclick='rg_delete("+item.recipegram_num+")'></i>");
					}
					
					$("#form"+item.recipegram_num).append("</div></form>");
					 		
							
					$("#cont_"+item.recipegram_num).append("<div class='con'>"
							+"<div class='col-sm-12 col-xs-12'>"
							+"<div class='info_data ' id='btn_info"+item.recipegram_num +"' class='font-size-17' >"
							+item.recipegram_content
							+"</div>"
							+"<span class='col-sm-12 rgdate font-size-13' style='float:right;color: #d2d2d2;padding-top:1%;'> " 
							+year+"년 " + month +"월 " +day +"일 "
							
							+"</span> "
							+"</div>"
			       			+"<div class='row col-md-12 mt-4 pt-3'><br>"
			       			+"<div class='info_data2 col-sm-12 ' id='reply_list"+item.recipegram_num +"'>"
			       			+"</div>"
			       			+"</div>"
			     			+"</div>"
							+"<div class='col-md-10 favorite' style='margin-top: 4%; '>"
							+"<img src='img/recipegram/favorite.png' style='width: 1.8rem;' onclick='ChangeImage("+item.recipegram_num+")' name='favorite'  id='favorite"+item.recipegram_num +"'>"
							+"<img src='img/recipegram/hearts.png' style='width: 1.8rem;display:none;' onclick='ChangeImage("+item.recipegram_num+")' name='hearts' id='hearts"+item.recipegram_num +"'>&nbsp;"
							+"</div>"
							+"<span class='col-md-10 rgdate font-size-13' style='float:left;color: #65737e;padding-top:1%;'>"  
							+"<input type='text' name='cnt_like"+item.recipegram_num +"' value='"+item.recipegram_like_cnt +"' style='background:none; border:none;color: #65737e;width:5%;'>명이 좋아합니다."
							+"</span> "
							+"<sec:authorize access='isAuthenticated()'>"
							+"<div class='row col-md-12 reply' style='margin-left:0'>"
							+"<c:set var='recipegram_num' value='"+item.recipegram_num +"'/>"
							+"<c:set var = 'user_nickname' value='"+item.user_nickname +"'/>"
				    		+"<textarea class='replycont' id='reply"+item.recipegram_num +"' name='reply"+item.recipegram_num +"'rows='1' cols='30' ></textarea>"
							+"<input class='replybtn' id='insert"+item.recipegram_num +"'  type='button' onclick='insertReply("+item.recipegram_num +")' value='게시' >"
							+"</div>"
							+"</sec:authorize>	"
							+"</div>"
							+"</div>"
						);
					
					
					getLikeSt(item.recipegram_num);
					 getReplyList();
					 
						}
		             });
							
					
					 
				},
			});
			startNum += 1;
			console.log(startNum);
		}
	}); 
	</script> 
<script>
$('.recipegram_update').tooltip({title:"수정",placement:"bottom"});
$('.recipegram_delete').tooltip({title:"삭제",placement:"bottom"});
</script>  

</body>
</html>