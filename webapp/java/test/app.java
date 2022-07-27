package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class app extends HttpServlet {
	static String mm;
	
	private static final long serialVersionUID = 1L;
       
    public app() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pr = response.getWriter();
		String num = request.getParameter("number");
		int lucky = (int)(Math.random()*10);
		int user = Integer.parseInt(num);
		
		if(lucky == user) {
			pr.print("당첨");
		}
		else {
			pr.print("다음기회에..");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
