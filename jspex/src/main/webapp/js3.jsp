<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 정규식 코드(JavaScript에서 사용)</title>
<script>

	function abc() {
		var z = document.getElementById("mid").value;
		
		//var code = /java/i;	
// 		var code = new RegExp("java","i"); // = var code = /java/i;	 같은 말
		// java / i -> i : 문자열 전체를 확인(대소문자 관계없이 사용)
		//var ck = code.exec(z); 	//exec : 정규식 코드에 대한 데이터 리스트 보여줌
		
		//a-z(소문자a부터 z까지) A-Z까지 0-9까지 사용
		//응용문제 : 숫자만 입력 받야할 경우 
// 		var code = /[a-z]/i; // = /[a-z|A-Z]/
// 		var code = /[a-z|A-Z]/;
		//var code = /[^0-9]/ //^(not)
		//console.log(code.test(z)); //true or false 
		
		/* 한글만 입력 받아야 할 경우 */
		//var code = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //[]배열 범위
		
		/* 입력값 패턴 별 확인사항 (-기호 없이 숫자만)*/
// 		var code = /^[0-9]\d{9}/;	//{}입력 범위 패턴 형태
// 		console.log(code.test(z));	//
		
		/* 특수 문자 조합(아이디)*/
// 		var code  = /[a-z|A-Z|0-9\\d_-]/g; 
// 		//g문자열 전체를 말함 \\d 특수문자와 함께 사용한다는 뜻
// 		var ck = z.match(code);
// 		//match : 해당 사용자값이 모두 정규식 코드 안에 있을 경우 배열로 생성됨
// 		//
// 		if(z.length != ck.length){
// 			alert("올바른 아이디 형식이 아닙니다. (특수문자는 -_ 만 사용가능)");
// 		}
// 		else{
// 			alert("확인이 되었습니다.");
// 		}
		
		
		/* 특수문자 2개 포함(패스워드)*/
		var code2 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
		if(code2.test(z) == true){
			alert("올바른 패스워드 형식이 아닙니다.");
		}
		else {
			var code = /[^a-zA-Z0-9ㄱ-ㅎ가-힣ㅏ-ㅣ]/g;
			var ck = z.match(code);
			if(ck != null){
				if(ck.length < 2 ){
					alert("패스워드는 특수문자가 2자 이상 포함되어야합니다.");
				}
			}
			else{
				alert("패스워드는 특수문자가 2자 이상 포함되어야합니다.");
			}
		}
	}
	
	//정규식 코드 문법
	// match, test, exec, replaceAll, split
	// 
	
</script>
</head>
<body>
<input type="text" id="mid" maxlength="11">
<input type="button" value="확인" onclick="abc();">
</body>
</html>