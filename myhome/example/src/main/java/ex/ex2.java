package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//에노테이션 사용시 web.xml 추가 하면 안됨
@WebServlet("/ex2.do")
public class ex2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ex2() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		PrintWriter pr = response.getWriter();
		response.setContentType("text/html; charset=uft-8");
		String mid = request.getParameter("mid");
		String mpass = request.getParameter("mpass");
		String[] msex = request.getParameterValues("msex");
		String sms = request.getParameter("sms");
		//checkbox, radio는 intern()을 쓰지않는다.
		
		if(sms == null) {
			sms = "N";
		}
		
		pr.print(mid+"<br>"
		+mpass+"<br>"
		+msex[0]+"<br>"
		+sms);
		
	}

}
