<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%
	// 좋아요 누른 영상 리스트들(DB에서 가져올거)
	ArrayList ids = new ArrayList();
	ArrayList titles = new ArrayList();
	ids.add("0hYm1QOJZeo");
	ids.add("3y_AR7zYXM");
	ids.add("C2GGN4yEphk");
	titles.add("양파 농가를 응원합니다! 만능양파볶음 대작전 1편: 양파 손질과 보관법");
	titles.add("만능양파볶음 활용 두 번째: 만능양파 덮밥");
	titles.add("만능양파볶음 활용 세 번째: 만능양파 스프");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
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
.mainRow{
	max-height:1500px;
	overflow-y:scroll;
}
.mainRow::-webkit-scrollbar { 
    display: none; 
}
.rWrapper {
	position: relative;
	padding-bottom: 56.25%; /* 16:9 비율인 경우 */
	/* padding-bottom값은 4:3 비율인 경우 75%로 설정합니다 */
	padding-top: 25px;
	height: 0;
	}	
.rWrapper img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	}

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
	
body{
	min-width:540px;
}
.wholeContainer h5{
	margin-bottom:10%;
}

.videoHead hr, .recipeHead hr{
	margin-top:6%;
	margin-bottom:6%;
}

.title{
	font-size:2rem;
	color:#FFC69F;
}
/* .videoBody, .recipeBody{
	max-height:1000px;
	overflow-y: scroll;
} */
.videoBody::-webkit-scrollbar, .recipeBody::-webkit-scrollbar { 
    display: none; 
}
.deleteBtn{
	margin-left:95%;
	cursor:pointer;
}

@media(max-width:500px){
	.left, .right{
		margin-top:1.5rem !important;
		height:500px;
	}
	.right{
		margin-bottom:2rem;
	}
	.videoHead hr, .recipeHead hr{
	margin-top:3%;
	margin-bottom:3%;
	}
	.videoBody, .recipeBody{
		max-height:80%;
		overflow-y: scroll;
	}
.wholeContainer img{
	width:100%;
}
.wholeContainer iframe{
	width:100%;
}
</style>

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<script src="../resources/js/jquery-3.3.1.min.js"></script>
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

<jsp:include page = "../headNfoot/header.jsp"/> 
	
		<div class="subsite-section">
		      <div class="container">
		        <div class="row">
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_index.jsp" id="mypage"><h4 class="my">회원정보</h4></a>
		              
		            </div>
		          </div>
		          
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            	<a href="#table2">	
		              <a href="myPage_recipegram.jsp" id="myrecipegram"><h4 class="my">레시피그램</h4></a>
		              </a>
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_recipe.jsp" id="myrecipe"><h4 class="my">레시피</h4></a>
		              
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_mark.jsp" id="mymark"><h4 class="clickmy">찜</h4></a>
		              
		            </div>
		          </div>
		        </div>
		       </div>
		     </div>
		     
		     
		<div class="wholeContainer bg-light">
		<div class="container">
			<div class="row mainRow">
				<!-- 좌측 -->
				<div class="col-md-6 mt-5 left">
					
					<div class="col-md-12 text-center recipeHead">
						<span class="title">찜한 레시피</span>
						<hr>
					</div>
					
					<div class="col-md-12 recipeBody">
						<% for(int i=0; i<5; i++){  %>
						<div class="each">
							<span class="deleteBtn"><i class="fas fa-times"></i></span>
							<div class="rWrapper">
								<img src="../img/main/mainimg4">
							</div>
							<h5><%=i %> 번째 블럭</h5>
						</div>
						<%} %>
					</div>
				</div>
				
				<!-- 우측 -->
				<div class="col-md-6 mt-5 right">
					<div class="col-md-12 text-center videoHead">
						<span class="title">찜한 요리영상</span>
						<hr>
					</div>
					
					<div class="col-md-12 videoBody">
						<% for(int i=0; i<ids.size(); i++){  %>
						<div class="each">
						<span class="deleteBtn"><i class="fas fa-times"></i></span>
						<div class="vWrapper">
							<iframe src="https://www.youtube.com/embed/<%=ids.get(i) %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
				<h5><%=titles.get(i) %></h5>
						</div>
						<%} %>
					</div>
				</div>
			</div>
			<div class="row mb-5">
			</div>
		</div>
		</div>

<jsp:include page = "../headNfoot/footer.jsp"/> 
<script>

</script>
</body>
</html>