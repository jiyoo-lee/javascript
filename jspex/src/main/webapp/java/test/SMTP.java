package test;

import javax.mail.*;

public class SMTP extends Authenticator{
	
	protected PasswordAuthentication getPasswordAuthentication() {
		String username = "jeeyu-lee@naver.com";
		String password = "dbcjstnwjd86";		
		return new PasswordAuthentication(username, password);
	}
}
