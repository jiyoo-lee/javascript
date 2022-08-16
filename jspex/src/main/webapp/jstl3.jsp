<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="kh" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
core : 기본엔진
functions : 문자열 함수
sql : DB연결
formatting : 시간, 날짜, 다국어
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 - JSTL 반복문</title>
</head>
<!-- forEach : JSTL의 반복문 출력 부분 -->
<%
request.setCharacterEncoding("UTF-8");   
String data[] = {"홍길동","이순신","강감찬","유관순"};

%>
   <kh:set var="user" value="<%=data %>"></kh:set>
<body>
<table>
   <tr>
      <kh:forEach var="a" begin="1" end="5">
         <td><kh:out value="${a}"></kh:out></td>
      </kh:forEach>
   </tr>
</table>
<hr>
<kh:forEach var="b" begin="2" end="4">
   <kh:forEach var="c" begin="1" end="5">
      <span>${b} * ${c} = ${b*c}<br></span>
   </kh:forEach>
</kh:forEach>
<hr>
<kh:forEach var="nm" items="${user}">
고객명 : ${nm }<br>
</kh:forEach>
<hr>
<kh:forEach var="nm2" begin="0" end="${fn:length(user)-1}">
고객명 : ${user[nm2]}<br>
</kh:forEach>
</body>
</html>