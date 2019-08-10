<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<head>



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

		<div id="findPWModal" class="modal">
	
 		
	<!-- Login Modal -->
			<div class="find-modal-content block-heading-1">
				<span class="close">&times;</span>
				<h2 align="center">비 밀 번 호 찾 기</h2>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="find_form" method = "post" >
				
						<div class="form-group">
							<label for="find_username">이메일</label> <!--type="email"  -->
							<br> <p id="username_chk_text" style="display:none; color:#FFA19D;" >회원이 아닙니다.</p> <br> 
							<input type="email" class="form-control" id="find_username" name = "find_username" placeholder="이메일을 입력하세요..." autofocus>
						</div>
						<div class="form-group">
							<label for="find_name">이름</label> 
							<br> <p id="findname_chk_text" style="display:none; color:#FFA19D;" >이름을 확인하세요.</p> <br> 
							
							<input type="text" class="form-control" id="find_name" name="find_name" placeholder="이름을 입력하세요...">
						</div>
						
						
						<input type="button" class="btn btn-success btn-block" id="find_btn" value="다음" >
						
					
						<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
					</form>
				</div>
				
				

		</div>

	</div>

<script type="text/javascript">
	$("#find_btn").on("click", function (e) {
		
		var find_username= $("#find_username").val();
		var find_name= $("#find_name").val();
		
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
			$.ajax({
		             type: "get",
		             url: "/chkName",
		             contentType:'application/json; charset=UTF-8',
		             data : {
		            	 "user_username" : find_username,
		            	 "user_name" : find_name
		             },
		             dataType:'json',
		            
		             /* beforeSend: function(xhr) {
				          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				      },  */
		             success: function(data) {
		            	
		            	
			            	 if(data == "1" ){
			            	
			            		
			         			$("#find_username").css("background-color", "#FFA19D");
			         			$("#username_chk_text").css("display", "inline");
			         			return false;
			            	 }else if(data == "-1"){
			            		 $("#find_username").css("background-color", "#fff");
				         		$("#username_chk_text").css("display", "none");
				         		$("#find_name").css("background-color", "#FFA19D");
			         			$("#findname_chk_text").css("display", "inline");
			            	 
		            	 	}else{
			            		 modal_findPW.style.display = "none";
			            		 modal_newPW.style.display = "block";
			            	 }

		   
		             }, error: function(request,status,error){
		                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
		         });
		
		
	});

</script>
</body>
</html>