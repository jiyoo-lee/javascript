package faqs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class faq_view extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public faq_view() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		try {
			
			DBConnector db = new DBConnector();
			Connection con = db.connection();
			String idx = request.getParameter("idx");
			String sql = "select * from FAQ where f_idx = '"+ idx +"'";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			String sql2 = "select count(*) from FAQ where f_idx = '"+ idx +"'";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ResultSet rs2 = ps2.executeQuery();
			
			PrintWriter pr = response.getWriter();
			
			//rs.next()는 한번밖에 사용하지 못하므로 (buffer와 동일) 한번 코드 입력시 값이 추후에 같은 페이지내에선 재사용시 소멸되어 읽어오지 못함

			if(rs2.next() == false) { //count로 값을 확인합니다. 단 select에대한 where 부분에 값이 없을경우
				pr.write("<script>alert('잘못된 접근입니다.'); history.go(-1);</script>");
			}
			else {
				String f_idx = null;
				String category = null;
				String writer = null;
				String question = null;
				String answer = null;
				String print = null;
				
				while(rs.next()) {
					f_idx = rs.getString("f_idx");
					category = rs.getString("f_category");
					writer = rs.getString("f_writer");
					question = rs.getString("f_question");
					answer = rs.getString("f_answer");
					print = rs.getString("f_print");
				}
				
				response.setContentType("text/html; charset=utf-8");
				
				request.setAttribute("f_idx", f_idx);
				request.setAttribute("f_category", category);
				request.setAttribute("f_writer", writer);
				request.setAttribute("f_question", question);
				request.setAttribute("f_answer", answer);
				request.setAttribute("f_print", print);
				
				RequestDispatcher rd = request.getRequestDispatcher("/faq_view.jsp");
				rd.forward(request, response);
			}
			
		}catch (Exception e) {
		}
		
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
