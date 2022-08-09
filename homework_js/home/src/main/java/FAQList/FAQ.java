package FAQList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FAQ() {
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			FAQDao fd = new FAQDao();
			List<FAQDto> faqList = fd.selectAll();

			request.setAttribute("faqList", faqList);
			RequestDispatcher rd = request.getRequestDispatcher("./FAQList.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			e.getMessage();
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ArrayList<String> list = new ArrayList<>();
		
		list.add(request.getParameter("category"));
		list.add(request.getParameter("writer"));
		list.add(request.getParameter("question"));
		list.add(request.getParameter("answer"));	
	
		PrintWriter pr = response.getWriter();	
		try {
			FAQDao dao = new FAQDao();
			int result = dao.insert(list);
			if(result > 0) {
				pr.print("<script>alert('작성이 완료되었습니다.'); location.href = './FAQ.do'; </script>");
			}else {
				throw new Exception("error");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			pr.print("<script>alert('데이터 통신 오류');</script>");
		}
		
	}
}
