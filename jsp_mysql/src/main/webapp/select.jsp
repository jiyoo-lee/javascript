<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4일차 SQL 연동 select</title>
</head>
<body>
<%-- DB접속환경을 로드함 --%>
<%@include file="DBconnector.jsp"%>
<%
	String sql = "select * from poll";	//SQL 문법
	try{
		//PreparedStatement : SQL 문법을 실행 시키는 class
		PreparedStatement ps = con.prepareStatement(sql);
		//select에서만 ResultSet 씀 : 모든 값을 받아서 처리하는 클래스
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){	//SQL에 있는 데이터를 반복시킴
			//getString : 문자
			//getInt : 숫자
			//getBoolean : true or false 밖에 없음
			//getfloat etc
%>		
			<ul>
				<li>고유번호 : <%=rs.getString("p_idx") %></li>
				<li>고객명 : <%=rs.getString("p_name") %></li>
				<li>고객 아이디 : <%=rs.getString("p_id") %></li>
				<li>고객 연락처 : <%=rs.getString("p_tel") %></li>
				<li>설문조사 내용 : <%=rs.getString("p_content") %></li>
				<li>설문조사 참여일자 : <%=rs.getString("p_indate").substring(0,19)%></li>
			</ul>			
<% 
		}		
	}catch(Exception e){
		out.print("DB 연결 실패 및 테이블 오류 !!");	
	}finally{	//DB 연결 및 출력 모두 완료되면 접속 해제 
		if(con!=null){
			con.close();
		}
	}
%>
</body>
</html>