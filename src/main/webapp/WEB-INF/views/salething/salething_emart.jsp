<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>

<%
ArrayList<String> em_img = (ArrayList<String>)request.getAttribute("em_img");
ArrayList<String> em_title = (ArrayList<String>)request.getAttribute("em_title");
ArrayList<String> em_cost = (ArrayList<String>)request.getAttribute("em_cost");
ArrayList<String> em_buy = (ArrayList<String>)request.getAttribute("em_buy");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>할인정보</title>
<!-- css -->
	
   <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
    
    <link rel="stylesheet" href="resources/css/aos.css">

    <link rel="stylesheet" href="resources/css/style.css">
    
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
	
	
	 
	
	<script>
		function page_homeplus(){
			newin=window.open('about:blank');
			newin.location.href="http://www.homeplus.co.kr/app.exhibition.cheapershop.CheaperShop.ghs?comm=usr.cheapershop&WT.ac=Main_GNB_ssaday";
		}
		
		function page_lottemart(){
			newin=window.open('about:blank');
			newin.location.href="http://www.lottemart.com/todayhot/todayhotMain.do?SITELOC=AC002&LPOINT_YN=N&CHILD_YN=N&STR_CD=307&LOGIN_YN=N&CUST_GRADE=&tabNo=tab00&sortType=mDesc&freeDeliYn=N&shopDeliYn=N";
		}
		
		function page_emart(){
			newin=window.open('about:blank');
			newin.location.href="http://emart.ssg.com/sale/main.ssg?Egnb=sale";
		}
	</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
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
	
  <div class="site-wrap"  id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
      
    <jsp:include page = "../headNfoot/header.jsp"/> 
    
   <div class="subsite-section">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-lg-3 mb-1 text-center">
            <div class="block-heading-1">
            
              <a href="salething_homeplus" id="homeplus"><h4 class="mart">홈플러스</h4></a>
              
            </div>
          </div>
          
          <div class="col-md-4 col-lg-3 mb-1 text-center">
            <div class="block-heading-1">
            	<a href="#table2">	
              <a href="salething_lotte" id="lotte"><h4 class="mart">롯데마트</h4></a>
              </a>
            </div>
          </div>
          <div class="col-md-4 col-lg-3 mb-1 text-center">
            <div class="block-heading-1">
            
              <a href="salething_emart" id="emart"><h4 class="clickmart">이마트</h4></a>
              
            </div>
          </div>
        </div>
       </div>
     </div>
       
      
         <!-- 이마트 --> 
     <div class="subsite-section mb-5 bg-light" id="emart-section">
       <div class="container"> 
        <div class="row">
        	<!-- 해당 링크로 이동  -->
        	
        <%
        	for(int i=0; i<4; i++){
        %>
          <div class="col-lg-3 col-md-4 mb-4 mb-lg-0" data-aos="fade-up" >
            <div class="block-team-member-1 text-center rounded">
            	
            	<img src=<%=em_img.get(i) %>
											onclick="page_emart()"
											alt="Image" class="img-fluid">
               
              <h3 class="font-size-18 text-center mb-4 mt-4"><%=em_title.get(i) %><br></h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-13 mb-2">판매가: <%=em_cost.get(i) %></span>
              <p class="px-3 font-size-16 mb-3">할인가격 : <%=em_buy.get(i) %>원</p>
              
            </div>
          </div>
         <%} %>
            
<!--             <div class="col-lg-3 col-md-4 mb-4 mb-lg-0" data-aos="fade-up" >
            <div class="block-team-member-1 text-center rounded">
            	
            	<img src="http://item.ssgcdn.com/56/97/40/item/0000007409756_i1_1200.jpg"
											onclick="page_emart()"
											alt="Image" class="img-fluid">
               
              <h3 class="font-size-18 text-center mb-4 mt-4">소고기 달링다운 냉장 윗 등심 스테이크<br>(호주산)_100g</h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-13 mb-2"></span>
              <p class="px-3 font-size-16 mb-3">할인가격 : 3,980원</p>
              
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mb-4 mb-lg-0" data-aos="fade-up" >
            <div class="block-team-member-1 text-center rounded">
            	
            	<img src="http://item.ssgcdn.com/73/23/41/item/1000030412373_i1_600.jpg"
											onclick="page_emart()"  alt="Image" class="img-fluid">
               
              <h3 class="font-size-18 text-center mb-4 mt-4">금주의 돈육행사!<br>삼겹살/목살 행사가격으로 쓱~</h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-13 mb-2"></span>
              <p class="px-3 font-size-16 mb-3">할인가격 : 9,280원</p>
              
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mb-4 mb-lg-0" data-aos="fade-up" >
            <div class="block-team-member-1 text-center rounded">
            	
            	<img src="http://image.homeplus.co.kr/UserFiles/Pressimages/95/280/129341995_0.jpg" 
											onclick="page_homeplus()" alt="Image" class="img-fluid">
               
              <h3 class="font-size-18 text-center mb-4 mt-4">유기농 표고버섯_500g(봉)</h3>
              <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-13 mb-2"></span>
              <p class="px-3 font-size-16 mb-3">할인가격 : 7,900원</p>
              
            </div>
          </div>  -->    
            
			
					</div>
				</div>
			</div>
	
		

	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

	</div>
	<jsp:include page = "../headNfoot/footer.jsp"/> 
</body>
</html>