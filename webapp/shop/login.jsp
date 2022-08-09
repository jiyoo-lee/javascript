<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 응용문제 : loginok.jsp로 post전송이며 아이디는 hong ㅐ패스워드는 hong1234입니다.
    	만약에 id 및 password가 아닐경우는 경고메세지alert 회원정보를 다시 확인하세요라는 문구와 함께 member_login.jsp로 다시 이동되게 하며
    	로그인이 되었을 경우는 index.jsp로 이동되도록합니다. -->
<meta charset="UTF-8">
<script>
	
	function login() {
		var id = document.getElementById("mid").value;
		var pw =  document.getElementById("mpass").value
		if(id == "" ||pw == "" ){
			alert("로그인 정보를 입력하세요");
			return false;
		}
		else {
				frm.submit();
			}
		}

</script>
<form name="frm" id="frm" method = "post" action="./loginok.jsp">
<div style ="width:1200px; height:500px; margin:0 auto;">
<table border="1" cellspacing = "0" cellpadding="0" align="center" style="margin-top:200px; width:500px; height: 200px;">
	<tr>
		<td style ="text-align: center">아이디</td>
		<td><input type="text" name="mid" id="mid" value="" style="width:300px; border:0 solid black;"></td>
	</tr>
		<tr>
		<td style ="text-align: center">패스워드</td>
		<td><input type="password" name="mpass" id = "mpass" value="" style="width:300px; border:0 solid black;"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" value="로그인" onclick="login();" style = "margin-left:200px;">
		</td>
	</tr>
</table>
</div>
</form>
