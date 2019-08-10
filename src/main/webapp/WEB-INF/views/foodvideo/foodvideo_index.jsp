<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/jquery-ui.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">

<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">

<link rel="stylesheet" href="../resources/css/aos.css">

<link rel="stylesheet" href="../resources/css/style.css">

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

.rowBlock {
	padding-top: 2%;
	padding-right: 2%;
	padding-left: 2%;
	margin-bottom: 5%;
	border: solid 1px #D8D8D8;
	margin-bottom: 5%;
	padding-right: 2%;
}

.rowBlock {
	position: relative;
	overflow: hidden;
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

iframe {
	margin: 0%;
}

.play_button {
	width: 100%;
	height: 100%;
	position: absolute;
	background:
		url("https://t1.daumcdn.net/cfile/tistory/272B024E567617E839")
		no-repeat;
	background-position: 42% 50%;
	background-size: 16%;
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

<%
	String videoId = "Lg2HD5aZYcM";
	if (request.getParameter("videoId") != null) {
		videoId = request.getParameter("videoId");
	}
%>

<title>요리영상Main</title>



</head>

<body>

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
<jsp:include page="../headNfoot/header.jsp" />

	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-12 col-lg-7 text-center search">

				<form id="searchText" method="post">
					<span class="icon"> <input TYPE="IMAGE" id="search_icon"
						src="../img/main/search.png" value="Submit">
					</span> <input id="recipe_search" name="recipe_search"
						placeholder="영상을 찾아보아요">
				</form>
			</div>
		</div>
	</div>

	<div class="subsite-section bg-light" style="margin-top: -5%">
		<div class="container" style="margin-top: -2.5%">
			<div
				style="float: left; margin-left: -1%; font-size: 150%; color: #FFC69F;">인기영상</div>
			<br> <br>
			<div class="rowBlock rounded ">
				<div class="row mb">
					<div class="owl-carousel owl-theme">
						<div class="col-auto">
							<!--  <video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted src="https://www.youtube.com/embed/Lg2HD5aZYcM">   -->
							<!--  <source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">   -->
							<!-- </video>   -->
							<a href="foodvideo_detail.jsp"> <span
								class="play_button"></span> <img class="preview_img"
								src="http://img.youtube.com/vi/Lg2HD5aZYcM/hqdefault.jpg"
								alt="preview_img"></a> <span class="title">강식당 - 아기짜장밥</span>
						</div>
						<div class="col-auto">
							<!-- <video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								 <source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg"> 
							 </video> -->
							<a href="foodvideo_detail.jsp"> <span
								class="play_button"></span> <img class="preview_img"
								src="http://img.youtube.com/vi/Lg2HD5aZYcM/hqdefault.jpg"
								alt="preview_img"></a> <span class="title">강식당 - 아기짜장밥</span>
						</div>
						<div class="col-auto">
							<!--  <video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted> 
								 <source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg"> 
							 </video>  -->
							<a href="foodvideo_detail.jsp"> <span
								class="play_button"></span> <img class="preview_img"
								src="http://img.youtube.com/vi/Lg2HD5aZYcM/hqdefault.jpg"
								alt="preview_img"></a> <span class="title">강식당 - 아기짜장밥</span>
						</div>
						<div class="col-auto">
							<!--  <video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								 <source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg"> 
						</video>  -->
							<a href="foodvideo_detail.jsp"> <span
								class="play_button"></span> <img class="preview_img"
								src="http://img.youtube.com/vi/Lg2HD5aZYcM/hqdefault.jpg"
								alt="preview_img"></a> <span class="title">강식당 - 아기짜장밥</span>
						</div>
						<div class="col-auto">
							<!-- video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								 <source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg"> 
							</video>  -->
							<a href="foodvideo_detail.jsp"> <span
								class="play_button"></span> <img class="preview_img"
								src="http://img.youtube.com/vi/Lg2HD5aZYcM/hqdefault.jpg"
								alt="preview_img"></a> <span class="title">강식당 - 아기짜장밥</span>
						</div>
					</div>
				</div>
			</div>

			<div class="container" style="margin-top: -1.8%;">
				<div
					style="float: left; margin-left: -1%; font-size: 150%; color: #FFC69F;">새로운
					영상</div>
				<br>
				<br>
				<div class="row" id="thumbnails"></div>

				<!-- 	<div class="row">
					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
						<div class="video-team-member-1 text-center rounded">
							<video class="img-fluid" onmouseover="this.play()"
								onmouseout="this.pause()" autobuffer="true" width="400px"
								height="300px" muted>
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.mp4"
									type="video/mp4">
								<source
									src="img/foodvideo_test/KakaoTalk_Video_20190702_1548_24_188.ogg"
									type="video/ogg">
							</video>
							<span><강식당> <br>
								김치밥</span>
						</div>
					</div>
				</div> -->
			</div>
		</div>
	</div>

	<jsp:include page="../headNfoot/footer.jsp" />


	<script>
		var siteCarousel = function() {
			if ($('.nonloop-block-13').length > 0) {
				$('.nonloop-block-13').owlCarousel({
					center : false,
					items : 1,
					loop : true,
					stagePadding : 0,
					margin : 0,
					autoplay : true,
					nav : true,
					//navText: ['<span class="icon-arrow_back">', '<span class="icon-arrow_forward">'],
					responsive : {
						400 : {
							margin : 0,
							//nav: true,
							items : 1
						},
						600 : {
							margin : 0,
							nav : true,
							items : 1
						},
						1000 : {
							margin : 0,
							stagePadding : 0,
							nav : true,
							items : 2
						},
						1200 : {
							margin : 0,
							stagePadding : 0,
							nav : true,
							items : 3
						}
					}
				});
			}

			$('.owl-theme').owlCarousel(
					{
						center : false,
						items : 3,
						loop : true,
						stagePadding : 0,
						margin : 0,
						smartSpeed : 1500,
						autoplay : true,
						pauseOnHover : false,
						dots : true,
						//nav: true,
						navText : [ '<span class="icon-keyboard_arrow_left">',
								'<span class="icon-keyboard_arrow_right">' ],
						responsive : {
							400 : {
								margin : 0,
								//nav: true,
								items : 1
							},
							600 : {
								margin : 0,
								items : 1
							},
							1000 : {
								margin : 0,
								stagePadding : 0,
								items : 2
							},
							1200 : {
								margin : 0,
								stagePadding : 0,
								items : 3
							},
							1285 : {
								margin : 0,
								//nav:true,
								items : 3
							}
						}
					});
		};
		siteCarousel();
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			var thumbnails = document.getElementById("thumbnails");
					// 플레이리스트 아이디들
					var x = "PLoABXt5mipg6mIdGKBuJlv5tmQFAQ3OYr,PLoABXt5mipg4vsOpJb0Aeldlj3A6xq4jQ,PLoABXt5mipg4lPwTJdH3Bv_4NRZHIhAQK,PLA8tEd3EWkFj_s6n5OnAIBVykU7x2sAdm";
					var playlistIds = x.split(',');
					for ( var l in playlistIds) {
						$.get(
							"https://www.googleapis.com/youtube/v3/playlistItems",{
								part : 'snippet',
								maxResults : 50,
								playlistId : playlistIds[l],
								key : 'AIzaSyAmLeDRgbtu16JR5E1s-4Z_lOkq4NemDmY'
							}, function(data) {
								$.each(data.items,function(i,item) {
									var date = item.snippet.publishedAt;
							        var publicDate = date.split('T');
									var output = '';

									output += '<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">'
									output += '<div class="video-team-member-1 text-center rounded">'
									// 수정 필요
									output += '<a href="이동위치?'	+ item.snippet.resourceId.videoId + '">';
									output += '<span class="play_button2"></span>';
									output += '<img class="thumbnail" src="'+item.snippet.thumbnails.medium.url+'"></a>';
									output += '<br><div>' + item.snippet.title + '</div>';
									output += '<br><div style="text-align:right; font-size:0.8rem;">' + publicDate[0] + '</div>';
									output += '</div>';
									output += '</div>';
									thumbnails.innerHTML += output;
					 })
				});
			}
		});
	</script>

</body>
</html>

