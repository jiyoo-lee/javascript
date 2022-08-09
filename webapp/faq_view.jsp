<%@ page language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv ="X-UA-compatible" content = "IE = edge, chrome = 1">
<meta name ="viewport" content = "width=device-width, initial-scale=1.0">
<title>[FAQ] 관리자 페이지</title>
<script>

	function show() {
			location.href = "./faq_list.html";
		}
	
	function cancel() {
		if(confirm("정말 작성을 취소하시겠습니까?")){
			document.getElementById("question").value ="";
			document.getElementById("answer").value ="";
			alert("작성이 취소되었습니다.");
		}
	}
	
	function complete() {
		var question = document.getElementById("question").value;
		var answer = document.getElementById("answer").value;
		var select = document.getElementById("select").value;
		if(question == "" || question == null || answer == "" || answer == null || select == "not"){
			alert("모든 사항을 입력 및 카테고리 선택을 하시기바랍니다.");
		}
		else{
			f.method = "POST";
			f.action = "./faq_updateok.do";
			f.enctype = "application/x-www-form-urlencoded";
			f.submit();
		}		
	}
	
	
	function del_faq() { //데이터 삭제 페이지 연결
		
		if(confirm("해당 내용을 삭제하시겠습니까? 데이터 삭제시 복구 되지않습니다.")){
			var uri = window.location.search;
			var idx = uri.split("?idx=");
			location.href= "./del_faq.do?idx=" + idx[1];
		}
	}

</script>
<style>

 .write_div{
 
 	border: 2px solid gray;
 	width: 800px;
 	height: 600px;
 	text-align: center;
 }
 

</style>
</head>
<body>
<div class="write_div">
<form name="f" id ="f">
<input type ="hidden" name ="fidx" value="<%=request.getAttribute("f_idx")%>">
<p><b>[FAQ 기입]</b></p> <!-- request.getAttribute : Enumeration(자료형) -->
<%
String category = (String)request.getAttribute("f_category");
	String cate1 = "";
	String cate2 = "";
	String cate3 = "";
	String cate4 = "";
switch(category) {
	
	case "shipping":
	 	cate1 ="selected";
		break;
	
	case "exchange/refund" :
		cate2 = "selected";
		break;
	
	case "service":
		cate3 = "selected";
		break;
	
	case "safe":
		cate4 = "selected";
		break;
}
%>
카테고리 <select id = "select" name="select">
			<option value ="not">카테고리를 선택하세요.</option>
			<option value="shipping" <%=cate1%>>배송문의</option>
			<option value="exchange/refund" <%=cate2%>>반품/교환/환불</option>
			<option value="service" <%=cate3%>>회원서비스</option>
			<option value="safe" <%=cate4%>>안전거래</option>
		</select>
		<% 
		String ck = (String)request.getAttribute("f_print");
		String check = "";
		if(ck.equals("Y")){
			check = "checked";
		}
		%>
<label><input type ="checkbox" name="f_print" value="Y" checked = "checked">리스트 출력여부</label>		
		<br><br>
글쓴이 <%=request.getAttribute("f_writer") %><br><br>
질문내용 <input type ="text" name="question" id="question" style= "width: 350px;" value="<%=request.getAttribute("f_question")%>"><br><br>
답변내용<br>
<textarea name="answer" id="answer" style=" cols: 100; rows:10; width: 500px; height:300px; resize : none;">
<%=request.getAttribute("f_answer")%></textarea><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="button" value ="FAQ 삭제" onclick="del_faq();">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="button" value ="리스트" onclick="show();">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="button" value ="수정완료" onclick="complete();">
</form>
</div>
</body>
</html>