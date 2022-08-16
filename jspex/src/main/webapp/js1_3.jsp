<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 삭제</title>
</head>
<body>
<%
	// 특정 session 속성 삭제
	session.removeAttribute("mid");
	session.removeAttribute("mail");
	session.removeAttribute("lv");
	
	// 모든 session 삭제
	session.invalidate();

%>
</body>
</html>