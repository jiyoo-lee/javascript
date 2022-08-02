package configure;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class loginck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginck() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mid = request.getParameter("userid");
		
//		System.out.println(mid);
		
		PrintWriter pw = response.getWriter();
		try {
			login_module lm = new login_module();
			String[] data = { mid }; //main으로 받았기때문에 data[] 배열로 주었다. (main은 파라미터를 배열값으로밖에 안받는다)
			lm.main(data);	//main으로 전송
			
			response.setContentType("text/html; charset=utf-8");
			String r = lm.result_check();	//getter형태로 로드
			
			if(r == null) {
				throw new Exception("error");
			}
			else {				
				pw.print(r);
			}
			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			pw.print("데이터베이스 오류");
		}
	}

}
