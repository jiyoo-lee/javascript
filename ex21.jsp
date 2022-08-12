<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 Include 전송(값 전송)</title>
</head>
<body>
<%--include : post 형식
1.ex21에서 mid,mname,c값 보냅니다 -> ex21_1.jsp
2. ex21_1.jsp에서 c값만 변경 -> ex21_2.jsp
3. ex21_2.jsp에서 최종 결과값을 출력 + ex21.jsp 추가 결과값을 받을 수 있도록 d라는 매개변수를 추가하여 전달함
4. ex21.jsp에서는 ex21_2.jsp에서 추가된 매개변수를 출력하게 됨 --%>
<%
request.setCharacterEncoding("UTF-8");
%>
<h1>[회원정보확인]</h1>
<font style="color: blue;"><b>페이지 순서: ex21.jsp -> ex21_1.jsp -> ex21_2.jsp</b></font><br><br>
<jsp:include page="./ex21_1.jsp" flush="false">
<jsp:param value="lee" name="mid"/>
<jsp:param value="이순신" name="mname"/>
<jsp:param value="test2" name="c"/>
</jsp:include>
<%@include file="./ex21_2.jsp"%> <%--최종 결과 확인을 위해서 로드를 하게 됨 --%>
<%
out.print(d); 
%>
</body>
</html>