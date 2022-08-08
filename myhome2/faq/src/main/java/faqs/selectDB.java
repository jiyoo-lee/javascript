package faqs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class selectDB {
	private String f_idx = "";
	private String f_category = "";
	private String f_writer = "";
	private String f_question = "";
	private String f_print = "";
	private String indate = "";
	
	public String getF_idx() {
		return f_idx;
	}
	public void setF_idx(String f_idx) {
		this.f_idx = f_idx;
	}
	
	public String getF_category() {
		return f_category;
	}
	public void setF_category(String f_category) {
		this.f_category = f_category;
	}
	
	
	public String getF_writer() {
		return f_writer;
	}
	public void setF_writer(String f_writer) {
		this.f_writer = f_writer;
	}
	
	
	public String getF_question() {
		return f_question;
	}
	public void setF_question(String f_question) {
		this.f_question = f_question;
	}
	
	
	public String getF_print() {
		return f_print;
	}
	public void setF_print(String f_print) {
		this.f_print = f_print;
	}
	
	
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	
	
	public ArrayList<selectDB> viewdata() throws ClassNotFoundException, SQLException{
		
		ArrayList<selectDB> list = new ArrayList<>();
		DBConnector db = new DBConnector();
		Connection con = db.connection();
		String sql = "select * from FAQ order by indate desc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			selectDB ss = new selectDB();
			ss.setF_idx(rs.getString("f_idx"));
			ss.setF_category(rs.getString("f_category"));
			ss.setF_writer(rs.getString("f_writer"));
			ss.setF_question(rs.getString("f_question"));
			ss.setF_print(rs.getString("f_print"));
			ss.setIndate(rs.getString("indate"));
			list.add(ss);
		}
		return list;
	}
}
