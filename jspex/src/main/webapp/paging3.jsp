<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./gselect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 8일차 갤러리보드 + DB Join</title>
</head>

<body>
<table border="1" cellspacing="0"; cellpadding="0";>
	<thead>
	<tr bgcolor="#ccc" style="text-align: center;">
		<td width="80">번호</td>
		<td width="200">이미지</td>
		<td width="300" >제목</td>
		<td width="100">글쓴이</td>
		<td width="80">추천수</td>
		<td width="80">첨부파일</td>
		<td width="150">등록일자</td>
	</tr>
	</thead>
	<tbody>
		<%int w = 0;
		 String nonImage = "";
		 //이미지일 경우
		while(w < al.size()){
			if(al.get(w).get("img") == null || al.get(w).get("img") == ""){
				nonImage = "<img src='./img/noimg.png' style='width:200px; height: auto;'>";
			}
			else{
				nonImage = "<img src="+(String)al.get(w).get("img")+">";
			}
		%>
		<tr style="text-align: center; height: 50px;">
			<td><%=al.size()-w%></td>
			<td><%=nonImage%></td>
			<td style="text-align: left;"><%=al.get(w).get("title") %></td>
			<td><%=al.get(w).get("writer") %></td>
			<td><%=al.get(w).get("recommend") %></td>
			<td><%=al.get(w).get("count") %></td>
			<td><%=al.get(w).get("indatetime") %></td>
		</tr>
		<%
		w++;
		} 
		%>
	</tbody>
</table>

<ol style="list-style: none; margin:0; padding:0;">
	<li style=" display: inline-block; border:1px solid black; width: 30px; height: 30px; line-height: 30px; text-align: center;">1</li>
</ol>
<div>
<form name="search" method="get" action="./paging3.jsp" enctype="application/x-www-form-urlencoded">
<input type="text" name="writer" placeholder="작성자 이름을 입력하세요.">
<input type="submit" value="검 색">
<input type="button" value="목록으로" onclick="showlist();">
</form>
</div>
</body>
<script>
	function showlist() {
		location.href = "./paging3.jsp";
	}

</script>
</html>