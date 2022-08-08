package faqs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DeleteDB {
	
	public String delfaq(String idx) {
		
		String msg = "";
		DBConnector db = null;
		Connection ct = null;
		
		try {
			db = new DBConnector();
			ct =  db.connection();
			String sql = "delete from FAQ where f_idx= '"+idx+"'";
			PreparedStatement ps = ct.prepareStatement(sql);
			int n = 0;
			n = ps.executeUpdate();
			if(n > 0) {
				msg = "ok";
			}
			else {
				throw new Exception("error");
			}
			
		}catch (Exception e) {
			msg = "no";
		}
		finally {
			try {
				ct.close();
			}catch (Exception e) {
				System.exit(0);
			}
		}
		return msg;
	}
	
}
