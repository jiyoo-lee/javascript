<%@page import="test1.Index"%>
<%@page import="org.w3c.dom.html.HTMLModElement"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Index id = new Index();
	ModelAndView mv = new ModelAndView();
	String b = (String)request.getAttribute("id");
	out.print(b+" 테스트");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 1일차</title>
</head>
<body>
<br>
<!-- 실제 디렉토리를 바탕으로 제작해야함 -->
Spring view 화면 ${msg} <br>
${data1}
</body>
</html>