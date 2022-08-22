<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<form name="f" id="f" method="post" action="./mailto.jsp" enctype="application/x-www-form-urlencoded">
<div>
<ul style="list-style: none">
<li>
<input type="hidden" name="admin" value="bb332256@gmail.com"><br>
메일주소(받는 분): <input type="text" name="postmail"><br>
메일 제목 : <input type="text" name="postsubject"><br>
메일 내용 : <textarea style= "col:60 row:10" name="postmsg"></textarea><br>
<input type = "button" value="메일전송" onclick = "ok()">
</li>
</ul>
</div>
</form>
<script>
	function ok() {
		f.submit();
	}

</script>
