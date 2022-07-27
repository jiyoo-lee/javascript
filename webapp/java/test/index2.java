package ajaxExample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class index2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public index2() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pr = response.getWriter();
		String id = request.getParameter("mid").intern();
		
		if(id == "park") {
			pr.print("<script>alert('로그인되었습니다.'); location.href = 'http://nate.com'</script>");
		}
		else {
			pr.print("<script>alert('가입되지 않은 사용자입니다.'); history.go(-1);</script>");
		}
		
	}

}
