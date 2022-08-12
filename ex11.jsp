<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isScriptingEnabled = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 디렉티브2 내장객체</title>
</head>
<body>
<% 
	String name = "hong2";
	request.setAttribute("names", name);
%>
<input type ="text" name="mid" value="<%=name%>" readOnly>
<input type ="text" name="mid2" value="${names}" readOnly>
<br><br>
${names} <!-- requestScope : 디렉티브 태그를 이용하여 값을 출력함 -->
</body>
</html>