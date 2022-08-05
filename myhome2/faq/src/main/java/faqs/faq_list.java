package faqs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class faq_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
    public faq_list() {
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			selectDB sd = new selectDB();
			ArrayList<selectDB> faqData = sd.viewdata();
			req.setAttribute("list", faqData);
			RequestDispatcher rd = req.getRequestDispatcher("./faq_list.jsp");
			rd.forward(req, resp);
		}
		catch (Exception e) {
		
		}
	}
}
