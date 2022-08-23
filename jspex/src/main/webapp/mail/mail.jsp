<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<form name="f" id="f" method="post" action="./mail3.jsp" enctype="application/x-www-form-urlencoded">
<div style="border-radius: 30px">
<ul style="list-style: none">
<li>
<p>CKeditor</p>
<input type="hidden" name="admin" value="jeeyu-lee@naver.com"><br>
메일주소(받는 분): <input type="text" name="postmail"><br><br>
메일 제목 : <input type="text" name="postsubject"><br><br>
메일 내용 : <textarea style= "col:60; row:10; width: 500px; height: 100px;" name="postmsg"></textarea><br>
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
