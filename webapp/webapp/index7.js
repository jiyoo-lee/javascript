	function login() {
		var a = document.getElementById("usernm").value;
		var b = document.getElementById("userpw").value;
		if(a == "" || b == ""){
			alert("내용을 입력해주세요.");
		}
		else {
			ajax(a,b);
		}
	}
	
	function ajax(id,pw) {
		let aj;
		function wck(){
			if(window.XMLHttpRequest){
				return new XMLHttpRequest();
				
			}
		}
		
		function datacheck(){
			if(aj.readyState == XMLHttpRequest.DONE && aj.status == 200) {
				if(this.response == "login"){
					alert("로그인 되었습니다.");
				}
				else if (this.response == "error") {
					alert("회원정보를 다시 확인하세요.");
				}
			}
		}
		
		var postdata = "usernm=" + id + "&userpw=" + pw;
		aj = wck();
		aj.onreadystatechange = datacheck;
		aj.open("POST","./index7.do",true);
		aj.setRequestHeader("content-type","application/x-www-form-urlencoded");
		aj.send(postdata);
	
		
	}
