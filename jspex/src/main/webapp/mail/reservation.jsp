<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펜션 예약 등록 시스템</title>
</head>
<body>
<p>펜션 예약 등록 시스템</p>
<form name="frm" id="frm" enctype="application/x-www-form-urlencoded">
고객명 <input type="text" value="홍길동" name="name"><br>
연락처 <input type="text" value="010-1234-5678" name="phoneNumber"><br>
이메일 <input type="text" value="hong@nate.com" name="eamil"><br>
예약번호 <input type="text" value="12345-678910" name="reservationNum"><br>
<input type= "button" value="입금하기" onclick="deposit()">
</form>
</body>
<script>
	function deposit() {
		frm.method ="POST";
		frm.enctype = "application/x-www-form-urlencoded";
		frm.action = "./reservation";
		frm.submit();
	}
</script>
</html>