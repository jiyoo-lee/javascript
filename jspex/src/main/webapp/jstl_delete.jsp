<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="jy" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<sql:setDataSource var="dbs" url="jdbc:mysql://umj7-009.cafe24.com/jeeyulee" 
driver="com.mysql.jdbc.Driver" user="jeeyulee" password="jeeyu9400"></sql:setDataSource>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 SQL 데이터 삭제</title>
</head>
<body>
<sql:update dataSource="${dbs}" var="result">

	delete from poll where p_id=?
	<sql:param value="yoo3"></sql:param> <!-- param : ?사용가능함 -->
</sql:update>
<jy:if test="${result==1}">삭제를 완료했습니다!</jy:if>
<jy:if test="${result==0}">삭제..오류...</jy:if>
</body>
</html>