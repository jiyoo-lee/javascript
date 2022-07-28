package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class test3 extends HttpServlet {
	PrintWriter pr = null;
	private static final long serialVersionUID = 1L;
       
    public test3() {
    	
    }

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		this.pr = response.getWriter();
		
		//name이 모두 같을 경우***********************
		//getParameterValues : name값이 같은 경우이며 값이 다른 상황이며 해당 값만 추출하여 배열로 생성함
		String[] like = request.getParameterValues("like");
		//System.out.println(Arrays.toString(like));
		int w =0;
		while(w<like.length) {
			System.out.println(like[w]);
			w++;
		}
		
		
		//name명이 모두 다르게 적용해야할 경우*****************
//		List<String> ck= new ArrayList<String>();
//		int w = 1;
//		while(w <= 5) {
//			if(request.getParameter("like"+w) != null) {
//				ck.add(request.getParameter("like"+w));			
//			}
//			w++;
//		}
//		System.out.println(ck); //value 값 출력
		
		
	}

}
