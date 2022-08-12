<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 응용문제</title>
<script>
	function search() {
		var a = document.getElementById("textbox").value;
		
		if(a == ""){
			alert("검색할 상품명을 입력하세요.");
			return;
		}
		else{			
			location.href = "./ex24_1.jsp?fruit=" + a;
		}
	}
</script>

</head>
<body>
<input type="text" name="textbox" id="textbox"> 
<input type="button" value="검색" onclick="search();">
</body>
</html>