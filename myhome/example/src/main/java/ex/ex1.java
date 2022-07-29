package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ex1 extends HttpServlet {
	PrintWriter pr = null;
	private static final long serialVersionUID = 1L;
       
    
    public ex1() {
       
    }

	//parameter 전송 & 사용자가 URL을 직접적으로 입력했을때
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request : front data
		//response : backend data
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cal = request.getParameter("cal");
		String cal2 = request.getParameter("cal2");
		String job = request.getParameter("job");
		this.pr = response.getWriter();
		
		pr.print("<html lang ='ko'>"
				+ "<head>"
				+ "<meta charset='utf-8'>"
				+ "</head>"
				+ "<body>"
				+ "<p>결과값출력: " + cal +"</p>"
				+ "<p>결과값출력2: " + cal2 +"</p>"
				+ "<p>선택하신 직업군은: " + job +"입니다.</p>"
				+ "</body>"
				+ "</html>");
	}

	//form & AJAX(POST방식)에만 사용
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
