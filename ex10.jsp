<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- errorPage : 코드 또는 DB 또는 Servlet 등 다양한 오류 발생시 지정한 오류 페이지로 이동시켜줌
    web.xml에 error 코드를 입력하여 페이지가 로드되도록 설정합니다. 
  <error-page>
  <error-code>500</error-code>
  <location>/error.jsp</location>
  </error-page>-->
    <%@page errorPage = "./error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 PAGE 디렉티브</title>
</head>
<body>
<%=request.getParameter("test").toUpperCase()%>
</body>
</html>