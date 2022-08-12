<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--jsp3일차 ajax2.jsp와 연동 --%>
    <%
	String key = request.getParameter("apikey").intern();
	if(key == "abc123"){
	String[][] weather = {
							{"a1","250"},	
							{"a2","118"},
							{"a3","300"},
							{"a4","185"},
							{"a5","200"},
							{"a6","180"}
						};
	//DB 또는 ARRAY를 파싱하는 작업 (Parsing: 데이터를 배열로 만드는 작업 Parser: 파싱된 배열을 인식시켜서 출력시키는 작업)
		JSONArray ja = new JSONArray();
		int w = 0;
		while(w < weather.length){
			JSONObject jo = new JSONObject();
			jo.put("area",weather[w][0]);
			jo.put("areanum",weather[w][1]);
			ja.add(jo);
			w++;
		}
	
		out.print(ja);	//최종 배열 값을 보내는 형태
	}
	else{
		JSONObject jo2 = new JSONObject();
		jo2.put("data","error");
		out.print(jo2);
	}
%>