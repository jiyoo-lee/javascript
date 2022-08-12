<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 반복문 응용</title>
</head>
<body> <!-- jsp코드에 html코드를 넣지말것 -->
<table style = "width:400px; height:120px;" border="1">
<%
	for(int j = 0; j<4; j++){
%>
	<tr>
		<%
			for(int i =0; i < 4; i++){
		%>
		<td></td>
		<%
			}
		%>
	</tr>
<%
	}
%>
</table>


<table border="1">
	<%
		for(int a = 1; a<=8; a++){
	%>
	<%if(a%2 == 0) { %>
		<tr>
			<td style="width:300px; height:30px; background-color: blue;"></td>
		<%}else{ %>
			<td style="width:300px; height:30px;"></td>
		<%
		}%>
		</tr>
	<%
		}
	%>
</table>
</body>
</html>