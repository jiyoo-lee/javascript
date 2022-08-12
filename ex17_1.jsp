<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 Action 태그 관련(ex17과 연계)</title>
</head>
<body>
<%--
<%
	String name = "홍길동님 반갑습니다.";
	out.print(name);
%>
<%=name%>
--%>
<p>ex17_1.jsp페이지입니다.</p>
<%
	String name = "이순신님 반갑습니다.";
	out.print(name);
%>
<%=(new Date().toLocaleString())%>
</body>
</html>