package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class index3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected PrintWriter pr = null;
	protected Connection con = null;
	protected LocalDateTime now = null;
	String mname,mid,mpw,memail;
	
    public index3() {
    	try {   
    		dbconnect db = new dbconnect();
    	    this.con = db.ct();
    	}
    	catch (Exception e) {
    	    e.getMessage();
		}
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		this.mname = request.getParameter("join_nm");
		this.mid = request.getParameter("join_id");
		this.mpw = request.getParameter("join_pw");
		this.memail = request.getParameter("join_email");
		this.now = LocalDateTime.now(); //datetime 컬럼 속성을 설정 할 경우 
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = this.now.format(df);
		/*auto_increment 컬럼값도 적용해야 합니다. */
		int point = 1000;
		String sql = "insert into joinmember(midx, mnm, mid, mpw, memail, mpoint, mdate) values('0','"+this.mname+"','"+this.mid+"','"+this.mpw+"','"+this.memail+"','"+point+"','"+today+"')";
		// ? : 표시 할 경우 무조건 물음표는 1부터 시작함.
		try {
			PreparedStatement ps = this.con.prepareStatement(sql);
			int isok = 0;
			isok = ps.executeUpdate();
			// 정확하게 저장이 될 경우 isok는 무조건 +1이 작동됨 오류 발생시 0으로 출력됨
			//executeUpdate : insert, update, delete문법에 사용함 
			
			response.setContentType("text/html; charset=UTF-8");
			this.pr = response.getWriter();
//			System.out.println(isok); // 데이터가 올바르게 작동한다면 1 
			
			if(isok > 0) {
				this.pr.write("회원가입이 정상적으로 진행되었습니다.");
			}
			else {
				this.pr.write("DB컬럼에 문제가 발생하였습니다.");
			}
		}catch (Exception e) {
		}

		
//		System.out.println(sql);
//		System.out.println(today);
	}
}
