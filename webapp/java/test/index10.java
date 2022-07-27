package test;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index10 extends HttpServlet {
	PrintWriter pr = null;
	private static final long serialVersionUID = 1L;
       
    public index10() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String addr = request.getParameter("addr").intern();
		String addr2 = request.getParameter("addr2").intern();
		String addr3= request.getParameter("addr3").intern();
		this.pr = response.getWriter();
		this.pr.write(addr+""+addr2+""+addr3);
	
	}
}
