<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - SPA 만들기</title>
<!--
* AJAX 전송 : MPA + JS or JQ or ECMA
* FORM 전송 : MPA + SPA
SPA: Single Page Application (단일 페이지에서 작동)
  => 백엔드와 프론트엔드의 업무분장이 확실 함
  SPA가 안되는 경우 : Servlet 안됨
MPA : Multi Page Application (페이지 -> 페이지)
  => 백엔드가 프론트엔드 역할까지 해야 함
-->
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String mid = request.getParameter("userid");
	
	if(mid != null){
		out.print(mid);
	}
else { %>
<form name="frm" id="frm" method="post" action="./ex8.jsp">
<input type ="text" name="userid">
<input type ="submit" value="전송">
</form>
<% } %>
</body>
</html>