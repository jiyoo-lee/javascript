<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./config.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 데이터 전송</title>
</head>
<body>
<form name="frm" id="frm" method = "post"  action="./ex14.jsp">
	<input type = "hidden" name="security" value="loginok">
	<input type ="text" name ="usernm"><br>
	<input type ="text" name ="userid"><br>
	<input type = "radio" name ="agree" value="Y">동의함
	<input type = "radio" name ="agree" value="N" checked>동의안함 <br>
	<input type ="password" name ="userpw"><br>
	<input type ="password" name ="userpw2"><br>
	<input type ="submit" value ="전송"><br>	
</form>
</body>
</html>