<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="jy" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<sql:setDataSource var="dbs" url="jdbc:mysql://umj7-009.cafe24.com/jeeyulee" 
driver="com.mysql.jdbc.Driver" user="jeeyulee" password="jeeyu9400"></sql:setDataSource>
<!-- setDataSource : DB 연결 TAG -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 JSTL - SQL CONNECTION</title>
</head>
<body>
<!-- dataSource : Connect 와 같은 역할
	query : db 쿼리문 (select)
	udate : db 쿼리문(insert,update,delete)
	var로 query문을 실행하게 됨
-->
<sql:query var="select" dataSource="${dbs}">
select * from poll order by p_idx desc;
</sql:query>
<!-- columnNames : SQL 필드명을 가져올때 사용 -->
<jy:forEach var="poll" items="${select.columnNames}">
	<span><jy:out value="${poll}"></jy:out> <!-- 컬럼명 출력 -->
	</span>
</jy:forEach>
<br><br><br>
<!-- rows: 필드에 있는 값 -->
<jy:forEach var="data" items="${select.rows}">
	<!-- ${data['필드명']} -->
	<span><jy:out value="${data['p_name']}"></jy:out></span>
	<span><jy:out value="${data['p_id']}"></jy:out></span>
	<span>
	<input type="button" value="삭제" onclick="abc(${data['p_idx']});">
	</span><br>
</jy:forEach>
</body>
<script>
	function abc(z) {
		alert(z);
	}

</script>
</html>