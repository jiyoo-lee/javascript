<%@page import="java.security.AlgorithmConstraints"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4일차 SQL 연동 select2</title>
</head>
<body>
<%-- DB접속환경을 로드함 --%>
<%@include file="DBconnector.jsp"%>
<%
	ArrayList <Map<String,Object>> al = new ArrayList<>();
	String sql = "select * from poll order by p_indate desc";	
	try{
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	
		while(rs.next()){	
			Map<String,Object> mp = new HashMap<>();
			
			mp.put("p_idx", rs.getString("p_idx"));
			mp.put("p_name", rs.getString("p_name"));
			mp.put("p_id", rs.getString("p_id"));
			mp.put("p_tel", rs.getString("p_tel"));
			mp.put("p_content", rs.getString("p_content"));
			mp.put("p_indate", rs.getString("p_indate").substring(0,19));
			al.add(mp);
		}		
	}catch(Exception e){
		out.print("DB 연결 실패 및 테이블 오류 !!");	
	}finally{	
		if(con!=null){
			con.close();
		}
	}
%>
<%
	int w = 0;
	while(w <al.size()){
		//jsp tag 사용 이유는 설문조사 0~4 내용 확인이 안됨 
		// switch.jsp에서 사용자가 어떤 내용에 대한 설문조사를 응하였는지 확인하는 사항
%>
		<jsp:include page = "switch.jsp">
		<jsp:param value='<%=al.get(w).get("p_content")%>' name="cate"/>
		</jsp:include>
		<%	//setattribute로 생성된 가변수명을 getAttribute로 받아서 처리 또는 ${msg} 액션태그로 바로 출력 가능
			//String msg = (String)request.getAttribute("msg");
		%>
	<ul>
		<li>고유값 : <%=al.get(w).get("p_idx")%></li>
		<li>고객명 :<%=al.get(w).get("p_name")%> </li>
		<li>고객 아이디 :<%=al.get(w).get("p_id")%> </li>
		<li>고객 연락처 : <%=al.get(w).get("p_tel")%></li>
		<li>설문조사 내용 : ${msg}</li>
		<li>설문조사 참여일자 : <%=al.get(w).get("p_indate")%></li>
	</ul>
<%
		w++;
	}
%>	
</body>
</html>