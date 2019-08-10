<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>메시지관리</title>

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

<script type="text/javascript" src="../resources/js/jquery.tablesorter.min.js"></script>

 <script src="../resources/js/popper.min.js"></script>
  <script src="../resources/js/bootstrap.min.js"></script>
  <script src="../resources/js/owl.carousel.min.js"></script>
  <script src="../resources/js/jquery.magnific-popup.min.js"></script>
  <script src="../resources/js/jquery.sticky.js"></script>
  <script src="../resources/js/jquery.waypoints.min.js"></script>
  <script src="../resources/js/jquery.animateNumber.min.js"></script>
  <script src="../resources/js/aos.js"></script>

  <script src="../resources/js/main.js"></script>
  <!-- Metis Menu Plugin JavaScript -->
	<script src="../resources/js/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../resources/js/sb-admin-2.js"></script>
<!-- <script src="../resources/js/jquery-3.3.1.min.js"></script> -->
<script src="../resources/js/jquery-ui.js"></script>
<script>

$(document).ready(function(){ 
    $("#message_tb").tablesorter();
 });

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
.table .msg
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


/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 3000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}


/* Modal Content/Box */
.msg-modal-content{
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}@media (max-width:500px){
	.msg-modal-content{
		margin-left:2%;
		margin-top:15%;
		padding:1%;
		width:95%;
	}

}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/*로그인 상태 유지*/
.checkbox {
	clear: both;
	overflow: hidden;
}

.checkbox label {
	width: 100%;
	border-radius: 3px;
	border: 1px solid #D1D3D4;
	font-weight: normal;
}

@media (max-width:500px){
	.table {
		font-size : 0.7em;
	}
	
	
}
</style>

</head>

<jsp:include page="admin_msg.jsp"/>


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
              <a href="admin_index.jsp" ><img src="../img/admin/admin_logo.png" width="10%"/></a>
            </div>
         </div>
       </div>
    </header>
    
    
  
    <div class="bg-dark" >
		
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-lg-7 text-center search">
      
                
				<form id="searchText" method="post">
					
					<span class="icon">
						<input  TYPE="IMAGE" id="search_icon" src="../img/main/search.png" value="Submit" >
					</span>
					<input id="search" name="search">
				</form>
            </div>
          </div>
        </div>

      </div>
	
	 <div class="subsite-section">
      <div class="container">
        <div class="row mb-2">
        
          <div class="col-12 text-left">
           <div class="block-heading-1">
              <h4>- 메 시 지 관 리 -</h4>
            </div>
          </div>
        </div>
         <div class="row mb-5">
        
			 <table class="table table-hover tablesorter text-center" id="message_tb">
			 	<thead>
			 		<tr>
				 		<th>
				 			번 호
				 		</th>
				 		<th>
				 			닉네임
				 		</th>
				 		<th>
				 			내 용
				 		</th>
				 		<th>
				 			날 짜
				 		</th>
				 		<th>
				 			읽음여부
				 		</th>
				 	</tr>
				 </thead>
				 <tbody>
			 		<tr>
				 		<td>
				 			1
				 		</td>
				 		<td>
				 			연정쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			광고글이 있어요. 레시피그램 아람언니꺼에 .....
							</button>
				 		</td>
				 		<td>
				 			2019-02-16
				 		</td>
				 		<td>
				 			읽 음
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			4
				 		</td>
				 		<td>
				 			아람쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			이상한 사람이 있습니다.... 경고 좀 주 .....
					 		</button>
				 		</td>
				 		<td>
				 			2019-07-12
				 		</td>
				 		<td>
				 			안읽음
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			2
				 		</td>
				 		<td>
				 			관수쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			간단한 쿠키레시피도 올려주세요오오오오오오오 .....
					 		</button>
				 		</td>
				 		<td>
				 			2019-03-29
				 		</td>
				 		<td>
				 			읽 음
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			3
				 		</td>
				 		<td>
				 			상언쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			하하하하하ㅏ하하하 좋아요!!!! 만족스 .....
					 		</button>
				 		</td>
				 		<td>
				 			2019-07-01
				 		</td>
				 		<td>
				 			안읽음
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			5
				 		</td>
				 		<td>
				 			창희쓰
				 		</td>
				 		<td>
				 			<button class="font-gray-7 msg" style="border:none; background:none;">
					 			많은 정보더 올려주시면 감사할꺼 같습 .....
					 		</button>
				 		</td>
				 		<td>
				 			2018-11-10
				 		</td>
				 		<td>
				 			읽음
				 		</td>
				 	</tr>
				 </tbody>
				 
			 </table>
		
		</div>
		</div>
	</div>
      

    </div>
    
      
            	
<script>
var modal = document.getElementById('msgModal');
/* var span1 = document.getElementByClassName("close");
 */
$('.msg').click(function() {

	  modal.style.display = "block";
	 /*  $(this).css('z-index', 3000); */
   
});


/*  span1.onclick = function() {
   modal.style.display = "none";
   }
 */
window.onclick = function(event) {
   if (event.target == modal) {
      modal.style.display = "none";
   } 
}

</script>
           
</body>
</html>