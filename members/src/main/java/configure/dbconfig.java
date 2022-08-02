package configure;

import java.sql.*;

public class dbconfig { //SQL 환경설정
	
	protected Connection dbcon() throws ClassNotFoundException, SQLException {
		
		String dbdriver = "com.mysql.jdbc.Driver";
		String dburl = "jdbc:mysql://localhost:3306/webmail";
		String dbuser = "hong";
		String dbpass = "a123456";
		
		Class.forName(dbdriver);  //Class.forName : JDBC 클래스 로드명 
		Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
		
		return con;
	}
}
