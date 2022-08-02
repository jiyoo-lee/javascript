package configure;

import java.sql.*;

public class login_module {
	
	static String results;
	
	//setter
	public void oksign(String a) {
		this.results = a;
	}
	//getter
	public String result_check() {
		return this.results;
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		dbconfig db = new dbconfig();
		Connection con = db.dbcon();
		String sql = "select * from person where mid='"+args[0]+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		String backdata = null;		
		if(rs.next()==true) {	//true는 데이터가 있음(즉, 중복)
			backdata = "no";
		}
		else {	//false 데이터가 없음 즉 가입가능한 아이디
			backdata = "ok";
		}
		login_module lg = new login_module();
		lg.oksign(backdata);
		
	}

}
