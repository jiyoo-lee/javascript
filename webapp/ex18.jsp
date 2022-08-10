<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Include,Forward 기능 차이 설명] JSP Forward 형태이며 ex17_1.jsp와 연계됨</title>
</head>
<body>
<p>해당 페이지는 ex18.jsp페이지입니다.</p>
<jsp:forward page = "./ex17_1.jsp"></jsp:forward>
<%--자신의 페이지에 있는 결과값 또는 html 코드 등이 출력되지 않음--%>
<p>응답확인</p>
</body>
</html>