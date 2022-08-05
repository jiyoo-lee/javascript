package faqs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;


public class InsertDB {
	String message = "";
	
	//데이터기입 날짜,시간 구하기
	public String now_time() { 
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = time.format(dtf);
		
		return today;
	}
	
	public String insert(ArrayList<String> data) {
		
		try {
			String today = now_time();
			
			DBConnector db = new DBConnector();
			Connection ct = db.connection();
			
			String SQL = "insert into FAQ(f_idx,f_category,f_writer,f_question,f_answer,indate) values('0',?,?,?,?,'"+today+"')";
			
			PreparedStatement ps = ct.prepareStatement(SQL);
			
			ps.setString(1, data.get(0));
			ps.setString(2, data.get(1));
			ps.setString(3, data.get(2));
			ps.setString(4, data.get(3));
			
			int n = 0;
			n = ps.executeUpdate();
			if( n > 0) {
				this.message = "inserted";
			}
			else {
				throw new Exception("error");
			}
			
		}catch (Exception e) {
			this.message = "denied";
		}
		return this.message;
	}

}
