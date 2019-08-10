<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>My Page</title>

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
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>

<style>
.wholeBody{
	padding: 3rem 0;
}
#close, img{
	-webkit-filter: opacity(1.0) drop-shadow(0 0 0 #65737e);
	filter: opacity(1.0)) drop-shadow(0 0 0 #65737e);
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

input.cooking_txt, input.cooking_btn{
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
}

input.cooking_txt{
	border-color:#FFD7BE;
	background-color: #FFD7BE;
	width:100%;
	height:4.5rem;
	opacity :0.6;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.0rem;
	letter-spacing: 2px;
	padding-left: 3%;
}


/* 클릭 시 파란테두리 없애기  */
input.cooking_txt:focus, .cooking_btn:focus, #cooking_title:focus, #cooking_sub:focus, #cooking_main:focus
	{
	outline: none;
}



/* z-index : 숫자가 적으면 뒤로 배치 크면 앞으로 배치 */


.cooking_title{
	font-size: 2rem;
}

.cooking_main{
	margin-top:0.5rem;
	height:10rem;
	background-color: #FFD7BE;
	border:none;
	opacity :0.8;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.3rem;
	letter-spacing: 2px;
	padding-left: 6%;
}

.cooking_sub{
	height:9rem;
	background-color: #FFD7BE;
	border: none;
	opacity :0.8;
	/* 텍스트 크기, 간격, 위치 */
	font-size: 1.3rem;
	letter-spacing: 2px;
	padding-left: 6%;
}

@media(max-width:500px){
	.mainImg{
		margin-bottom:0 !important;
	}
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
		            
		              <a href="myPage_recipe.jsp" id="myrecipe"><h4 class="clickmy">레시피</h4></a>
		              
		            </div>
		          </div>
		          <div class="col-md-3 col-lg-2 mb-1 text-center">
		            <div class="block-heading-1">
		            
		              <a href="myPage_mark.jsp" id="mymark"><h4 class="my">찜</h4></a>
		              
		            </div>
		          </div>
		        </div>
		       </div>
		     </div>
		     
		     
<div class="site-wrap mb-5 bg-light"  id="home-section">

  
   
	 <div class="wholeBody">
	
		
        <div class="container eachBody mb-5">
        <div class="row mb-5">
        </div>
        
     	<div class="row">
         <div class="col-lg-6 col-md-6 mb-4 mb-lg-0" >
         		<div class="text-center rounded">
    			
         		<form name="form" id="form" action="" method="post" enctype="multipart/form-data" autocomplete="off">
    				<div class="mainImg mb-2 mt-4" style="height:25.0rem;border:1px dashed #65737e; text-align:center">
           					<img src = "../img/admin/admin_plus.png" id="img"style="width:20%; border:none; padding-top:27%;" > <!-- 이미지버튼으로 파일첨부  -->
          				</div>
           		
           					<input type="file" id="mainimg" style="display:none; " onchange="getThumbnailPrivew(this,$('#mainimg_1'))">
           		
           			
           		</form>
           		</div>
           		
           	</div>
           	<div class="col-lg-6 col-md-6 mb-4 mb-lg-0">
           	<div class="col-12 text-right">
		        		<img src="../img/user/recipegram_update.png" class="mr-2 recipe_update" style="width:5%; margin-top:-4%;"/>
		        		<i class="fas fa-times fa-2x recipe_delete"></i>
		        	</div>
           	<div class="rounded text-center">
    			
           		<span class="cooking_title recipe_title">Title</span>  <!-- 타이틀을 클릭하면 상세보기로 이동 -->
           		<textarea class="cooking_main" readonly style="width:100%;"> 주재료 : 오징어, 참마, 등푸른생선</textarea>
           		<textarea class="cooking_sub"  readonly style="width:100%;"> 부재료 : 들깨, 고수, 푸팟퐁커리</textarea>
           		
          </div>
        </div>
		</div>
		   <!-- <span class="icon"><img src="img/main/search.png" /></span>
                <input type="text" id="recipe_search" /> -->
	
         
        <!-- <div class="row">
        	<div class="col-12 text-right">
        		<i class="fas fa-plus"></i><span>상세보기</span> 
			</div>
		</div> -->
		</div>
       <div class="container eachBody mb-5">
        <div class="row mb-5">
        </div>
        
     	<div class="row">
         <div class="col-lg-6 col-md-6 mb-4 mb-lg-0" >
         		<div class="text-center rounded">
    			
         		<form name="form" id="form" action="" method="post" enctype="multipart/form-data" autocomplete="off">
    				<div class="mainImg mb-2 mt-4" style="height:25.0rem;border:1px dashed #65737e; text-align:center">
           					<img src = "../img/admin/admin_plus.png" id="img"style="width:20%; border:none; padding-top:27%;" > <!-- 이미지버튼으로 파일첨부  -->
          				</div>
           		
           					<input type="file" id="mainimg" style="display:none; " onchange="getThumbnailPrivew(this,$('#mainimg_1'))">
           		
           			
           		</form>
           		</div>
           		
           	</div>
           	<div class="col-lg-6 col-md-6 mb-4 mb-lg-0">
           	<div class="col-12 text-right">
		        		<img src="../img/user/recipegram_update.png" class="mr-2 recipe_update" style="width:5%; margin-top:-4%;"/>
		        		<i class="fas fa-times fa-2x recipe_delete"></i>
		        	</div>
           	<div class="rounded text-center">
    			
           		<span class="cooking_title recipe_title">Title</span>  <!-- 타이틀을 클릭하면 상세보기로 이동 -->
           		<textarea class="cooking_main" readonly style="width:100%;"> 주재료 : 오징어, 참마, 등푸른생선</textarea>
           		<textarea class="cooking_sub"  readonly style="width:100%;"> 부재료 : 들깨, 고수, 푸팟퐁커리</textarea>
           		
          </div>
        </div>
		</div>
		   <!-- <span class="icon"><img src="img/main/search.png" /></span>
                <input type="text" id="recipe_search" /> -->
	
         
        <!-- <div class="row">
        	<div class="col-12 text-right">
        		<i class="fas fa-plus"></i><span>상세보기</span> 
			</div>
		</div> -->
		</div>
		
        <div class="container eachBody mb-5">
        <div class="row mb-5">
        </div>
        
     	<div class="row">
         <div class="col-lg-6 col-md-6 mb-4 mb-lg-0" >
         		<div class="text-center rounded">
    			
         		<form name="form" id="form" action="" method="post" enctype="multipart/form-data" autocomplete="off">
    				<div class="mainImg mb-2 mt-4" style="height:25.0rem;border:1px dashed #65737e; text-align:center">
           					<img src = "../img/admin/admin_plus.png" id="img"style="width:20%; border:none; padding-top:27%;" > <!-- 이미지버튼으로 파일첨부  -->
          				</div>
           		
           					<input type="file" id="mainimg" style="display:none; " onchange="getThumbnailPrivew(this,$('#mainimg_1'))">
           		
           			
           		</form>
           		</div>
           		
           	</div>
           	<div class="col-lg-6 col-md-6 mb-4 mb-lg-0">
           	<div class="col-12 text-right">
		        		<img src="../img/user/recipegram_update.png" class="mr-2 recipe_update" style="width:5%; margin-top:-4%;"/>
		        		<i class="fas fa-times fa-2x recipe_delete"></i>
		        	</div>
           	<div class="rounded text-center">
    			
           		<span class="cooking_title recipe_title">Title</span>  <!-- 타이틀을 클릭하면 상세보기로 이동 -->
           		<textarea class="cooking_main" readonly style="width:100%;"> 주재료 : 오징어, 참마, 등푸른생선</textarea>
           		<textarea class="cooking_sub"  readonly style="width:100%;"> 부재료 : 들깨, 고수, 푸팟퐁커리</textarea>
           		
          </div>
        </div>
		</div>
		   <!-- <span class="icon"><img src="img/main/search.png" /></span>
                <input type="text" id="recipe_search" /> -->
	
         
        <!-- <div class="row">
        	<div class="col-12 text-right">
        		<i class="fas fa-plus"></i><span>상세보기</span> 
			</div>
		</div> -->
		</div>
      </div>
	
</div>

<jsp:include page = "../headNfoot/footer.jsp"/>   

<script>

$('.recipe_title').tooltip({title:"상세보기",placement:"bottom"});
$('.recipe_update').tooltip({title:"수정",placement:"bottom"});
$('.recipe_delete').tooltip({title:"삭제",placement:"bottom"});
</script>        
</body>
</html>