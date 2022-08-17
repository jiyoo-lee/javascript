<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="jy" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource var="dbs" url="jdbc:mysql://umj7-009.cafe24.com/jeeyulee" 
driver="com.mysql.jdbc.Driver" user="jeeyulee" password="jeeyu9400"></sql:setDataSource>
<%
	String startpage = null; // 최초 시작되는 페이지 값
	String pageno = "5";	//한 페이지당 다섯개씩 보여줌
	String getpage = (String)request.getParameter("p");
	if(getpage == null || getpage.equals("") || getpage.equals("1")){
		startpage = "0";
	}
	else{
		int s = Integer.parseInt(pageno); // 한 페이지에 보여줄 데이터 개수
		int g = Integer.parseInt(getpage); // 페이징 번호값
		int t = (g-1) * s;	//(페이지번호-1) * 한 페이지당 보여줄 개수
		startpage = String.valueOf(t);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 전체 리스트 및 pageing 사용법</title>
</head>
<body>
	<!-- 전체 개수 파악 -->
<sql:query var="num" dataSource="${dbs}">
	select * from poll order by p_idx desc;
</sql:query>

	<!-- 한 페이지당 출력파트 -->
<sql:query var="datas" dataSource="${dbs}">
	select * from poll order by p_idx desc limit <%=startpage%>, <%=pageno%>;
</sql:query>    

<table border="1">
<tr>
<td>NO</td>
<td>ID</td>
<td>고객명</td>
<td>전화번호</td>
<td>입력일자</td>
</tr>
<%int w= 1; %>
<jy:set var ="spage" value="<%=startpage%>"></jy:set>
<jy:forEach var="data" items="${datas.rows}" varStatus="ct">
<!-- varStatus : 순번을 체크함(count(1부터시작)), index(0부터시작)) -->
<tr>
<td><jy:out value="${(num.rowCount-spage)-ct.index}"></jy:out></td>
<td><jy:out value="${data['p_id']}"></jy:out></td>
<td><jy:out value="${data['p_name']}"></jy:out></td>
<td><jy:out value="${data['p_tel']}"></jy:out></td>
<jy:set var="indate" value="${data['p_indate']}"></jy:set>
<td><jy:out value="${fn:substring(indate,0,10)}"></jy:out></td>

</tr>
</jy:forEach>
</table>
<table border="1">
<tr>
<jy:set var="pageno" value="<%=pageno%>"></jy:set>
<jy:set var="pagenum" value="${num.rowCount/pageno+((1-num.rowCount/pageno%1))%1}"></jy:set>
<jy:forEach var="ns" begin="1" end="${pagenum}">
<td onclick="pagego(${ns})">${ns}</td>
</jy:forEach>
</tr>
</table>
<script>

	function pagego(p) {
		location.href="./pageing.jsp?p=" + p;
	}

</script>

</body>
</html>