<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPA 응용</title>
</head>
<body>
<!--사용자가 숫자 1부터9까지 선택합니다. 해당 숫자를 선택 후 전송 버튼을 클릭시 해당 숫자에 맞는 구구단을 출력하시오 -->
<%
	request.setCharacterEncoding("UTF-8");
	String gu = request.getParameter("gugu");
	if(gu != null ){ %>
		<table border ="1">
		<%
			int g = Integer.parseInt(gu);
			for(int i = 1; i <= 9; i++){
		%>
			<tr>
				<td width = "100px"; height = "30px";><%=g%> *<%=i%> = <%=g*i%></td>
			</tr>
			<% 
				} %>
		</table>
		<%	}
else{ %>
<form name="frm" id="frm" method="post" action="./ex9.jsp">
<select name="gugu">
	<option value="2">2단</option>
	<option value="3">3단</option>
	<option value="4">4단</option>
	<option value="5">5단</option>
	<option value="6">6단</option>
	<option value="7">7단</option>
	<option value="8">8단</option>
	<option value="9">9단</option>
</select>
<input type ="submit" value="전송">
</form>
<% } %>
</body>
</html>