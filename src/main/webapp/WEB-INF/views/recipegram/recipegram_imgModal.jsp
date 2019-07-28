<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<head>



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="imgModal" class="imgModal" >
		
 		
	<!-- chatting Modal -->
		
		<span class="delete" id="delete"><i class="fas fa-times fa-2x" style="color:white; font-size:3rem;"></i></span>
		<div class="imgModal-content">
			<img id="imgInModal">
        </div>
		<span id="indexNum" style="color:white; font-size:2.5rem;"></span>
		<span id="backBtn"><i class="fas fa-angle-left" style="color:white; font-size:3rem;"></i></span>
		&nbsp;
		<span id="nextBtn"><i class="fas fa-angle-right" style="color:white; font-size:3rem;"></i></span>

</div>
	
</body>
</html>