<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 생성</title>
</head>
<body>
<%
// 	request.setAttribute(name, o);
// 	request.getAttribute(name);
	
	//requset로 값을 가져왔다는 전제
	String user = "hong";
	String email = "hong@nate.com";
	int level = 4;

	//값을 주고 받기위한 속성 설정
	session.setAttribute("mid", user);
	session.setAttribute("mail", email);
	session.setAttribute("lv", level);
	
	
	long last = session.getLastAccessedTime();// 세션 유지 시간
	long create = session.getCreationTime(); //세션 생성시간
	long user_time = (last-create) / 60000; //세션 경과시간
	
	out.print(create+"<br>");
	out.print(last+"<br>");
	out.print(user_time);
	
	//자동로그인
	//MaxInactiveInterval() : 기본 값 1800 -> 30분
	//session.setMaxInactiveInterval(-1) : -1을 쓰게되면 무한으로 지정 할 수 있음
	//session.setMaxInactiveInterval(0) : 시간 자체 소멸
	session.setMaxInactiveInterval(60*60); // 최대시간을 조정함 (1시간)
	int time = session.getMaxInactiveInterval();	//기본 30분동안 session 사용
	//out.print(time);
%>
</body>
</html>