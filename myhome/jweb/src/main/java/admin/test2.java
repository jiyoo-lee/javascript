package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class test2 extends HttpServlet {
	PrintWriter pr = null;
	
	private static final long serialVersionUID = 1L;
       
    public test2() {
    	
    }

	public void init(ServletConfig config) throws ServletException {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		this.pr = response.getWriter();
		String user = request.getParameter("user_name").intern();
		
		if(user == "홍길동") {	//해당 사용자의 정보를 배열값으로 전송
			List<String> list = new ArrayList<String>();	//list 빈 배열 
			list.add("hong");	//배열값을 저장1
			list.add("hong@nate.com");	//배열값을 저장2
			
			JSONObject jdata = new JSONObject();	//front단에서 dataType:text(문자)로 받아서 값을 넘길때 실제 배열형태의 구조로 바꾸어주야한다.
			jdata.put("list", list);	//put(key,value) 기존 값에서 추가로 사용할 때
			
			response.setContentType("application/x-json; charset=UTF-8");	//json배열 형태로 값을 전달
			response.getWriter().print(jdata);
			
			//this.pr.print(jdata); 
			//call로 보낼경우 무조건 한번만 사용가능하다.
		}
		else {
			this.pr.print("error");
		}
//		this.pr.print(user);
	}

}
