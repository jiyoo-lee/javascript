package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index5 extends HttpServlet {
	PrintWriter pr = null;
	
	private static final long serialVersionUID = 1L;
       
    public index5() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); //처리만 하는거면 안써도 되나 값을 돌려주어야하면 response로 코드를 구현해주어야한다.
		String n = request.getParameter("user");
		pr = response.getWriter();
		pr.print(n);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
