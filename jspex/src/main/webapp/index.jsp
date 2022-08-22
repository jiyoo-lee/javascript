<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자발송 시스템 구현</title>
<!-- 
 * sms 문자 구현하기 (유료 서비스)
SMS : short message service
LMS : long message service
MMS :  multiMedia message service
 -->
</head>
<%String no = "123456";%>
<body>
<form name="f" id="f" method="post" action="security.jsp">
<input type="hidden" name="method" value="2">
수신자 번호 : <input type="text" name="receivePhone"><br>
<input type="hidden" name="userDefine">
<input type="button" value="인증번호받기" onclick="ok()">
</form>
<script>
 	function ok() {
		f.submit();
	}
</script>
</body>
</html>