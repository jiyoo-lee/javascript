package review;

import java.sql.*;

public class dbconnector {

	protected Connection connection() throws ClassNotFoundException, SQLException{
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jeeyulee";
		String user = "jeeyulee";
		String password = "jeeyu9400";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url,user,password);
		
		return con;
	}
}
