<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- contentType="text/html; charset=UTF-8 : HTML에서 JSP 페이지를 적용할때 코드라인을 사용하지 않아도 무방함
    text/html : html JSP 출력
    text/xml : xml로 변환
    text/plain : 코드 전부 출력됨-->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 기본문법 반복문1</title>
<script>

function checkAll() {
	if(document.getElementById("all").checked == true){
		for(var i=0; i<=5; i++){
			document.getElementsByName("box")[i].checked = true;	
		}
	}
	else {
		for(var i=0; i<=5; i++){
			document.getElementsByName("box")[i].checked = false;	
		}
	}
}
</script>
</head>
<body>

<input type="checkbox" name="all" id="all" onclick = "checkAll();">전체선택<br>
<%
	int i = 1;
	while(i<=6){
%>
<input type="checkbox" name="box" id="box<%=i%>">체크<%=i %><br>
<%
	i++;
	}
%>
<br><br>
	<select>
	<option value="메뉴를 선택해주세요."></option>
	<%
		int w = 0;
		do{
	%>
		<option value ="<%=w%>">메뉴<%=w%></option>
	<%
		w++;
		}while(w < 6);
	%>
	</select>
</body>
</html>