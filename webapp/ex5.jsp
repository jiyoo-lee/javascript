<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 SWITCH 선택문 </title>
</head>
<body>
<%
	String level ="3";
	String msg = "";
	switch(level){
	case "1":
		msg = "일반회원";
		break;
	case "2":
		msg = "실버회원";
		break;
	case "3":
		msg = "골드회원";
		break;
	default:
		msg = "비가입회원";
		break;
	}
%>
<%
	String[] arr = {"무통장입금","신용카드","도서상품권","휴대폰결제"};
	for(int i = 0; i < arr.length; i++){
		switch(arr[i]){
		case "무통장입금": 
			break;
		case "신용카드":
			break;
		case "도서상품권":
			break;
		case "휴대폰결제":
			break;
		}%>
		<input type ="radio" name="check"><%=arr[i]%>
	<%}%>
	<br><br>
<input type = "text" value="<%=msg%>" readOnly>
<!-- 응용문제 : 반복문 +switch-->
</body>
</html>