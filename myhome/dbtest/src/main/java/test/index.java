package test;

import java.io.IOException;
import java.net.ConnectException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;


public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public index() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	//Connection getConnection : SQL 연결되는 메소드 이름 (무조건 return 자료형 method)
	public static Connection getConnection() throws ClassNotFoundException, SQLException, ConnectException {
		
		/* DB 접속 정보*/
		String dbconnect = "com.mysql.jdbc.Driver";
		//com.mysql.jdbc.Driver(5~6번대 버전) OR com.mysql.cj.jdbc.Driver(8번대 버전) ->Spring에서 사용
		String dburl = "jdbc:mysql://localhost:3306/webmail";	//localhost(서버주소):3306(mysql port)/데이터베이스 이름
		String dbuser = "hong";	//사용자 DB접속 ID
		String dbpass = "a123456";	//사용자 DB접속 패스워드
		
		
		Class.forName(dbconnect); //해당 정보를 class 로드 함
		Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
		//DriverManager.getConnection(연결주소,사용자 아이디, 사용자패스워드);
		return con;	//return 필수
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Connection con = getConnection();
			System.out.println("연결성공");
			String sql = "select * from shopmember";
			
			//con.createStatement() : 실무에서 사용안함
			PreparedStatement ps = con.prepareStatement(sql);
			//preparedStatement를 사용하는 이유는? 데이터베이스 효율성을 높이기 위해서 사용함.
			
			ResultSet rs = ps.executeQuery();
			//excuteQuery , ResultSet : select문에서만 사용함.
	
			int a = 0;
			while(rs.next()) { //next는 database 전체 리스트 값을 말합니다.
				String user = rs.getString("suser");	//getString : 컬럼명을 사용
				String pass = rs.getString("spassword");
				System.out.println(user);
				System.out.println(pass);
			}
			
		}catch (Exception e) {
			System.out.println("연결실패");
		}
	}

}
