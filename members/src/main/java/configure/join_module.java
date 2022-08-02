package configure;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;

public class join_module {
	static String callok =null;
	
	//password 암호화 getter
	public String pass_sc(String pw) {
		
		byte[] code = pw.getBytes();
		Encoder ec = Base64.getEncoder();
		byte[] code2 = ec.encode(code);
		String repass = new String(code2);
		
		return repass;
	}
	
	public void insert(ArrayList<String> data) {	//DB저장(회원부분)
		
		try {
			LocalDateTime time = LocalDateTime.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String today = time.format(dtf);
			dbconfig dc = new dbconfig();
			Connection ct = dc.dbcon();
		
			String sql = "insert into person values('0',?,?,?,?,?,?,?,?,'"+today+"','0001-01-01 01:01:01','Y')";
			PreparedStatement ps = ct.prepareStatement(sql);
			
			ps.setString(1, data.get(0));
			ps.setString(2, data.get(1));
			ps.setString(3, data.get(2));
			ps.setString(4, data.get(3));
			ps.setString(5, data.get(4));
			ps.setString(6, data.get(5));
			ps.setString(7, data.get(6));
			ps.setString(8, data.get(7));
			
			int n = 0;
			n = ps.executeUpdate();
			if(n > 0) {	//데이터가 들어갔을때
				this.callok = "ok";
			}
			else {
				throw new Exception("error");
			}
			
		}catch(Exception e) { // 들어가지 않았을때
			this.callok = "no";
		}
	}	
	public String join_msg() {
		return this.callok;
	}
}

