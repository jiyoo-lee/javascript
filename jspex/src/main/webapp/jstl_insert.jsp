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
<title>JSP 7일차 SQL 데이터입력(Insert)</title>
</head>
<body>
<!-- update : insert, update,delete 세가지만 사용합니다. -->
<sql:query var="sresult" dataSource="${dbs}">
select count(*) from poll where p_id='yoo';

</sql:query>

<!-- 해당 값에 대한 SQL에 저장 여부를 확인하는 작업 -->
<%-- <jy:out value="${sresult.rowCount}"></jy:out><br> --%>
<jy:out value="${sresult.rowsByIndex[0][0]}"></jy:out>

<jy:if test="${sresult.rowsByIndex[0][0] !=0 }">

<sql:update  var ="result" dataSource="${dbs}">
insert into poll values ('0','유관순','yoo3','01012345678','2','2022-08-17 20:14:55', '0001-01-01 00:00:00');
</sql:update>
<jy:if test="$(result==0)">입력오류</jy:if>
<jy:if test="$(result==1)">입력성공</jy:if>

</jy:if>
</body>
</html>