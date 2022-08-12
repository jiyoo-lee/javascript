<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex20.jsp와 연계(값 전달 받는 역할)</title>
</head>
<body>
<%--ㅡMVC 중 View 역할 --%>
<%
String mid = request.getParameter("mid");	
String mname = request.getParameter("mname");
%>
<br>
아이디: <%=mid%>
고객명: <%=mname%>
</body>
</html>