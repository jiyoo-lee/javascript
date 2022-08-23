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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mailto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mailto() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter ps = response.getWriter();
		
		String adminMail = request.getParameter("admin");
		String postMail = request.getParameter("postmail"); //회원 메일
		String postSubject = request.getParameter("postsubject");
		String postMsg = request.getParameter("postmsg");
		String admin= request.getParameter("admin");
		
		String host = "smtp.naver.com";
		String user = admin;
		String pw = "dbcjstnwjd86";
		
		Properties pr = new Properties();		//map과 비슷한 키,value 형식
		pr.put("mail.smtp.host", host);
		pr.put("mail.smtp.port", 587);
		pr.put("mail.smtp.auth", true);   	 // mail.smtp.auth : 메일 전송에 따른 연결인증 절차
		pr.put("mail.smtp.debug", true); 	// mail 회신 정보 결과를 체크
		pr.put("mail.smtp.socketFactory.port", 587); //자신의 PC port를 오픈
		pr.put("mail.smtp.ssl.protocols", "TLSv1.2"); //TLS 규격 버전
		//SSL v2, SSLv3, TLSv1.2, TLSv1.4, TLS1.6
		
		//비밀번호 생성 => 회원가입(비밀번호)
		Session se = Session.getDefaultInstance(pr, new javax.mail.Authenticator() {	//OTP비밀번호 
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pw);
			}
		});
		
		try {
			MimeMessage msg = new MimeMessage(se);
			msg.setFrom(new InternetAddress(admin,"관리자"));	//송신자 정보
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(postMail));	//수신자 정보
			msg.setSubject(postSubject);	//수신제목
			msg.setText(postMsg);	//수신 내용
			
		    String img ="<span style='display:block; border:1px solid #ccc; width:300px; height:30px; text-align:center; line-height:30px"
		    		+ "'> <a href='http://jeeyulee.cafe24.com/index.jsp?mail="+postMail+"'><img src ='https://helpx.adobe.com/content/dam/help/en/photoshop/using/quick-actions/remove-background-before-qa1.png'> [인증번호 : 12345678]"
		               + "</a>"
		               + "</span>";
			msg.setContent(img,"text/html; charset=utf-8");   //text/html을 이용하여 태그를 적용하여 메일 발송을 함

			Transport.send(msg);
			System.out.println("전송완료");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
