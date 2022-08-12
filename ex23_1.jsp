<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex23.jsp와 연계 [추가 데이터 출력 파트]</title>
</head>
<body>
<%
	String pName = request.getParameter("person").intern();
	if(pName == "강감찬"){
		int point = 53000;
		String coupon = "15%";
		request.setAttribute("point", point);
		request.setAttribute("coupon", coupon);
		
	}else{
		out.print("ERROR --- !");
	}
%>
<p>현재 적립금 : ${point}</p>
<p>회원등급 할인 쿠폰 : ${coupon}</p>
</body>
</html>