<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex21.jsp 값 전달 받음</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String mid =request.getParameter("mid");
	String mname =request.getParameter("mname");
	String c = "test";
%>
아이디: <%=mid%><br>
고객명: <%=mname%><br>
데이터 추가 : <%=c%><b> ←ex21_1.jsp에서 변경된 값</b><br>
<jsp:include page="./ex21_2.jsp"></jsp:include>
</body>
</html>