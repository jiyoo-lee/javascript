<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login 확인</title>
</head>
<body>
<script>
<%
	String id = request.getParameter("mid").intern();
	String password = request.getParameter("mpass").intern();
	
	if(id == "hong" && password == "hong1234"){%>
		alert("로그인되었습니다.");
		location.href="./index.jsp";	
<% 		
	} else{ %>
		alert("로그인 정보를 다시 확인해주세요");
		location.href = "./member_login.jsp";
<% 		
	}
%>
</script>
</body>
</html>