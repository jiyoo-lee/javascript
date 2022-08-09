<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //외부 통신을 위해 쓰는 JSP
response.addHeader("Access-Control-Allow-Origin","*");
response.addHeader("Access-Control-Allow-Credentials", "true");

String aa = request.getParameter("apikey").intern();
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