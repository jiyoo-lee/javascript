<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 Forward 전송(값 전송)</title>
</head>
<body> 
<%--ㅡMVC 중 Model 역할(작성은 안했지만 들어갈 곳) --%>
<% %>
<%--ㅡMVC 중 Controller 역할 --%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%--param : 매개변수를 생성하여 값을 전달 할때 사용(forward,include에서 사용) --%>
<p>ex20 값 전달</p>
<jsp:forward page="ex20_1.jsp">
	<jsp:param name="mid" value="hong"></jsp:param>
	<jsp:param name="mname" value="홍길동"></jsp:param>
	</jsp:forward>
</body>
</html>