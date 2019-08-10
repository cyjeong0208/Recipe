<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>레시피관리</title>

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
<!-- <script src="../resources/js/jquery-3.3.1.min.js"></script> -->
<script src="../resources/js/jquery-ui.js"></script>
<script>

$(document).ready(function(){ 
    $("#recipe_tb").tablesorter();
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
.text-center input#search:focus, .text-center .icon #search_icon:focus
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
@media (max-width:500px){
	.table {
		font-size : 0.7em;
	}
	
	
}

</style>

</head>


<body bgcolor="black">
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
              <h4>- 레 시 피 관 리 -</h4>
              <a href = "admin_recipe_write.jsp">
              <h4 class="text-right">+</h4></a>
            </div>
          </div>
        </div>
         <div class="row mb-5">
        
			 <table class="table table-hover tablesorter text-center" id="recipe_tb">
			 	<thead>
			 		<tr>
				 		<th>
				 			번 호
				 		</th>
				 		<th>
				 			제 목
				 		</th>
				 		<th>
				 			수정날짜
				 		</th>
				 		<th>
				 			수 정
				 		</th>
				 		<th>
				 			삭 제
				 		</th>
				 	</tr>
				 </thead>
				 <tbody>
			 		<tr>
				 		<td>
				 			1
				 		</td>
				 		<td>
				 			감자전을 만들어보쟈!
				 		</td>
				 		<td>
				 			2019-02-16
				 		</td>
				 		<td>
				 			수 정
				 		</td>
				 		<td>
				 			삭 제
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			4
				 		</td>
				 		<td>
				 			찜크닭크 ~
				 		</td>
				 		<td>
				 			2019-01-08
				 		</td>
				 		<td>
				 			수 정
				 		</td>
				 		<td>
				 			삭 제
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			2
				 		</td>
				 		<td>
				 			뭐먹냐........
				 		</td>
				 		<td>
				 			2019-08-09
				 		</td>
				 		<td>
				 			수 정
				 		</td>
				 		<td>
				 			삭 제
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			3
				 		</td>
				 		<td>
				 			하아......
				 		</td>
				 		<td>
				 			2019-07-27
				 		</td>
				 		<td>
				 			수 정
				 		</td>
				 		<td>
				 			삭 제
				 		</td>
				 	</tr>
				 </tbody>
				 
			 </table>
		
		</div>
		</div>
	</div>
      

    </div>
    
      
           
</body>
</html>