package faqs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class del_faq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public del_faq() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String idx = request.getParameter("idx").intern();
		PrintWriter pr = response.getWriter();
		
		if(idx == "" || idx == null) {
			pr.write("<script>alert('올바른 접근이 아닙니다'); history.go(-1);</script>");
		}
		else {
			DeleteDB ds = new DeleteDB();
			String msg = ds.delfaq(idx).intern();	
			
			if(msg == "ok") {
				pr.write("<script>alert('해당 데이터가 정상적으로 삭제되었습니다.'); location.href = './faq_list.html';</script>");
			}else {
				pr.write("<script>alert('DB가 올바르지 않거나 정상적인 접근이 아닙니다.'); history.go(-1);</script>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
