<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="jy" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html, charset=utf-8");
	String nb = request.getParameter("number");
%> 
<jy:set var = "n" value="<%=nb%>"></jy:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl2.html과 연동되는 jstl 페이지</title>
</head>
<body>
<!--choose : 다중처리 조건문을 사용할때 사용
when: choose 태그와 함께 사용하는 태그명 : 참일 경우 
otherwise : 거짓일 경우
 -->
 <%--
	<jy:choose>
		<jy:when test="${n%2==0}">
			<jy:out value="${n}"></jy:out>은 짝수입니다.
		</jy:when>	
		<jy:when test="${n%2==1}">
			<jy:out value="${n}"></jy:out>은 홀수입니다.
		</jy:when>	
	</jy:choose> --%>
	
<jy:if test="${n eq '홍길동'}">
	<span>가입 고객입니다.</span>
</jy:if>
<jy:if test="${n eq '이순신'}">
	<span>미가입 고객입니다.</span>
</jy:if>
	
</body>
</html>