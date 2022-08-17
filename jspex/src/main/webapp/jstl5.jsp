<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="jy" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="userinfo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 - tagdir 사용법</title>
</head>
<body>
<jy:set var="username" value="홍길동"></jy:set>
<!-- 태그파일을 로드할때 사용함 
사용방식 : <prefix 이름 :파일명>
태그 안은 반드시 비어있어야 함 -->
<userinfo:test></userinfo:test>
<br>
<userinfo:test2>${username}</userinfo:test2>	
<userinfo:test3>${username}</userinfo:test3> 	<!-- 자바 태그코드 실행안됨 -->

</body>
</html>