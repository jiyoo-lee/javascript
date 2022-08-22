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
		
		//Properties, Map : 같은 속성임 Map으로 가능(key값이 있는 자료구조)
		Properties prop = new Properties();
		
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String adminMail = request.getParameter("admin");
		String postMail = request.getParameter("postmail");
		String postSubject = request.getParameter("postsubject");
		String postMsg = request.getParameter("postmsg");
				
		try {
			Authenticator auth = new SMTP();
			Session sess = Session.getDefaultInstance(prop,auth);
			Message msg = new MimeMessage(sess);
			
			msg.setFrom(new InternetAddress("bb332256@gmail.com","admin","utf-8"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(postMail));
			msg.setSubject(postSubject);
			msg.setContent(postMsg, "text/html; charset=utf-8");
			
			Transport.send(msg);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		PrintWriter pr = response.getWriter();
		pr.write(prop.toString());
	}
}
