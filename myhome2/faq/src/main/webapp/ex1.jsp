<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차</title>
</head>
<body>
<!-- 주석 : <%-- --%>-->
<%--<%!......%> 자바 변수나 메서드 정의할때 사용 --%>
<%--<%=...%>해당 값을 출력하는 문자열, 숫자 등 사용합니다. --%>
<%--<%@...%>페이지 속성지정 & 외부 페이지를 로드 할 수 있음. --%>

<%@ include file = "ex2.jsp"%>
<!-- JAVA 문법 -->
<%! 
	int a;
	int b;
	public int sum(int aa, int bb){
		return aa+bb;
	}
%>
<!-- JSP -->
<%
	a = 20;
	b = 10;
	out.print(sum(a,b)); 	//OUT.PRINT JSP 출력 파트
%>
<!-- JSP 문법만 사용 -->

<ul>
<%for(int i = 0; i < 10; i++){ %>
 <li><%out.print(i);%></li>
<% } %>
</ul>
</body>
</html>