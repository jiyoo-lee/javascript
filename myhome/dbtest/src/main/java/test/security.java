package test;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class security extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public security() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//응용문제(password)
		request.setCharacterEncoding("UTF-8");
		String pw = request.getParameter("pw");
		Decoder dc = Base64.getDecoder();
		byte[] userpw = dc.decode(pw);
		System.out.println(new String(userpw));
		
		
		/* base64는 decoder, encoder가 있다. hash나 map 암호화는 역으로 풀 수 없다.
		 * 기초 암호화 부분이며, 역으로 암호를 풀 수도 있다.*/
		
		//인코더
//		String pw = "a12345";
//		byte[] se = pw.getBytes();
//		
//		Encoder ec = Base64.getEncoder();
//		byte[] ectext = ec.encode(se);
//		System.out.println(new String(ectext));
//		
//		//디코더
//		String pw2 = "YTEyMzQ1";
//		Decoder dec = Base64.getDecoder();
//		byte[] decodeByte = dec.decode(pw2);
//		System.out.println(new String(decodeByte));
//		
//		//역으로 풀지 못하는 MD5
//		//MessageDigest : Hash 알고리즘(암호화)
//		try {
//			String p = "a1234";
//			MessageDigest md5 = MessageDigest.getInstance("MD5");
//			md5.update(p.getBytes("UTF-8"));	//update -> Byte으로 바꿈
//			byte[] md = md5.digest();	//배열 기준으로 대입
//			StringBuilder sb = new StringBuilder();
//			//StringBuilder : 문자배열
//			for(byte ck : md) {
//				String recode = String.format("%02x", ck);
//				//%02x : 16진수 변환
//				sb.append(recode);
//			}
//			System.out.println(sb);
//		}catch(Exception e) {
//			
//		}
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
