<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie 확인</title>
</head>
<body>
<%
	Cookie[] ck = request.getCookies();

	if(ck.length < 3 || ck[0].equals(null) || ck[1].equals(null)) {
		out.print("<script>alert('쿠키가 없습니다.'); location.href = 'js2.jsp';</script>");
	}
	else{
		out.print(ck[0].getValue()+"<br>"); 
		out.print(ck[1].getValue()+"<br>"); // 저장된 값 구하기
		out.print(ck[2].getName()+"<br>"); // 쿠키 이름
	}
%>
</body>
</html>