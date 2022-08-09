<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isErrorPage = "true"%>
    <!-- isErrorPage : 기본은 false  : 일반페이지로 인식하게 됨 
    						true : 자신의 페이지는 error 발생시 사용되는 페이지로 인식 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR 페이지</title>
</head>
<body>
<% out.print("code error");%>
</body>
</html>