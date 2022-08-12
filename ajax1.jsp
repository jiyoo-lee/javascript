<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP2일차 AJAX 통신 혼합1</title>
<script>
	function ajax() {
		var id = document.getElementById("mid").value;
		if(id == ""){
			alert("아이디를 입력하세요");
		}
		else{
			var aj;
			function wck() {
				if(window.XMLHttpRequest){
					return new XMLHttpRequest();	
				}
			}
			function acall() {
				if(aj.readyState == XMLHttpRequest.DONE && aj.status == 200){
// 					console.log(this.response);
					var data = JSON.parse(this.response);
					console.log(data);
// 					console.log(data["mid"]);
// 					console.log(data["mname"]);
// 					if(this.response == "no"){
// 						alert("중복된 아이디입니다.");
// 					}
// 					else{
// 						alert("사용가능한 아이디입니다.");
// 					}
				}
			}
			var gopage = "http://192.168.100.216:8080/faq/data.jsp?apikey=aaaa";
// 			var gopage = "./data.json";
// 			var gopage ="./ajax1_ok.jsp?mid=" + id;
			aj = wck();
			aj.onreadystatechange = acall;
			aj.open("GET",gopage,true);
			aj.send();
		}
	}

</script>
</head>
<body>
<input type="text" name="mid" id="mid">
<input type="button" value="중복확인" onclick="ajax();">
</body>
</html>