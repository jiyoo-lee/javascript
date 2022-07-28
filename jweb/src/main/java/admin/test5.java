package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class test5 extends HttpServlet {
	PrintWriter pr = null;
	String key = null;
	private static final long serialVersionUID = 1L;
       
   
    public test5() {
    	this.key = null;
    }

	//url에 직접적으로 접속하였을때 doGet이 무조건 먼저 발동함
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if(this.key =="" || this.key == null) {
			this.pr.print("<script>alert('올바른 접근 방식이 아닙니다.'); history.go(-1);</script>");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		key = request.getParameter("key").intern();
		this.pr = response.getWriter();
		if(this.key == "" || this.key == null) {	//해당 키값은 기본으로 null처리함
			this.pr.print("<script>alert('올바른 접근 방식이 아닙니다.'); history.go(-1);</script>");
		}
		else if(key == "loginpost") { //key값이 맞을 경우 
			String mid = request.getParameter("mid");
			String mpass = request.getParameter("mpass");
			//DB 연결
		}
	}

}
