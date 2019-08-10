<%@page import="com.solrecipe.recipe.recipegram.service.RecipegramService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page import="com.solrecipe.recipe.recipegram.domain.RecipegramVO" %>

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
<script src="https://kit.fontawesome.com/d2c6942021.js"></script>


<title>레시피그램</title>

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
.text-center input#recipe_search:focus, .text-center .icon #search_icon:focus, #recipegram_content:focus,
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

.new_like {
	position: static;
	float: right;
	margin-top: -18%;
}

.btn-default {
	background: white;
	border: solid 1px #FFC69F;
	color: #FFC69F;
}

.foodImg {
	width: 100%;
	height: 370px;
}

.mainview {
	margin-bottom: 5%;
}

.reply {
	border: solid 1px rgba(0,0,0,.15);
	border-radius: 30px;
	background: white;
	padding: 4px;
}

@media ( max-width :400px) {
	.reply {
		width: 100%;
	}
}

.replycont {
	border: none;
	border-radius: 35px;
	width: 80%;
	outline: none;
	padding-left: 13px;
	margin-right: 20px;
}

.replybtn {
	border: none;
	border-radius: 30px;
	background: white;
	outline: none;
	float: right;
	color: #FFD7BE;
	margin-top: 1%;
	margin-left:5%;
}

.info {
	ovreflow: hidden;
}

.info .info_data.hidden {
	white-space: nowrap;
	word-wrap: normal;
	width: 89%;
	overflow: hidden;
	text-overflow: ellipsis;
	float: left;
}

.btn-moreInfo {
	/* display: none; */
	/* white-space: nowrap; */
	float: right;
}

@media screen and (min-width: 400px) {
	.info .info_data.hidden {
		width: 70%;
	}
}

.carousel-inner>.carousel-item>img {
	width: 100%;
	height: 457px;

}

@media (max-width: 400px) {
	.carousel-inner>.carousel-item>img {
		width: 100%;
		height:40%;
	}
}

.info_data{
	color: black; 
	width: 100%;

}

 @media (max-width: 400px) {
	.info_data {
		width: 100%;
		height:100px;
	}
} 

@media ( max-width :400px) {
	.favorite {
		margin-top: 5%;
	}
}

textarea {
	resize: none;
}

.contentCss {
	white-space: nowrap;
	word-wrap: normal;
	width: 50%;
	overflow: hidden;
	text-overflow: ellipsis;
	float: left;
}




.rereplybtn {
	border: none;
	border-radius: 30px;
	background: none;
	outline: none;
	
	color: #939393;
	margin-top : 2%;
}

.con{
   width:100%;
   height: 300px;
   overflow-y:scroll;
   -ms-overflow-style:none;
}

.con::-webkit-scrollbar{
   display:none;
}

</style>

</head>
<body>

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

	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

 -->
<jsp:include page="../headNfoot/header.jsp" />
 

	<div class="container">
	
	 <div class="row mb-5 text-center">
        	<div class="col-md-12 mt-4" style="color:#FFC69F ; font-size:1.5rem; ">
    	    	- 레시피그램 작성 -
	        </div>
        </div>
		
	</div>

	<sec:authentication var="user_num" property="principal.member.user_num"/>
		<input type="hidden" id="user_num" name="user_num" value="${user_num }">
    		

	<div class="subsite-section bg-light" style="padding-bottom: 2%;">
		
		
		<div class="container mainview " id="mainview" >
	
	
		 <c:set var="recipegram_num" value="${rglist[0].recipegram_num }"/> 
		 <input type="hidden" id="recipegram_num" name="recipegram_num" value="${recipegram_num }">
    	
			<div class="col-md-12 ">
			
				<input type="hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
				<input type="hidden" id="user_nickname" name="user_nickname" value="${rglist[0].user_nickname }">
			
				
		
			</div>
			
				<div class="row col-md-12 col-sm-12 col-xs-12" style="background-color : white; border:1px solid rgba(0,0,0,.0975); margin-bottom:5rem;padding-left:0;">
					<!-- carousel -->
							<div id="demo" class="col-md-6 carousel" style="padding-left:0;"data-ride="carousel" data-interval="false" >
								<!-- Indicators -->
								<ul class="carousel-indicators" id="indi">
								<c:forEach items="${rglist[0].imgList }" var="img"> 
									<%-- <li data-target="#demo${rglist[0].recipegram_num }" data-slide-to="0" class="active"></li>
									<li data-target="#demo${rglist[0].recipegram_num }" data-slide-to="1"></li>
									<li data-target="#demo${rglist[0].recipegram_num }" data-slide-to="2"></li>
									<li data-target="#demo${rglist[0].recipegram_num }" data-slide-to="3"></li>
									<li data-target="#demo${rglist[0].recipegram_num }" data-slide-to="4"></li> --%>
								</c:forEach> 
								</ul> 
								<!-- The slideshow -->

								<div class="carousel-inner" role="listbox">
									<c:forEach items="${rglist[0].imgList }" var="img" varStatus="status">
										<c:if test="${status.index eq 0}">
											<div class="carousel-item active">
												<img src="./upload/${img.img_name }" alt="">
											</div>
										</c:if>
										<c:if test="${status.index > 0}">
											<div class="carousel-item">
												<img src="./upload/${img.img_name }">
											</div>
										</c:if>
									</c:forEach>
								</div> <!-- carousel-inner -->

								<!-- Left and right controls -->
								<a class="carousel-control-prev" href="#demo" data-slide="prev" role="button"> 
									<span class="carousel-control-prev-icon"aria-hidden="true"></span>
								</a> 
								<a class="carousel-control-next" href="#demo" role="button" data-slide="next"> 
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
								</a>

							</div><!-- col-md-6 carousel -->

					<div class="col-md-6" style="padding-left: 1.5%; padding-top: 1%;">
					
							<div class="con">
								<div class=" col-sm-12 col-xs-12">
									<!-- <input type="text" value="" readonly style="width: 100%;"> -->
									<div  id="recipegram_content" contenteditable="true" style="width:100%; overFlow:auto;" class="font-size-17" >
											${rglist[0].recipegram_content  } 
										
										</div>
										
										
					
									<!-- </div> -->
								</div><!-- col-md-10 col-sm-12 col-xs-12 -->
							
						
     					
     			
	    
       					
     					</div>
					
		   		
				
			</div>
			
				
		</div>
	<!-- </div> -->

</div>
<div class="col-md-12" style="margin-left: 80%; margin-top:-5%;">
    		
         			 <label class="checkbox-inline">
								  <input type="checkbox" id="inlineCheckbox1" name="recipegram_secret" value="option1" > 나만 보기
							</label>
			</div>

		
          <input class="recipegram_btn mt-4 " style="margin-left:80%; width:5.5rem; height:2.5rem; background-color:#f8f9fa; color:#65737e;border-color:#65737e;" type="button" name="button" value="수 정" onClick="updateRecipegram();">
		

	 </div>
	</div>

	<jsp:include page="../headNfoot/footer.jsp" />

	<script>
	
	
	
	
	function user_list(num){
		
		var form_id = "form" + num;
		console.log(form_id);
		
		document.getElementById(form_id).action="/recipegram_user_index";
		document.getElementById(form_id).submit();
	}
	
	
	</script>

 

	<script type="text/javascript">
	
		
		var cnt =1;
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
		<c:forEach var="imgList" items="${list}">
		 var num = "${imgList.recipegram_num }";
		 $.ajax({
			type:"POST",
			url:"/img_list",
			dataType:"json",
			data:{"recipegram_num" : num},
				beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		      },
		    success: function(data){
		    	console.log(data);
		    	$.each(data, function(index, item){
		   			if(index==0){
		    			$('#indi' + item.recipegram_num).append("<li class='active' data-target=#demo" + item.recipegram_num  + " data-slide-to=" + index + ">" + "</li> " );
		    			
		    			
		   			}else
		   				$('#indi' + item.recipegram_num).append("<li  data-target=#demo" + item.recipegram_num  + " data-slide-to=" + index + ">" + "</li> " );
		   			
		    	});
		    },
		    error:function(){
				alert('통신실패!');
			}
		});
	 </c:forEach> 

	 function updateRecipegram(){

		    var formData = new FormData();
		    
		    
			
		    var inputText = document.getElementById('recipegram_content').innerHTML;
		    
		    var inputSecret = document.getElementById('inlineCheckbox1').checked;  //false, true
		   	
		    var user_num = document.getElementById('user_num').value;
		    
		    var recipegram_num = document.getElementById('recipegram_num').value;
		    
		    
		   	
		    if(hash_txt.length == 0){
		    	alert("해시태그를 1개이상 등록해주세요!");
		    	return false;
		    }
		    
		    
		      formData.append("uploadText", inputText); //작성 내용 
		      formData.append("uploadSecret", inputSecret); //나만보기 여부 
		      formData.append("hashTag", hash_txt); //hash tag
		      formData.append("user_num", user_num); //user_num
		      formData.append("recipegram_num", recipegram_num); //recipegram_num
			    
		      
		    $.ajax({
		      url: '/updateRecipegram',
		      processData: false, 
		      contentType: false,
		      data: formData,
		      type: 'POST',
		      beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		      },
		      //dataType:'json',
		      success: function(result){
		          console.log(result); 
		          location.href = "/recipegram_index";
				  //showUploadResult(result); //업로드 결과 처리 함수 

		      },error:function(request,status,error){
		    	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }

		    }); //$.ajax
		    
		  }    


		jQuery(function($) {
			var colorbox = $('.info .info_data');
			var content = '${content}';
			colorbox.each(function() {
				$(this).outerHeight();
				
				if (content.length > 21) {
					$(this).addClass('hiddenCom');
					var btnMoreCmt = $(this).siblings('.btn-moreInfo');
					btnMoreCmt.show();
					btnMoreCmt.on("click", function() {
						$('.info_data').removeClass('hiddenCom');
						$('.info_data').show();
						$(this).remove();
					});
				}
			});
		});
	</script>
	
	<script>
// 아래는 모두 해쉬태그로직
var saveSelection, restoreSelection;

//해시태그 모음 ... 
var hash_txt = new Array();
console.log(hash_txt);
//커서위치...
if (window.getSelection && document.createRange) {
    saveSelection = function(containerEl) {
        var range = window.getSelection().getRangeAt(0);
        var preSelectionRange = range.cloneRange();
        preSelectionRange.selectNodeContents(containerEl);
        preSelectionRange.setEnd(range.startContainer, range.startOffset);
        var start = preSelectionRange.toString().length;

        return {
            start: start,
            end: start + range.toString().length
        }
    };

    restoreSelection = function(containerEl, savedSel) {
        var charIndex = 0, range = document.createRange();
        range.setStart(containerEl, 0);
        range.collapse(true);
        var nodeStack = [containerEl], node, foundStart = false, stop = false;

        while (!stop && (node = nodeStack.pop())) {
            if (node.nodeType == 3) {
                var nextCharIndex = charIndex + node.length;
                if (!foundStart && savedSel.start >= charIndex && savedSel.start <= nextCharIndex) {
                    range.setStart(node, savedSel.start - charIndex);
                    foundStart = true;
                }
                if (foundStart && savedSel.end >= charIndex && savedSel.end <= nextCharIndex) {
                    range.setEnd(node, savedSel.end - charIndex);
                    stop = true;
                }
                charIndex = nextCharIndex;
            } else {
                var i = node.childNodes.length;
                while (i--) {
                    nodeStack.push(node.childNodes[i]);
                }
            }
        }

        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
    }
} else if (document.selection) {
    saveSelection = function(containerEl) {
        var selectedTextRange = document.selection.createRange();
        var preSelectionTextRange = document.body.createTextRange();
        preSelectionTextRange.moveToElementText(containerEl);
        preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
        var start = preSelectionTextRange.text.length;

        return {
            start: start,
            end: start + selectedTextRange.text.length
        }
    };

    restoreSelection = function(containerEl, savedSel) {
        var textRange = document.body.createTextRange();
        textRange.moveToElementText(containerEl);
        textRange.collapse(true);
        textRange.moveEnd("character", savedSel.end);
        textRange.moveStart("character", savedSel.start);
        textRange.select();
    };
}

//a태그 
function createLink(matchedTextNode) {
    var el = document.createElement("a");  // el : http://localhost/recipegram_write#djskfdl
    var hash = matchedTextNode.data.split('#');  // search 하기위해 #제거 
    el.href = "recipegram_index?recipe_search=" +hash[1];  //링크는 해시태그 텍스트.. 
    el.style.color="#5CD1E5";
    el.appendChild(matchedTextNode);
    hash_txt[hash_txt.length] = matchedTextNode.data;// 해시태그 내용... 
	
    return el;
}

function shouldLinkifyContents(el) {
    return el.tagName != "A";
}

function surroundInElement(el, regex, surrounderCreateFunc, shouldSurroundFunc) {
    var child = el.lastChild;
    while (child) {
        if (child.nodeType == 1 && shouldSurroundFunc(el)) {
            surroundInElement(child, regex, createLink, shouldSurroundFunc);
        } else if (child.nodeType == 3) {
            surroundMatchingText(child, regex, surrounderCreateFunc);
        }
        child = child.previousSibling;
    }
}

function surroundMatchingText(textNode, regex, surrounderCreateFunc) {
    var parent = textNode.parentNode;
    var result, surroundingNode, matchedTextNode, matchLength, matchedText;
    while ( textNode && (result = regex.exec(textNode.data)) ) {
        matchedTextNode = textNode.splitText(result.index);
        matchedText = result[0];
        matchLength = matchedText.length;
        textNode = (matchedTextNode.length > matchLength) ?
            matchedTextNode.splitText(matchLength) : null;
        surroundingNode = surrounderCreateFunc(matchedTextNode.cloneNode(true));
        parent.insertBefore(surroundingNode, matchedTextNode);
        parent.removeChild(matchedTextNode);
    }
}

var textbox = document.getElementById("recipegram_content");
var hashTag = /#([^#\s]+)/; //해시태그 정규식 

function updateLinks() {
    var savedSelection = saveSelection(textbox); //커서위치 저장 
    surroundInElement(textbox, hashTag, createLink, shouldLinkifyContents);
    restoreSelection(textbox, savedSelection);
}

var $textbox = $(textbox); //해시태그 

$(document).ready(function () {
    $textbox.focus(); //커서위치 뿌려줌 

    var keyTimer = null, keyDelay = 1000; //해시태그가 적용되는 시간... 안하면 바로 변경되어 이어지지가 않는다... 

    $textbox.keyup(function() {
        if (keyTimer) {
            window.clearTimeout(keyTimer);
        }
        keyTimer = window.setTimeout(function() {
            updateLinks();
            keyTimer = null;
        }, keyDelay);
        
        
    });
});


</script> 
</body>
</html>