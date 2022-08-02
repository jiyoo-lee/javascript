package configure;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class joinok extends HttpServlet {
	String mid, mpass, mname, memail, mtel, mpost, maddr1, maddr2;
	
	private static final long serialVersionUID = 1L;
       
    public joinok() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		this.mid = request.getParameter("userid");
		this.mpass = request.getParameter("userpw");
		this.mname = request.getParameter("usernm");
		this.memail = request.getParameter("useremail");
		this.mtel = request.getParameter("usertel");
		this.mpost = request.getParameter("addr1");
		this.maddr1 = request.getParameter("addr2");
		this.maddr2 = request.getParameter("addr3");
		
		join_module jm = new join_module();
		this.mpass = jm.pass_sc(this.mpass);	//base64 변환(getter)
		
		ArrayList<String> list = new ArrayList<String>();
		list.add(mid);
		list.add(mpass);
		list.add(mname);
		list.add(memail);
		list.add(mtel);
		list.add(mpost);
		list.add(maddr1);
		list.add(maddr2);
		
		jm.insert(list); // 배열로 join_module 넘겨줌
		String r = jm.join_msg().intern();
		
		
		PrintWriter pr = response.getWriter();
		
		if(r == "ok") {
			pr.print("<script>alert('회원가입이 정상적으로 등록완료 되었습니다.'); location.href='./index.html';</script>");
		}
		else {
			pr.print("<script>alert('데이터가 올바르지 않습니다.'); location.href='./join.html';</script>");
		}
		
		
//		System.out.println(list); // 배열 값 들어갔는지 확인
//		System.out.println(this.mpass);	// 암호화 작업 확인
//		System.out.println(mid+""+mpass+""+mname+""+memail+""+mtel+""+mpost+""+maddr1+""+maddr2); //확인작업
	
	}
}
