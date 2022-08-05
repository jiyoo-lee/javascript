package faqs;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class getDateTime {
	
	// 날짜 시간 구하기
	public String now_time() { 
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = time.format(dtf);
		
		return today;
	}
	
	//날짜 구하기
	public String now_date() {	
		LocalDate date = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String day = date.format(dtf);
		
		return day;
	}

}
