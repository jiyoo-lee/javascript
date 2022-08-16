<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie 생성</title>
</head>
<body>
<%
	String user ="홍길동";
	String email ="hong@nate.com";
	
	Cookie cookie = new Cookie("person",user); //cookie 값 생성
	response.addCookie(cookie); //client가 생성한 cookie 값 server에 전송시킴
	Cookie cookie2 = new Cookie("email",email);
	response.addCookie(cookie2);
%>
</body>
</html>