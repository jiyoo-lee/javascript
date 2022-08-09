package FAQList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FAQDao {
	
	Connection connection;
	
	public FAQDao() throws ClassNotFoundException, SQLException {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://umj7-009.cafe24.com/jeeyulee";
		String user ="jeeyulee";
		String password = "jeeyu9400";
		
		Class.forName(driver);
		this.connection = DriverManager.getConnection(url,user,password);
	}

	public int insert(List<String> FAQ) throws SQLException {
		
		DatetimeUtil dtu = new DatetimeUtil();
		String today = dtu.getNowDatetime();
		
		String sql = "insert into FAQ_list values('0',?,?,?,?,'"+today+"','N')";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, FAQ.get(0));
		ps.setString(2, FAQ.get(1));
		ps.setString(3, FAQ.get(2));
		ps.setString(4, FAQ.get(3));

		return ps.executeUpdate();
	}
	
	public List<FAQDto> selectAll() {
		List<FAQDto> faqList = new ArrayList<>();
		
		String sql = "select * from FAQ_list order by create_datetime desc";
		
		try {
			PreparedStatement ps = this.connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				
				String category;
				if(rs.getString("category").intern() == "0") {
					category = "배송문의";
				}
				else if(rs.getString("category").intern() == "1") {
					category = "안전거래"; 
				}
				else if(rs.getString("category").intern() == "2") {
					category = "서비스"; 
				}
				else {
					category = "환불/반품"; 
				}
				String wirter = rs.getString("writer");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				String createDatetime = rs.getString("create_datetime");
				String print  = rs.getString("print");
				FAQDto faq = new FAQDto(id, category, wirter, question, answer, createDatetime, print);
				faqList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return faqList;
	}

}
