<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Serializable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - JAVA + JSP</title>
<%! //JAVA 코드(class,method) - Model 
	public class abc{
		String a = "홍길동";
		String b = "이순신";
		String zz = null;
		
		public ArrayList<String> getter(){
			ArrayList<String> arr = new ArrayList<>();
			arr.add(a);
			arr.add(b);
			return arr;
		}
		public void setter(String z){	
			//setter에 값을 적용 후 전산처리/산술처리 완료되면 this로 값을 보냄 
			this.zz = z;				
		}
		public String getter2(){
			//JSP에 출력 역할
			return this.zz;
		}
	}
%>
<%
//JSP에서 JAVA를 로드
abc aa = new abc(); //Controller 
ArrayList<String> result = aa.getter();
request.setAttribute("result", result);
aa.setter("유관순");
String name2 = aa.getter2();
%>	
</head>

<%--View--%>
<body>
고객명: <%=result.get(0)%> <%=result.get(1)%><br>
고객명: ${result.get(0)} ${result.get(1)}<br>
리턴값 이름 : <%=name2%><br>
<%--응용문제 : 고객명에 홍길동,이순신 출력이 되도록 코드를 작성하시오 배열값으로 jsp로 전달--%>
</body>
</html>