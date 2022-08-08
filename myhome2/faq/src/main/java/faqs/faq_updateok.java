package faqs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class faq_updateok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public faq_updateok() {
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		
		try {
			DBConnector db = new DBConnector();
			Connection ct = db.connection();
			String idx = request.getParameter("fidx");
			String category = request.getParameter("select");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			String[] print = request.getParameterValues(idx);
			
			String sql = "update FAQ set f_category = '"+category+"', "
					+ "f_question = ' "+question+ "', "
					+ "f_answer = '"+answer+"'where f_idx = '"+idx+"'";
			PreparedStatement ps = ct.prepareStatement(sql);
			
			int n = 0;
			n = ps.executeUpdate();
			
			if(n > 0) {
				pr.print("<script>alert('FAQ 수정이 완료되었습니다.'); location.href ='./faq_list.html';</script>");
			}
			else {
				throw new Exception("error");
			}

		}catch (Exception e) {
			pr.print("<script>alert('올바른 접근이 아닙니다.'); history.go(-1);</script>");
		}
	}

}
