package ex;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ex4.do")
public class ex4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ex4() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tel = request.getParameter("usertel");
		response.setContentType("text/html; charset=UTF-8");
		/*응용문제: 인증번호 다섯자리를 날려주어야함*/
		
		if(tel=="" || tel==null) {
			response.getWriter().print("error");
		}
		else {
			String number = "";
			for(int i = 0; i < 5; i++) {
				 number += (int)(Math.random()*10);
			}
		response.getWriter().print(number);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
