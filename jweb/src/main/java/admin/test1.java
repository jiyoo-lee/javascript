package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class test1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public test1() {
        
    }

	
	public void init(ServletConfig config) throws ServletException {
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//json 형식으로 받을때...근데 안됨 구글 찾아보기
//		JSONObject jo = new JSONObject();
//		response.setContentType("application/x-json; charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");	
		PrintWriter pr = response.getWriter();		
		String start = request.getParameter("sdate");
		String last = request.getParameter("edate");
		
//		pr.print(start+" ~ "+last);
		
		pr.print("ok");	//프론트로 보내줄 값
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
