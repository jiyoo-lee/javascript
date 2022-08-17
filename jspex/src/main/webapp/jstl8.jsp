<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="jy" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP7일차 JSTL 문자열 </title>
<!-- 
JSTL : Math 없음(cell,round,floor 없음)
 -->
</head>
<body>
<%
	String msg = "test";
%>
<jy:set var ="msg" value="홍길동님 반갑습니다!"></jy:set>
${fn:length(msg)}<br> <!-- 문자열 개수 파악 -->
<strong>${fn:substring(msg,0,3)}</strong><br> <!-- 단어 문자열 자를경우 -->
${fn:replace(msg,"홍길동","이순신")}<br>
${fn:indexOf(msg,"길동")}<br> <!-- 문자열 단어 검색 -->
${fn:trim(msg)}<br> <!-- 앞뒤공백제거 -->
<jy:out value="<%=msg%>"></jy:out> <!-- String msg의 값을 출력함 -->
</body>
</html>