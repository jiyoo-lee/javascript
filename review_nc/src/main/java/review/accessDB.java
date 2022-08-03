package review;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class accessDB extends HttpServlet {
	
	static String rightAccess = null;
	private static final long serialVersionUID = 1L;
       
   
    public accessDB() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		String p_nm = request.getParameter("userName");
		String p_product = request.getParameter("productName");
		String p_score= request.getParameter("ra");
		String p_content= request.getParameter("content");
		
		
		try {
			LocalDateTime time = LocalDateTime.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String today = time.format(dtf);
			
			dbconnector db = new dbconnector();
			Connection ct = db.connection();
			String sql = "insert into pd_review values('0',?,?,?,?,'"+today+"','0001-01-01 00:00:00')";
			PreparedStatement ps = ct.prepareStatement(sql);
			
			ps.setString(1, p_nm);
			ps.setString(1, p_product);
			ps.setString(1, p_score);
			ps.setString(1, p_content);
			
			System.out.println(ps);
			int n = 0;
			n = ps.executeUpdate();
			
			if(n > 0) {
				this.rightAccess = "inserted";
			}
			else {
				throw new Exception("error");
			}
			
		}catch(Exception e) {
			this.rightAccess = "denied";
		}
	}
	public String message() {
		
		return this.rightAccess;
	}
}
