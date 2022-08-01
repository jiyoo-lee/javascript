package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

public class index2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public index2() {
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* DB connect 부분은 별도 java를 생성하여 지속적으로 로드할 수 있도록 적용하게 됩니다.*/
//		dbconnect dc = new dbconnect();
//		dc.db();
		
		try {
			dbconnect db = new dbconnect();
			Connection con = db.ct();
			
			request.setCharacterEncoding("UTF-8");
			String mid = request.getParameter("mid");
			//select * from : 세그먼트 문법
			// '"+mid+"' => 일반 세그먼트 방식
			// ? => preparedSegment 방식
			
			//String sql = "select * from shopmember where suser ='"+mid+"'";
			String sql = "select * from shopmember where suser =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mid);	
			
			//setString : 값을 대입시킬때 사용
			//getString : 값을 가져올때 사용
			
			ResultSet rs = ps.executeQuery();
			
			String user = "";
			String userpw = "";
			
			while(rs.next()) {
				user = rs.getString("suser");
				userpw = rs.getString("spassword");			
			}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pr = response.getWriter();
			pr.print("해당 정보를 확인하였습니다."
					+ "<br>아이디는 :" + user
					+ "<br>패스워드는 :" + userpw);
			
			
//			db = null;
//			con.close();	//DB 접속 종료해주어야 함 (외부 클래스 사용시에만 적용)
			/*Servlet에는 무조건 한번만 작동되어집니다.*/
			
		}catch(Exception e) {
			System.out.println("DB 연결 실패");
		}
		
	}

}
