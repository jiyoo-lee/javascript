package review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class afterWrite extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    
    public afterWrite() {
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("userName");
		String product = request.getParameter("productName");
		String score = request.getParameter("ra");
		String content = request.getParameter("content");
		
		access ac = new access();
		ArrayList<String>list = new ArrayList<String>();
		
		list.add(name);
		list.add(product);
		list.add(score);
		list.add(content);
	
		ac.insert(list);
		String sign = ac.message().intern();
		
		PrintWriter pr = response.getWriter();
		
		if(sign == "inserted") {
			pr.print("<script>alert('리뷰등록이 완료되었습니다.'); location.href ='./review_write.html;'</script>");
		}
		else {
			pr.print("<script>alert('데이터가 올바르지 않습니다.')</script>");
		}
	}

}
