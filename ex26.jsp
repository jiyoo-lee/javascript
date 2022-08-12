<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page buffer="8kb" autoFlush = "false"%>
    <%@page isThreadSafe = "true"%>
    <%-- 글자 한개당 1byte --%>
    <%--buffer : page load시 읽어들이는 메모리 사용량 제한 --%>
    <%--autoflush : true(메모리를 비우고 다시 페이지를 로드하는것)
    				false(메모리를 비우지않음)
    isThreadSafe : 기본값 false이며 true(멀티스레드를 사용함)
    true 사용을 권장 pourquoi ? => 폼데이터 처리시 다중처리 속도를 높이기 위해서 사용  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4일차 Buffer 사용법 + Thread</title>
</head>
<body>
<%=out.getBufferSize()%>byte
<% for (int a = 1; a<=100; a++){
	out.println(a);	
}
%>
</body>
</html>