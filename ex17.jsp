<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 Action 태그 관련</title>
</head>
<body>
<%--JSP Action tag 비교 --%>

<%-- 설명 ***
JSP 태그 사용형태 : Server + Client 쪽에 명령을 적용 할 수 있음
<%@include %> 사용시 => 페이지 불러오기만 함(전송과 같은 동작은 x)  
<forward> 사용시 => 다른 페이지로 이동과 같은 페이지 흐름을 제어
<include> 사용시 => 외부 페이지의 내용을 포함하거나 페이지를 모듈화 함
 --%>

<%--<jsp:/> : jsp 액션태그 --%>
<%--<jsp:forward page ="ex17_1.jsp"/>--%>
<%-- JSP태그 열고(<) 닫기(/>)를 해야함 : forward : 17_1.jsp , 값을 가져옴--%>
<jsp:include page ="ex17_1.jsp" flush="false"/>
<p>테스트입니다.</p> 
</body>
</html>