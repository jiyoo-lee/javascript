package ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex5.do")
public class ex5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ex5() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String mail = request.getParameter("email");
		if(!(mail.contains("@")) || mail == null || mail == "") {
			response.getWriter().print("error");
		}
		else {
				response.getWriter().print("ok");
		}
		
		
	}
}
