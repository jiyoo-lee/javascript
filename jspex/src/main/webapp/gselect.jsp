<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
 <%@ include file ="./db.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
//left로 Table 2개를 join 한 상태
	String sql = "select a.id, a.writer, a.title, a.recommend, a.indatetime, b.file_url, count(b.gallery_id) count " 
				+"from gallery a left join gallery_img b "
				+"on a.id = b.gallery_id group by a.id,b.gallery_id order by a.indatetime desc";
	PreparedStatement ps = null;
	ResultSet rs = null;
	List<Map<String,Object>> al = null;
	try{
		ps = con.prepareStatement(sql);		
		rs = ps.executeQuery();
		al = new ArrayList<>();
		
		while(rs.next()){
			Map<String,Object> mp = new HashMap<>();
			mp.put("writer", rs.getString("a.writer"));
			mp.put("title", rs.getString("a.title"));
			mp.put("recommend", rs.getString("a.recommend"));
			mp.put("indatetime", rs.getString("a.indatetime").substring(0,10));
			mp.put("img", rs.getString("b.file_url"));
			mp.put("count", rs.getString("count"));
			
			al.add(mp);
		}
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>