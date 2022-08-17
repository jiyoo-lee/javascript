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
<title>JSP 7일차 SQL 데이터 수정</title>
</head>
<body>
<sql:update var="result" dataSource="${dbs}">
	update poll set p_tel=? where p_idx=?
<sql:param value="01012340007"></sql:param>	
<sql:param value="10"></sql:param>	
</sql:update>

<jy:if test="${result==1}">수정 완료!</jy:if>
<jy:if test="${result==0}">수정 실패...ㅠㅠ</jy:if>

</body>
</html>