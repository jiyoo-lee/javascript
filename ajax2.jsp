<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - JQuery VERSION - 그래프,타이머,배열</title>
<script src="./js/jquery.js"></script>
<script>
	$(function() {
		
		$.fn.weather = function() {
			var $apikey = "abc123"; 
			$.ajax({
				url:"./ajax2_ok.jsp", 	//외부에서도 접속 할 수 있도록 하기위해서는 json,jsp 값을 받도록 합니다.
				cache:false,	
				dataType: "text",	//json,xml 파일 외에는 모두 html로 적용해야 합ㄴ다.
				data:{
					apikey:$apikey	//데이터 통신을 위해서 API KEY 확인
				},
				type: "GET",
				success: function ($data) {
					//JSON 파일이 아닌 이상은 parseJSON을 이용하여 파싱해야만 배열로 인식을 함
					var $jdata = jQuery.parseJSON($data);	//js : JSON.parse() 쓰임
					$.fn.ani($jdata);
					//console.log($jdata);
				},
				error: function() {
					console.log("AJAX 통신오류");
				}
			});
			setTimeout($.fn.weather,5000); //매 5초마다 데이터를 로드하게 됨
		}
		setTimeout($.fn.weather,5000); // 최초 실행시 적용되는 부분(두개 써주어야 실시간 데이터 변경이 가능함)
		$.fn.ani = function($jdata) {
		var $w= 0
		while($w < $jdata.length){
			var $area = $jdata[$w]["area"];
			var $areanum = $jdata[$w]["areanum"];  //// width 강수량 1 : 2px = 250px으로 맞춤
			$("#dataload>span:eq("+$w+")>ul>li:eq(1)").animate({
				"width":$areanum + "px"
				},500);
			$w++;
			}
		}
		
	});

</script>
</head>
<body>
<h1>각 지역구 강수량</h1>
<div id="dataload" style="width:700px; height: 500px; border-left: 1px solid black; border-bottom: 1px solid black;">
 <span style="display:block; width:inherit; height: 50px;">
 <ul style="list-style: none; margin:0px; padding: 0px; width:inherit; height: inherit;">
 	<li style="height: 25px;">강동구</li>
 	<li style="width:0px; height: 25px; background-color: skyblue;"></li>
 </ul>
 </span>
 
  <span style="display:block; width:inherit; height: 50px;">
 <ul style="list-style: none; margin:0px; padding: 0px; width:inherit; height: inherit;">
 	<li style="height: 25px;">중랑구</li>
 	<li style="width:0px; height: 25px; background-color: lightgreen;"></li>
 </ul>
 </span>
 
   <span style="display:block; width:inherit; height: 50px;">
 <ul style="list-style: none; margin:0px; padding: 0px; width:inherit; height: inherit;">
 	<li style="height: 25px;">강남구</li>
 	<li style="width:0px; height: 25px; background-color: orange;"></li>
 </ul>
 </span>
 
    <span style="display:block; width:inherit; height: 50px;">
 <ul style="list-style: none; margin:0px; padding: 0px; width:inherit; height: inherit;">
 	<li style="height: 25px;">동대문구</li>
 	<li style="width:0px; height: 25px; background-color: pink;"></li>
 </ul>
 </span>
 
     <span style="display:block; width:inherit; height: 50px;">
 <ul style="list-style: none; margin:0px; padding: 0px; width:inherit; height: inherit;">
 	<li style="height: 25px;">중구</li>
 	<li style="width:0px; height: 25px; background-color: navy;"></li>
 </ul>
 </span>
 
      <span style="display:block; width:inherit; height: 50px;">
 <ul style="list-style: none; margin:0px; padding: 0px; width:inherit; height: inherit;">
 	<li style="height: 25px;">성동구</li>
 	<li style="width:0px; height: 25px; background-color: magenta;"></li>
 </ul>
 </span>
 
 
</div>
</body>
</html>