<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	String name = request.getParameter("postmail");
	String postsubject = request.getParameter("postsubject");
	String postmsg = request.getParameter("postmsg");
	String host = "smtp.naver.com";
	
	/* 난수 번호 만들기 [인증번호]*/
	String code = "123456";
	
	Properties pro = new Properties();
	pro.put("mail.smtp.host", host);
	pro.put("mail.smtp.port", 587);
	pro.put("mail.smtp.auth", true);   	 // mail.smtp.auth : 메일 전송에 따른 연결인증 절차
	pro.put("mail.smtp.debug", true); 	// mail 회신 정보 결과를 체크
	pro.put("mail.smtp.socketFactory.port", 587); //자신의 PC port를 오픈
	pro.put("mail.smtp.ssl.protocols", "TLSv1.2");

	Session se = Session.getInstance(pro, new Authenticator() {
		String admin = "jeeyu-lee@naver.com";
		String pw  = "dbcjstnwjd86";
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(admin, pw);
		}
	});
	
	try{
		//se.java와 연계하여 session을 로드하게 됩니다.
		String admin = "jeeyu-lee@naver.com";
		MimeMessage msg = new MimeMessage(se);
		msg.setFrom(new InternetAddress(admin, "관리자"));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress("jeeyu-lee@naver.com"));
		msg.setSubject("인증번호 발송");
		msg.setText("인증코드 번호입니다." + code);
		Transport.send(msg);
		out.print("<script>alert('인증코드가 발송되었습니다. \n 코드를 확인하세요')</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발송(CKeditor)</title>
</head>
<body>

</body>
</html>