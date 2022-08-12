<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<%
String mid2 = request.getParameter("mid");
String mname2 = request.getParameter("mname");
String c = request.getParameter("c");
String d = "ex21에 대한 값 전달";
%>
<p>-----파일명 : ex21_2.jsp return call test-------</p>
<%=mid2%><br>
<%=mname2%><br>
<%=c%><b>←ex21.jsp의 기존 값</b><br>
</body>
</html>