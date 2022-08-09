<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 값 전달(FORM) : ex7_1과 함께 사용</title>
<script>

	function abc() {
		frm.submit();	
	}
</script>
</head>
<body>
<!-- form 전송 
method="POST"
method="GET" -->
<form name="frm" id="frm" method="POST" action="./ex7_1.jsp" enctype="application/x-www-form-urlencoded">
<input type="text" name="mid">
<input type="button" value="전송" onclick="abc();">
</form>
</body>
</html>