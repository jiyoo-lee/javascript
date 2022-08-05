package faqs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	
	public Connection connection() throws ClassNotFoundException, SQLException{
		
		String driver = "com.mysql.jdbc.Driver";
//		String url = "jdbc:mysql://localhost:3306/jeeyulee"; 	//cafe24 올리기
		String url = "jdbc:mysql://umj7-009.cafe24.com/jeeyulee";  //test
		String user = "jeeyulee";
		String password = "jeeyu9400";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url,user,password);
		
		return con;
	}
	
	public Connection cafe24() throws ClassNotFoundException, SQLException{
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jeeyulee"; 	//cafe24 올리기
//		String url = "jdbc:mysql://umj7-009.cafe24.com/jeeyulee";  //test
		String user = "jeeyulee";
		String password = "jeeyu9400";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url,user,password);
		
		return con;
	}
	
	public Connection kbsn() throws ClassNotFoundException, SQLException{
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://kbsn.or.kr:3306/classb"; 	//kbs(선생님 데이터베이스 접근 주소)
//		String url = "jdbc:mysql://umj7-009.cafe24.com/jeeyulee";  //test
		String user = "jeeyulee";
		String password = "jeeyu9400";
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url,user,password);
		
		return con;
	}

}
