<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@tag import="java.sql.*"%>
<%
	Connection con = null;
	try{
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://umj7-009.cafe24.com/jeeyulee";
		String user ="jeeyulee";
		String password = "jeeyu9400";
		
		Class.forName(driver);
		con = DriverManager.getConnection(url,user,password);
		out.print("<script>alert('데이터 접속 성공!');</script>");
		
		String sql = "select * from poll order by p_idx desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){
			out.print(rs.getString("p_id")+"<br>");			
		}
	}catch(Exception e){
		out.print("<script>alert('데이터 접속 오류');</script>");
	}
%>