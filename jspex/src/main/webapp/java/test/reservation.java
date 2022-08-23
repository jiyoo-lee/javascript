package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public reservation() {
   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");
		String reservationNumber = request.getParameter("reservationNum");
		String reservationEmail = request.getParameter("eamil");
		
		PrintWriter pr = response.getWriter();
		
		String host = "smtp.naver.com";
		String admin = "jeeyu-lee@naver.com";
		String pw  = "dbcjstnwjd86";
		String code = "1234";
		Properties prop = new Properties();
		prop.put("mail.smtp.host", host);
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.debug", true);
		prop.put("mail.smtp.socketFactory.port", 587);
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		
		Session se = Session.getDefaultInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(admin, pw);
			}
		});
		try {
			MimeMessage msg = new MimeMessage(se);
			msg.setFrom(new InternetAddress(admin, "관리자"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("jeeyu-lee@naver.com"));
			msg.setSubject("예약 확인 메일입니다.");
			String url ="<div style='border:5px dotted lightgray; width:auto;'><ol style='list-style:none;'>"
					+ "<span style='border:1px solid gray; width:100px; height:80px; font-size:30px;'><b>펜션 예약 정보</b></span><hr><br>"
					+ "<p>아래와 같이 예약 안내드립니다. 입금하기 버튼을 눌러 기한내에 입금을 진행하세요</p><br>"
					+ "<li><b>고객명</b> :"+name+"</li> <br> "
					+ "<li><b>연락처</b> :" + phoneNumber +"</li><br> "
					+ "<li><b>이메일</b> : "+ reservationEmail +"</li><br>"
					+ "<li><b>예약번호</b> :"+reservationNumber+"</li><br>"
					+ "</ol>"+
					"<button style='margin-left: 100px;'><a href= 'http://jeeyulee.cafe24.com/index.jsp?reservationNumber="+reservationNumber+"'>입금하기</a></button></div>"
							+ code;
			msg.setContent(url,"text/html; charset=utf-8");
			Transport.send(msg);
			System.out.println("전송완료!");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
