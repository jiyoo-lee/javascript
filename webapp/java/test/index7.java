package test;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index7 extends HttpServlet {
	PrintWriter pr = null;
	private static final long serialVersionUID = 1L;
       
    public index7() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String usernm = request.getParameter("usernm").intern();
		String userpw = request.getParameter("userpw").intern();
//		String msg = "<script>"
//						+"alert('test');"
//						+"</script>";		
		this.pr = response.getWriter();
//		pr.print(msg);
		
		if(usernm == "kim" && userpw == "a123456") {
			this.pr.print("login");
			//get으로 넘겼을시 구현 방법
			//this.pr.print("<script>alert('로그인 되셨습니다.'); location.href = ./index7.html</script>");
		}
		else {
			this.pr.print("error");
			//this.pr.print("<script>alert('아이디와 패스워를 다시 확인하세요'); history.go(-1)</script>");
			
		}
	
	}
}
