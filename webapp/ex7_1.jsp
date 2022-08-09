<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 값 받기(post + get)</title>
</head>
<body>
<%=new java.util.Date() %>
<%
	request.setCharacterEncoding("UTF-8");
//get 전송시는 server.xml
%>
<%=request.getParameter("mid")%>
</body>
</html>