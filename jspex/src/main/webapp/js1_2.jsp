<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 확인</title>
</head>
<body>
<%
	session.setMaxInactiveInterval(60*60);

	Object id = session.getAttribute("mid");
	String mail = (String)session.getAttribute("mail");
	Object lv = session.getAttribute("lv");
	
	out.print(id+" , "+ mail + " , " + lv);
%>
</body>
</html>