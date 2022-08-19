<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./loginSession.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <script src="./js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/basic.css">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=1">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
</head>
<script>
	$(function() {
		$("#admin_add").click(function() {
				location.href="./add_master.html";
		});
		
		$("#login").click(function() {
			var $id = $("#adminId").val();
			var $password = $("#adminPassword").val();
			if($id == "" || $password == ""){
				alert("아이디 혹은 패스워드를 확인하시기 바랍니다.")
			}
			else{
				frm.method ="POST";
				frm.enctype = "application/x-www-form-urlencoded";
				frm.action = "./login.do";
				frm.submit();
			}
		})
		
	});
</script>
<body>
 <form name="frm" id="frm">
    <header class="admin_title">
        <p><img src="./img/logo.png" class="logo_sm"> ADMINISTRATOR</p>
    </header>
    <section class="admin_bgcolor">
        <div class="admin_login">
            <span>
                <div class="left_div">
                <ul>
                <li><input type="text" class="input_text1" id="adminId" name="adminId" placeholder="관리자 아이디를 입력하세요"></li>
                <li><input type="password" class="input_text1" id="adminPassword" name="adminPassword" placeholder="관리자 패스워드를 입력하세요"></li>
                </ul>
                </div>
                <div class="right_div">
                    <button type="submit" class="btn_submit" id="login" name="login" title="MASTER LOGIN">MASTER LOGIN</button>
                </div>
                <em class="alert_msg">※ 본 사이트는 관리자 외에는 접근을 금합니다. 페이지 접근에 대한 접속 정보는 모두 기록 됩니다.</em>
            </span>
            <span>
                <ol class="admin_info">
                    <li title="신규 관리자 등록요청" id="admin_add">신규 관리자 등록요청</li>
                    <li title="아이디/패스워드 찾기">아이디/패스워드 찾기</li>
                </ol>                
            </span>
        </div>
    </section>
    <footer class="admin_copy_login">
        <div>
            Copyright ⓒ 2022 webshopping All rights reserved.
        </div>
    </footer>
    </form>
</body>
</html>