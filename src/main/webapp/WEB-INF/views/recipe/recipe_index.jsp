<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	
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

	
	<style type="text/css">
		
		
		body {
		   font-family: 'Jua', sans-serif;
		}
		
		.text-center input#recipe_search {
		 
		   margin-bottom: 2em;
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
		   /* margin-left: -50px; */
		   /* 텍스트 크기, 간격, 위치 */
		   font-size: 1.5rem;
		   letter-spacing: 5px;
		   padding-left: 10%;
		   
		   
		}
		
		
		header {
			border-bottom: 1px solid #dee2e6 !important;
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
		   margin-left: 420px;
		   margin-top: 3.5%;
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
		
		
		/* 아래 부터는 나의  CSS */
		
		#recipe_search_group ,#searchForm>div[class~='input-group'] {
			margin-bottom: 0.5em;
		}
		
		
        .message_detail{
            position: absolute;
            top: 10%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: black
            
        }
        
        .message_detail {
         visibility: hidden;
        }
        
        .card-img-overlay *{
        	visibility: hidden;
        }
        
        footer {
        	display: none;
        } 
        
	</style>
	
	<script type="text/javascript">
	
	var isDeleted = '${isDeleted}';
	if(isDeleted) {alert('${isDeleted}'+'게시물이 삭제되었습니다.')}
	
	</script>
	<title>자취방 레시피: 레시피 목록</title>
</head>
<body>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<!-- <script src="/resources/js/jquery.stellar.min.js"></script> -->
	<script src="/resources/js/jquery.sticky.js"></script>
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/mediaelement-and-player.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	
	<jsp:include page="../headNfoot/header.jsp" />
	<div class="subsite-section bg-light" style="padding-bottom: 2%;padding-top:1.5em;">
		
	<!-- 검색을 위한 섹션 -->
	<section>
		<div class="container mt-4">
			<!-- 검색바가 위치하는 행-->
			<div class="row align-items-center justify-content-center">
	            <div class="col-sm-12 col-lg-7 text-center search">
	                  <span class="icon"> <input TYPE="IMAGE" id="search_icon" src="img/main/search.png" value="Submit">
	                  </span> <input id="recipe_search" name="recipe_search" placeholder="재료를 검색하세요." style="margin-left: 0px;" value='${MainSearch}'>
	               
	            </div>
	         </div>
	         
	        <!-- 검색바로 검색한 단어들이 들어갈 input 태그 -->
	        <div class="row mb-5">
	        	 <form id="searchForm" class="form-inline"> 
	        	 	
		          	<div class="input-group col-sm-12  col-md-4 offset-lg-1 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		            <div class="input-group col-sm-12  col-md-4 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		            <div class="input-group col-sm-12  col-md-4 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		            <div class="input-group col-sm-12 offset-md-2 col-md-4  offset-lg-0 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		            <div class="input-group col-sm-12 offset-md-1 col-md-4 offset-lg-0 col-lg-2">
		            	<input class="form-control" type="text"  name="searching_Ing" readonly >
		            	<div class="input-group-append">
				      		<button class="btn btn-danger" type="button">&times;</button>  
						</div>
		            </div>
		          </form>
		          
	        </div>
	         
	         
	      
		</div>
	</section>
	
	
	<!-- 레시피 사진 및 정보를 위한 섹션 -->
	<section class="mb-5 text-center" id="Recipe_Section">
		<div class="container">
			<div class="row cards"><!-- 여기에 추가되는 자료들이 들어갑니다. -->
	            
			</div><!-- end of row -->
		</div><!-- end of container -->
	</section>
	</div>
	
	<jsp:include page="../headNfoot/footer.jsp"></jsp:include>
	<%-- <%@include file="footer.jsp" %> --%>
	
	
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<!-- <script src="/resources/js/jquery.stellar.min.js"></script> -->
	<script src="/resources/js/jquery.sticky.js"></script>
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/mediaelement-and-player.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<!-- <script src="/resources/js/slick.min.js"></script> -->
	<!-- <script src="/resources/js/typed.js"></script> -->
	
<!-- 	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script> -->
	
	<script>
	
	//레시피 한개를 추가할 때 생기는 일이 함축되어 있는 
	function recipe_add(recipe_num,recipe_title,recipe_img,recipe_food_main,recipe_food_suv,excel,user_nickname) {
		//recipe_num: 레시피 번호
		//title: 음식 이름
		//sumry: 음식 요약
		//main_ing: 주재료
		//suv_ing: 부재료
		//img_url: 대표 이미지 url
		//excel:   [ 0이면 일반 사용자+관리자의 레시피 ,  1이면 xml의 레시피 ]
		
		let food_main = recipe_food_main.substr(0,recipe_food_main.length-1);//끝에 있는 ',' 제거
		let food_suv='';
		if(!recipe_food_suv){
			food_suv = '없음';
		}else{
			food_suv = recipe_food_suv.substr(0,recipe_food_main.length-1);//끝에 있는 ',' 제거
		}
		
    	let recipe_card = $('<div class="col-md-3">'
			            	+'<div class="card img-fluid mb-4 box-shadow" style="height:85%;">'
			        		+'<div style="height:80%;">'
			                	+'<img class="card-img-top" src='+recipe_img+' alt="Card image" style="width:100%;height:100%;" >'
			                +'</div>'
			                	+'<div class="card-img-overlay" data-recipe_num='+recipe_num+' data-excel='+excel+' style="padding-top: 2em;text-overflow: ellipsis;overflow:hidden; color: #65737e; border:1px solid rgba(0,0,0,.0975);"  >'
						            +'<p class="card-text">주재료 :'+food_main+'</p>'
						            +'<p class="card-text">'+'부재료 : '+food_suv+'</p>'
		            			+'</div>'
		            			+'<div class="card-head text-center" style="padding-top: 1em;margin-bottom: 1em; color:#65737e;">'+recipe_title+'<br><font class="pt-2 pr-2" style="float:right;color:#939393;">'+user_nickname+'</font></div>'
		            			+'</div>'
	            			+'</div>')
		
		//.card-img-overlay 에 이벤트를 걸어주는 작업이다. 
    	$(recipe_card.children().children()[1]).mouseover(function() {//handler 메서드를 절대로 ()=> {} 로 하지말것 , this가 무조건 window로 잡혀버림;;
    		    		$(this).prev().css('filter','opacity(0.3)');	//일단 앞의 <img> 태그의 투명도를 0.3 으로 낮추고
    		    		($(this).children()).css('visibility','visible');//css로 숨어 있던 카드 사진 위의 내용들이 검은색 글자로 뜸
    		            $(this).css('cursor','pointer');				//그리고 해당 카드에 마우스를 대면 pointer 표시
    		    }).mouseout(function() { 
    		    		$(this).prev().css('filter','opacity(1)');		//마우스가 다시 나가면 사진의 투명도가 1이 되고
    		            ($('.card-img-overlay').children()).css('visibility','hidden');	//카드 위의 글자들은 보이지 않게 한다.
    		    }).mouseup(function() {
    		    	//나중에 클릭했을 때 특정 주소로 가야되는데 그 작업을 여기서 할 것이다. 아직은 딱히 작업을 하지 않았다.
    		    	/* console.log('http:localhost:8080/~~/'+$(this).data('excel')+'/'+$(this).data('recipe_num')); */
    		    	//console.log('<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()%>'+'/recipe_detail/'+$(this).data('excel')+"/"+$(this).data('recipe_num'));				    		    	
    		    	self.location = '<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()%>'+'/recipe_detail/'+$(this).data('excel')+"/"+$(this).data('recipe_num');
    			});
    	
		//.cards 태그 안으로 붙인다 (화면에는 부드럽게 나오게 했다.)
    	recipe_card.hide().appendTo($('[class~=cards]')).fadeIn('slow');
		
    }
	
	//내용물을 초기화 할 때 사용
	function erase_recipe() {
		$('.cards').empty();
		$('footer').css('display','none');	
	}
	
	//클로저로 쓰인다.
	function recipe_loop(search_result) {
		   
		   let counter = 0;
		   const amount = 12;
		   
		   return function() {
				console.log(counter);
				console.log(amount);
				//counter가 우리가 갖고 있는 검색 결과의 갯수보다 큰 숫자이면 함수를 그냥 return 한다.
				if(counter >= search_result.length) {return;}
		        for(let cnt = counter; cnt<counter+amount; cnt++) {
					//모든 검색이 끝나면 footer를 넣어주고 for문을 빠져나온다.
					if(!search_result[cnt]){//undefined 거르기
						console.log('footer in!'); 
						$('footer').css("display","block"); 
						break;
					}
					let result = search_result[cnt];
					console.log(result);//[0]~[11] , [12]~[23] , [24]~[35], [36]~[39] 나머진 undefined
					recipe_add(result['recipe_num'],result['recipe_title'],result['recipe_img'],result['recipe_food_main'],result['recipe_food_suv'],result['excel'],result['user_nickname']);
		      	}
		        counter += amount;
		   }
	}
	//사용 방법
	//var loop1 = recipe_loop(search_result);
	//loop1() 호출하면 됨
	
	
	//=========================================== 검색을 할 때 쓸 search 메서드 ===========================================//
	function search(search_array) {
		$.ajax({
    	    method      : 'GET',
    	    url:'/rest/searchRecipe',
    	    dataType:"json",
    	    traditional : true,
    	    data        : {
    	        'ingredients' : search_array
    	    },
    	    success     : function(data) {
    	        console.log(data);   
    	        search_result = data;
    	        Show = recipe_loop(data);
    	        erase_recipe();
     	        Show();
    	    },
    	    error       : function(request, status, error) {
    	        alert(error);
    	    }
    	});
	}
	
	
	
	let search_result;//검색 결과
	let Show;//클로저를 담을 변수이다
	
	
	
	//=========================================== 문서가 모두 준비되면 ===========================================//
	
	$(document).ready(function() {
		var ings=$('input[name="searching_Ing"]');	//메모란에 있는 재료들의 값을 읽어오기 해당 DOM을 가져오는 선언 및 초기화, ings 는 ingredients의 함축어다.
		var deleteBtns = $('button.btn.btn-danger');//메모란 옆에 있는 X 버튼을 DOM을 읽어오기 위한 선언 및 초기화
	    //var exist_ings = ['감자','양파','김','밥'];	
		
		
		
		//================================= 화면 첫 시작시에 데이터를 읽어온다 ===========================================/
		
		//나중에 index화면에서 검색을 땅 치고 온 것에 대해서는 별도의 작업을 할 것이다
		//jsp의 $를 사용해서 model에 저장된 값을 읽어 올 것이다. $(document).ready 밖에 둔다.
		
		//만약 검색을 해서 가져온 데이터면 잠시 모든 데이터를 가져오는 것을 멈춘다.
		$.ajax({
               type      : 'GET',
               url:'/rest/getAllRecipe',
               dataType:"json",
               success     : function(data) {
                 var MainSearch = '${MainSearch}';
                 if(MainSearch) {
                    $('#search_icon').click();
                 } else {
                      console.log(data);   
                      search_result = data;
                      Show = recipe_loop(data);
                      Show();
                 }
               },
               error       : function(request, status, error) {
                   alert(error);
               }
		});
			
		//=================================== 맨 위의 헤더 아이콘에 마우스 대면 툴팁이 뜬다 ====================================//
		
		 
        // nav-bar에 있는 아이콘에 마우스를 대면 아래 title 글씨가 말풍선으로 달린다.
        $('#recipe_link').tooltip({title:"레시피",placement:"bottom"});
    	$('#video_link').tooltip({title:"요리 영상",placement:"bottom"});
    	$('#recipegram_link').tooltip({title:"레시피그램",placement:"bottom"});
    	$('#sale_link').tooltip({title:"할인정보",placement:"bottom"});
    	$('#chat_link').tooltip({title:"채팅방",placement:"bottom"});
	    
	    
    	
    	//=================================== 메모의 내용을 배열 형태로 읽어온다 ====================================//
    	
	    /* 오른쪽에 메모되는 "재료들"의 목록을 배열로 가져오는 함수 */
	    function memoCollect() {
			let memo = []; 
			$('form#searchForm input.form-control').filter(function(index,item){		
				return item.value!=='';}).each(function(index,item){memo.push(item.value)});
			return memo;
		}
    	
	  	//=================================== X 버튼 클릭시 ====================================//
    	
	    /* 메모의 X버튼을 눌렀을 때 발생하는 이벤트를 등록 */
	    /* 해당 메모의 내용을 지우고 모든 메모들을 다시 앞에서부터 채워지게 해놨다. */
	    for( let i = 0 ; i < deleteBtns.length ; i++) {
	    	deleteBtns[i].onclick = function(){ 	//1. 버튼을 누르면
	    		ings[i].value = '';					//2. 해당 버튼과 연관된 메모(input)의 내용이 삭제된다.
	    		let buf = memoCollect();			//3. 메모의 내용을 모두 모아서 buf 배열에 담는다.
	    		for(let j=0 ; j <ings.length ; j++){//4. buf의 내용을 순차적으로 넣는다. 만약 이미 메모에 내용이 있으면 지운다.
	    			if(buf[j]){ings[j].value=buf[j];}
	    			else {ings[j].value = '';}
	            }
	    		
	    		console.log(memoCollect());
				search(memoCollect());
	    	}
	    }	
	    
	    
	    //=============================== 검색 관련 ===================================//
	    
	    // "검색 버튼"
		$('#search_icon').on("click",function(e){
			var recipe_search = $('#recipe_search');
			var ingsMemo = memoCollect();//현재 메모장에 적혀있는 재료를 읽어온다
			
			var search_value = recipe_search.val(); //검색창에 있는 재료를 읽어온다.
			
			//빈 문자열은 그냥 return!
			if(!search_value) return;
			
			recipe_search.val('');	//검색창의 내용을 비우고
			recipe_search.focus(); //커서를 놓아준다.
			
			
			// 만약 5개를 다 쓰면 어떻게 반응할지 결정한다.
			if(ingsMemo.length===5){
				alert('5개의 재료 선택을 이미 모두하셨습니다.');
				return;
			}		
			
			/* 
			// 만약 검색바에 적은 재료가 현재 내가 DB나 JSON의 재료 목록에 존재하지 않으면 내용이 들어가지 못하게 함
			if(!exist_ings.includes(search_value)) {
				
				alert('존재하지 않는 재료입니다.');  
				return;
			}
			 */
			if(ingsMemo.length !== 0) {
				// ※주의: [].includes('값')도 false다
				if(ingsMemo.includes(search_value)) {
					alert('이미 메모장에 있는 재료입니다. \n다른 재료를 검색해주세요');
					return;//함수를 끝낸다.
				}
			} 
			
			
			//실제 메모장에 재료를 기입하는 for문, 마지막 비어있는 공간에 넣는다.
			for(var i = 0 ; i < ings.length ; i++){
				//맨 마지막에 재료를 넣는다
	            if(!ings[i].value) {ings[i].value=search_value; break;}
	        }
			
			console.log(memoCollect());
			search(memoCollect());
			
			
		})
	    
		
		// "검색창"
		$('#recipe_search').keypress(function(e){
			
			
			if(e.which === 13){ //검색차에서 엔터를 치는 경우
	          
				/* var recipe_search = $('#recipe_search');
				var ingsMemo = memoCollect();//현재 메모장에 적혀있는 재료를 읽어온다
	  			
				var search_value = recipe_search.val(); //검색창에 있는 재료를 읽어온다.
				recipe_search.val('');	//검색창의 내용을 비우고
				recipe_search.focus(); //커서를 놓아준다.
	           
				//빈 문자열은 그냥 return!
				if(!search_value) return;
				
				// 만약 5개를 다 쓰면 어떻게 반응할지 결정한다.
				if(ingsMemo.length===5){
					alert('5개의 재료 선택을 이미 모두하셨습니다.');
					return;
				}		
				
				// 메모에 현재 내가 검색하고자 하는 재료가 이미 있는 경우 이것을 중복으로 생각하고 경고창을 날린다.
				if(ingsMemo.length !== 0) {
					// ※주의: [].includes('값')도 false다
					
					if(ingsMemo.includes(search_value)) {				//메모장에 현재 존재하는 재료이면
						alert('이미 메모장에 있는 재료입니다. \n다른 재료를 검색해주세요');//경고창으로 중복됐음을 보여준다
						return;//함수를 끝낸다.
					}
				} 
				
				
				//검색창의 재료를 메모로 옮기는 것이다.
				for(var i = 0 ; i < ings.length ; i++){
		            if(!ings[i].value) {ings[i].value=search_value; break;}
		        }
				
				
				console.log(memoCollect());
				search(memoCollect()); */
				$('#search_icon').click();
				
			}//end of if(e.which === 13)
		});

	    
		//=============================== 무한 스크롤 ===================================//
	   
		$(window).scroll(function(){
		   let $window = $(this);
		    let scrollTop = $window.scrollTop();
		    let windowHeight = $window.height();
		    let documentHeight = $(document).height();
		   
			if(Math.abs(documentHeight -scrollTop - windowHeight )<=2) {
				Show();
			}
		 });
    
	
		
	});
	
	
	
  </script>
</body>
</html>