package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class access {
	
	static String rightAccess = null;
	
	public void insert(ArrayList<String> data) {
				
		try {
			LocalDateTime time = LocalDateTime.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String today = time.format(dtf);
			
			dbconnector db = new dbconnector();
			Connection ct = db.connection();
			
			
			String sql = "insert into pd_review values('0',?,?,?,?,'"+today+"','0001-01-01 00:00:00')";
			PreparedStatement ps = ct.prepareStatement(sql);
	
			ps.setString(1, data.get(0));
			ps.setString(2, data.get(1));
			ps.setString(3, data.get(2));
			ps.setString(4, data.get(3));
			
			
			int n = 0;
			n = ps.executeUpdate();
			
			if(n > 0) {
				this.rightAccess = "inserted";
			}
			else {
				throw new Exception("error");
			}
			
		}catch(Exception e) {
			this.rightAccess = "denied";
		}
	}
	public String message() {
		
		return this.rightAccess;
	}
}


