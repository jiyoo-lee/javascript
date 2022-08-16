<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 : [session]</title>
</head>
<body>
<!-- 
session,cookie 사용 이유 : client에 대한 정보를 저장하여 서버와 통신하며 페이지 이동시 지속적으로 사용 가능하도록 하는 객체 
※ chrome에서 session,cookie 저장되더라도 edge에서는 새로 등록해야 함

ㆍ기본개념
session : client 입력 정보 -> 서버에 저장 -> 브라우저에 저장
cookie  : 서버에서 생성하여 client에 저장되어 사용 됨 

ㆍ사용용도
예제) session : 로그인, 메일발송에 대한 정보, 결제정보
cookie : 팝업, 접속자 PC정보 

ㆍ단점
session : 여러 서버에서 공유를 할 수 없다.  (JavaScript는 session이 없고 JSP에만 있음)
cookie : 정보 노출이 우려 됨 (정보 보안이 session보다 취약함) (JavaScript, JSP)

-->
<a href="js1_1.jsp">session 생성</a>
<a href="js1_2.jsp">session 확인</a>
<a href="js1_3.jsp">session 삭제</a>
</body>
</html>