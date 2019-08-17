<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

// youtube data api를 이용해서 영상을 DB에 넣는 파일. 다른 기능은 없습니다!

// 내 api key
var apiKey = 'AIzaSyAry2Rne3QM_vNXaA2RoEgPXB2srNNdszI';
// 차례대로 백종원, 백종원, 강식당, 수미네반찬, 냉부해, 최고의 요리비결
var playlistIds = ['PLoABXt5mipg4lPwTJdH3Bv_4NRZHIhAQK', 'PLoABXt5mipg6mIdGKBuJlv5tmQFAQ3OYr', 
						'PLv3Ue3wDYx4NRU7_PDekbW0ZfMcGdxv9V', 'PLSG7lnCaWWE7rlMztqNAb9xLoDWQGAOWV',
						'PL5qRfk4DowRC6HTBdsyEJqRlghV7Pr_kG', 'PLpuzWnAKjQgDwjWVN2nH_mxYJrwPmDXSi'];

// api 요청 url
var url = 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&key='+apiKey+'&playlistId=';

var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";
// 영상 카운트
var datacnt;
// 플레이리스트 카운트
var listcnt;
// xmlHttpRequest 사용 = 오리지널 ajax
function call(nextPageToken, playlistId){
	var xhr = new XMLHttpRequest();
	
	// nextToken 내용이 존재하면 pageToken을 생성하여 다음 페이지값을 재귀함수로 호출
	var pageToken = '';
	if(nextPageToken != ''){
		pageToken = '&pageToken='+nextPageToken	
	}

	var fullURL = url + playlistId
	// 페이지토큰이 존재할 때만 fullURL+pageToken이 된다, false는 동기화!
	xhr.open("GET", fullURL+pageToken, false);
	xhr.onload = function (e) {
		if (xhr.readyState === 4) {
			// 제대로 요청이 수행 된 경우
			if (xhr.status === 200) {
				var result = JSON.parse(xhr.responseText);
				var items = result.items;
				for (var i=0; i<items.length; i++){
					datacnt ++;
					var vid = items[i].snippet.resourceId.videoId;
					var playlistId = items[i].snippet.playlistId;
					var title = items[i].snippet.title;
					var content = items[i].snippet.description;
					if(!(items[i].snippet.thumbnails)){
						console.log(datacnt+"번째 썸네일 없음");
						continue;
					}
					var thumbnail = items[i].snippet.thumbnails.high.url;
					var firstdate = items[i].snippet.publishedAt;
					// api에서 하나의 data를 읽을 때마다 ajax로 컨트롤러 호출해서 DB에 데이터 삽입 
					$.ajax({
						// 해당 url 요청
						url : '/insertVideos',
						// POST 타입으로 요청
						type : 'GET',
						async : false,
						data : {'video_id' : vid, 'video_playlist' : playlistId, 'video_title' : title, 'video_content' : content, 'video_thumbnail' : thumbnail, 'firstdate' : firstdate},
						contentType : 'application/json; charset=utf-8',
						dataType : 'text',
						beforeSend: function(a) {
			                a.setRequestHeader(csrfHeaderName, csrfTokenValue);
			            },
						// 해당 url로 요청이 성공했을 시,  (data : 받은 데이터 (이름 상관x))
						success : function(data){
							if (data == "good"){
								console.log(datacnt+ "번 데이터 성공");
							}
							else{
								alert("통신은 성공했으나 데이터 삽입 실패");
							}
						},
						error:function(request,status,error){
							alert("에러발생");
						}
					});
					
				}
				// nextToken이 존재할 시, 해당 nextToken으로 다음 data를 부르기 위해 재귀함수 호출
				if(result.nextPageToken){
					call(result.nextPageToken, playlistId);
				}
			// url이 잘못 된 경우
			} else {
				console.error(xhr.statusText);
			}
		}
	};
	//요청이 에러난 경우
	xhr.onerror = function (e) {
		console.error(xhr.statusText);
	};
	// 요청 신호 전송
	xhr.send(null);
}

window.onload=function(){
	listcnt = 0;
	datacnt = 0;
	alert("ajax콜 시작합니다");
	for(i=0; i<playlistIds.length; i++){
		listcnt++;
		console.log("##################"+listcnt+"번 리스트");
		call('',playlistIds[i]);
	}
	
}

</script>
<body>
<h4>비디오 넣는곳입니다~</h4>
</body>
</html>