<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript" src="resources/js/jquery.tablesorter.min.js"></script>

 <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/jquery.sticky.js"></script>
  <script src="resources/js/jquery.waypoints.min.js"></script>
  <script src="resources/js/jquery.animateNumber.min.js"></script>
  <script src="resources/js/aos.js"></script>

  <script src="resources/js/main.js"></script>
  <!-- Metis Menu Plugin JavaScript -->
	<script src="resources/js/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/js/sb-admin-2.js"></script>
<!-- <script src="resources/js/jquery-3.3.1.min.js"></script> -->
<script src="resources/js/jquery-ui.js"></script>
<style>

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1000; /* Sit on top */
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
		margin:2%;
		padding:1%;
		width:95%;
	}

}

/* Modal Content/Box */
.msgbox-modal-content{
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 2%;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}@media (max-width:500px){
	.msgbox-modal-content{
		margin:2% ;
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

</style>
</head>
<body>

<jsp:include page="message_write.jsp"/>
<jsp:include page="message_box.jsp"/>

<button class="font-gray-7" style="border:none; background:none;">
					 			
<img src="img/user/message.png" class="message">

</button>
     
            	
<script>
var modal = document.getElementById('msgModal');

var boxmodal = document.getElementById('msgboxModal');
//var span1 = document.getElementByClassName("close");

$('.message').click(function() {

	  boxmodal.style.display = "block";
	
	 /*  $(this).css('z-index', 3000); */
   
});


/*  span1.onclick = function() {
   modal.style.display = "none";
   } */

window.onclick = function(event) {
   if (event.target == boxmodal) {
      boxmodal.style.display = "none";
   } else if (event.target == modal) {
	   modal.style.display = "none";
   } 
};

$(".msg").on("click", function(e){

	boxmodal.style.display = "none";
	
	modal.style.display = "block";
});

$(".message").on("click", function(e){

	boxmodal.style.display = "block";
	
	modal.style.display = "none";
});

function CheckSize(){
	var textObj = document.getElementById('send');
	var textsize = textObj.value.length;
	textObj.setAttribute('size', textsize);
	
}

  


</script>
</body>
</html>