<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //외부 통신을 위해 쓰는 JSP
response.addHeader("Access-Control-Allow-Origin","*");
response.addHeader("Access-Control-Allow-Credentials", "true");
//response.addHeader : .bashrc(서버) 입력하게 되어있음
//JSP에 코드를 입력해서 Access-Control-Allow 이용해서 허락을 적용함

//a 서버에서 자신의 서버로 접속시 허락 된 파라미터 값과 이름을 확인
String aa = request.getParameter("apikey").intern();
//확인이 되면 배열 값 전송
if(aa =="aaaa"){
	String[][] arr = {
						{"lee","이지유"},
						{"park","박찬호"}
					};
	
	JSONArray ar = new JSONArray(); 	//JSONArray는 각각의 배열로 만들어진 데이터를 그룹화[]하여 값을 저장하는 클래스 
	for(int k = 0; k<arr.length; k++){
		JSONObject js = new JSONObject();
		js.put("mid",arr[k][0]);
		js.put("mname",arr[k][1]);
		ar.add(js);
	}
	out.print(ar);
	}
%>