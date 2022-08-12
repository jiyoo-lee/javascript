<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./config.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - 기본문법 형태(날짜 출력)</title>
</head>
<body>
<%
	Date day = new Date();	//현재 날짜 KST(Korean standard time) => 한국시간 UST : 미국시간 
	out.print(day);
	
	int hour = day.getHours();
	int minute = day.getMinutes();
	int second = day.getSeconds();
	int year = day.getYear()+1900; // 버그 - 2000년도 이상은 오류 1900으로 강제수정
	
	int month = day.getMonth()+1;
	int days = day.getDate();
%>
	<br><br>
<% 
	out.print(hour+"시"+minute+"분"+second+"초"+"<br>");
	out.print(year+"년"+month+"월"+days+"일");
%>
</body>
</html>