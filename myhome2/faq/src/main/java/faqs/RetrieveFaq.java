package faqs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RetrieveFaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public RetrieveFaq() {
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		ArrayList<String> FAQlist = new ArrayList<String>();
		FAQlist.add(request.getParameter("select"));
		FAQlist.add(request.getParameter("writer"));
		FAQlist.add(request.getParameter("question"));
		FAQlist.add(request.getParameter("answer"));
		
		InsertDB idb = new InsertDB();
		String message = idb.insert(FAQlist).intern();
		PrintWriter pr = response.getWriter();
		
		if(message == "inserted") {
			pr.print("<script>alert('등록이 완료되었습니다.'); location.href='./faq_list.html';</script>");
		}
		else {
			pr.print("<script>alert('통신오류로 등록되지 못했습니다.'); history.go(-1);</script>");
		}
	}

}
