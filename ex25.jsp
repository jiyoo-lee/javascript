<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSP 5일차 내장객체 설명</title>
</head>
<body>
<%--내장객체: 자바 또는 import 또는 library를 사용하지 않고 사용하는 명령어들 
전달시 무조건 name 또는 get으로 보낼 경우 파라미터 이름으로 보내야 함
request.setCharacterEncoding("UTF-8");
request.getParameter("mid"); : 특정 name을 전달 받을 때 사용
request.getParameterValues(name); :특정 name 값을 전달 받지만 배열 형태로 받음(name값이 같을때)
request.getParameterNames() : 모든 name을 다 가져옴 (괄호안에 파라미터x) 단,  Enumeration (배열이 아닌 객체 타입 형태로 받음)
Enumeration em = request.getParameterNames(); 이런식으로 값을 받아야함(기본 자료형으로 값을 받을 수 없음)
request.getParameterMap() : Map 객체 타입으로 전달을 받는 형태 
[접속자 정보를 확인 경우]
 request.getHeader("host"); : 접속자에 대한 도메인 호스트 url 및 port 번호
request.getHeader("accept-language"); : 페이지 제작에 대한 언어패킷 확인
request.getHeader("User-Agent"); : 브라우저 접속 기기 확인할때 사용
request.getRemoteHost(); : 클라이언트 IP 주소 확인
request.getRemoteAddr(); : 
request.getRequestURI(); : 도메인 없이 URI경로 및 페이지명 출력 
request.getMethod(): servlet (service) 전송방식(GET,POST)

response.sendRedirect : 페이지 강제 이동
--%>
<%
	request.setCharacterEncoding("UTF-8");
	String a = request.getHeader("host");
	String b = request.getHeader("accept-language");
	String c = request.getHeader("User-Agent");
	String d = request.getRemoteAddr();
	String e = request.getRemoteHost();
	String f = request.getRequestURI();
	String g = request.getMethod();
	String h = request.getQueryString(); //파라미터 값을 추출
	response.sendRedirect("https://www.naver.com");
	
	/*내장 객체는 아님(import 사용해야함) - 본 서버에서 확인 가능합니다.*/
	InetAddress ia = InetAddress.getLocalHost();
	ia = InetAddress.getLocalHost();
	out.println(d);
	out.println(e);%><br>
<%
	out.println(ia);
	out.println(f);
	out.println(g+"<br>");
	out.println(h+"<br>");
%>
</body>
</html>