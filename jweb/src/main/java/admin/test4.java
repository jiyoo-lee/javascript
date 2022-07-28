package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.util.Arrays;

public class test4 extends HttpServlet {
	PrintWriter pr = null;
	private static final long serialVersionUID = 1L;
       
    public test4() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		this.pr = response.getWriter();
		
		
		response.setContentType("text/html; charset=UTF-8");
		String[] payment = request.getParameterValues("select");
		
		if(payment[0].equals("신용카드")) {
			response.sendRedirect("https://naver.com"); //response.sendRedirect():강제 페이지 이동 
		}
		
		//선생님 예시코드 집가서 해보기
//		int no = Integer.parseInt(request.getParameter("select"));
//		
//		switch(no) {
//		
//		case 0:
//			break;
//		case 1:
//			break;
//		case 2:
//			break;
//		case 3:		//도서상품권
//			this.pr.print("<script>"
//					+ "alert('현재결제방식은 시스템 점검중입니다.');"
//					+ "history.go(-1);" 
//					+"</script>");
//			break;
//		case 4:
//			break;
//		}
		
	}

}
