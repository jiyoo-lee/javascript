<%@page import="faqs.ex23"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 JAVA Load 파일</title>
</head>
<body>
<%-- 
	권장사항은 아님: 기본 지식정도로 알고있으면 된다. 
	단점은 속도가 매우 떨어짐
// 	ex23 ex = new ex23();
// 	ex.inName();
 --%>
<%-- userBean : 자바파일에 대한 class를 로드할 때 사용하는 jsp태그입니다. --%>
<jsp:useBean id="abc" class="faqs.ex23" scope="request">
<%--<%abc.inName();--%>
<%
abc.innerName("강감찬", "골드회원");
request.setCharacterEncoding("UTF-8");
%>
</jsp:useBean>
<p>고객명 : <%=abc.names()%></p>
<p>고객등급 : <%=abc.levels()%></p>
<jsp:include page = "./ex23_1.jsp">
<jsp:param value="<%=abc.names()%>" name="person"/>
</jsp:include>
</body>
</html>