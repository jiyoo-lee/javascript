<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex24.jsp와 연계</title>
</head>
<%--<%@include file = "./ex24.jsp" %>--%>

<body>
<%
	String[][] fruits = {
						{"딸기","",""},
						{"청포도2kg","35000","10%"}
						};

	String fruit = request.getParameter("fruit").intern();

	for(int i = 0; i < fruits.length; i++){
	if(fruit == "딸기"){
		out.print("해당 상품은 판매 종료 된 상품입니다.");
		return;
	}else if (fruit == "포도"){
		request.setAttribute("title", "청포도 3kg");
		request.setAttribute("price", 35000);
		request.setAttribute("discount", "10%");
	}
	else{ %>
	<script>
		alert("상품명을 다시 확인해주세요.");
		history.go(-1);
	</script>
<% 		}
	}
%>
<p>상품명 : ${title}</p>
<p>가격 : ${price}</p>
<p>할인가 : ${discount}</p>

</body>
</html>