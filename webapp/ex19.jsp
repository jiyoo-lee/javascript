<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Include,Forward 기능 차이 설명] JSP Include 형태이며 ex17_1.jsp와 연계됨</title>
</head>
<body>
<p>해당 페이지는 ex19.jsp페이지입니다.</p>
<jsp:include page = "./ex17_1.jsp" flush="true"></jsp:include>
<%--자신의 페이지에 있는 결과값 또는 html 코드도 출력하며, 외부 연결 페이지jsp도 출력함--%>
<%--
	flush - [false, true 차이]
	true : 외부파일로 제어가 이동할 때 지금까지 출력된 buffer에 저장 된 내용을 웹 브라우저에 출력하고 buffer 삭제)
	false : 외부파일에 사용되는 buffer를 지우지않음);
 --%>
<p>응답확인</p>
</body>
</html>