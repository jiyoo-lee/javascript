<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 참여자 저장파일</title>
</head>
<body>
<%@include file="DBconnector.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	String id = request.getParameter("id");
	
	//한번만 참여가 가능하도록 확인하는 작업
	String firstSql = "select * from poll where p_id='"+id+"'";
	PreparedStatement ps = null;
	try{
		ps = con.prepareStatement(firstSql);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next() == true){ %>
			<script>
				alert("이미 설문조사에 참여한 아이디입니다.");
				history.go(-1);
			</script>
	<%	}
		
	}catch(Exception e){
		e.getMessage();
	}
	
	ArrayList<String> list = new ArrayList<>();
	list.add(request.getParameter("name").replaceAll(" ",""));
	list.add(request.getParameter("id"));
	list.add(request.getParameter("tel"));
	String[] content = request.getParameterValues("poll");
	
	LocalDateTime datetime = LocalDateTime.now();
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String todayDateTime = datetime.format(dtf);

	String sql = "insert into poll values('0',?,?,?,?,'"+todayDateTime+"','0001-01-01 00:00:00')";
	
	PreparedStatement pi = con.prepareStatement(sql);
	pi.setString(1, list.get(0));
	pi.setString(2, list.get(1));
	pi.setString(3, list.get(2));
	pi.setString(4, content[0]);
	
	if(pi.executeUpdate() > 0){ %>
	<script>
		alert("참여해주셔서 감사합니다!");
		location.href = "./select2.jsp";
	</script>
	<% 
	}else{ %>
	<script>
		alert("데이터 통신오류 발생 잠시후 다시 시도해주세요");
		history.go(-1);
	</script>
	<%}
%>
</body>
</html>