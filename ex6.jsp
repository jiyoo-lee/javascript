<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - Select 응용 + 배열</title>
<style>
	.data:hover{
		background-color: lightgray;
	}

</style>
</head>
<body>
<% 
	int category = 4;
%>
<select>
	<option value="">[통신사를 선택하세요]</option>
	<%
		String ck = "";
		for(int c=1; c<=4; c++){
			if(category == c){
				ck = "selected";
			}
	%>
		<option value="<%=c%>" <%=ck%>>option<%=c%></option>
	<% 		
		}
	%>
</select>
<br><br>
<select>
	<option>[통신사를 선택하세요]</option>
<%	
		for(int c=1; c<=4; c++){ 
			
			if(category == c){
				out.print("<option value='"+c+"'selected>option" + c+"</option>");			
			}
			else{
				out.print("<option value='"+c+"'>option" + c+"</option>");	
			}
%>
<%
		}
%>
</select><br><br>
<!-- JSP 배열로 값을 선언 -->
	<%!
	//java 배열을 선언
		String[] data = {"홍길동","이순신","강감찬"};
	%>
	<%
		//java 배열 값을 가져와서 jsp 반복문으로 출력
		for(int i = 0; i < data.length; i++){			
			out.print("<span class ='data'>"+data[i]+"</span><br>");
		}
	%>

</body>
</html>