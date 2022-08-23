<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import="java.security.MessageDigest"%>
<%@ page import="java.security.*"%>
<%!// HASH 구현을 위한 클래스 파일생성
   public class CEncrypt {
      MessageDigest md;
      String strSRCData = "";
      String strENCData = "";

      public CEncrypt() {
      }

      //인스턴스 만들 때 한방에 처리할 수 있도록 생성자 중복시켰습니다.
      public CEncrypt(String EncMthd, String strData) {
         this.encrypt(EncMthd, strData);
      }

      //암호화 절차를 수행하는 메소드입니다.
      public void encrypt(String EncMthd, String strData) {
         try {
            MessageDigest md = MessageDigest.getInstance(EncMthd); // "MD5" or "SHA1"
            byte[] bytData = strData.getBytes();
            md.update(bytData);

            byte[] digest = md.digest();
            for (int i = 0; i < digest.length; i++) {
               strENCData = strENCData + String.format("%02x", digest[i] & 0xFF).toLowerCase();
            }
         } catch (NoSuchAlgorithmException e) {
            System.out.print("암호화 알고리즘이 없습니다.");
         }
         ;

         //나중에 원본 데이터가 필요할지 몰라서 저장해 둡니다.
         strSRCData = strData;
      }

      //접근자 인라인 함수(아니, 메소드)들입니다.
      public String getEncryptData() {
         return strENCData;
      }

      public String getSourceData() {
         return strSRCData;
      }

      //데이터가 같은지 비교해주는 메소드입니다.
      public boolean equal(String strData) {
         //암호화 데이터랑 비교를 하던, 원본이랑 비교를 하던 맘대로....
         if (strData == strENCData)
            return true;
         return false;
      }
   } 
%>

<jsp:useBean id="smsid" scope="session" class="test.ServiceSMSSoapProxy" />

<%
   if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
      smsid.setEndpoint(request.getParameter("endpoint"));
   %>
   <%
   String method = request.getParameter("method");
   String smsID = "";
   String hashValue = "";
   String hash_temp = "";
   String senderPhone = "";
   String receivePhone = "";
   String smsContent = "";
   String resultReturn = "";
   String reserveDate = "";
   String reserveTime = "";
   String userDefine = "";
   String callbackUrl = "";
   String searchValue = "";
   String mode = "";
   CEncrypt encrypt;

   int methodID = 0;
   if (method == null)
      methodID = -1;

   if (methodID != -1)
      methodID = Integer.parseInt(method);
   boolean gotMethod = false;

   try {
      switch (methodID) {
      case 2: //즉시보내기 사용예제
         gotMethod = true;
         smsID = request.getParameter("smsID");
         hashValue = request.getParameter("hashValue");
         senderPhone = request.getParameter("senderPhone");
         receivePhone = request.getParameter("receivePhone");
         smsContent = request.getParameter("smsContent");
         hash_temp = (smsID + hashValue + receivePhone); //아이디, 패스워드,수신번호를 hash화시킴

         encrypt = new CEncrypt("MD5", hash_temp);
         String sendSMS = smsid.sendSMS(smsID, encrypt.getEncryptData(), senderPhone, receivePhone, smsContent);

         out.println("결과코드 : " + sendSMS);

         break;

      case 15: //예약문자전송시 사용예제
         gotMethod = true;
         smsID = request.getParameter("smsID");
         hashValue = request.getParameter("hashValue");
         senderPhone = request.getParameter("senderPhone");
         receivePhone = request.getParameter("receivePhone");
         smsContent = request.getParameter("smsContent");
         reserveDate = request.getParameter("reserveDate");
         reserveTime = request.getParameter("reserveTime");
         userDefine = request.getParameter("userDefine");
         hash_temp = (smsID + hashValue + receivePhone); //아이디, 패스워드,수신번호를 hash화시킴

         encrypt = new CEncrypt("MD5", hash_temp);
         String sendSMSReserve = smsid.sendSMSReserve(smsID, encrypt.getEncryptData(), senderPhone, receivePhone,
         smsContent, reserveDate, reserveTime, userDefine);

         out.println("결과코드 : " + sendSMSReserve);

         break;

      case 70: //SMS예약 취소시 사용됨
         gotMethod = true;
         smsID = request.getParameter("smsID");
         hashValue = request.getParameter("hashValue");
         userDefine = request.getParameter("userDefine");
         mode = request.getParameter("mode");
         hash_temp = (smsID + hashValue + userDefine); //아이디, 패스워드,사용자정의값을 hash화시킴
         encrypt = new CEncrypt("MD5", hash_temp);
         int reserveCancle = smsid.reserveCancle(smsID, encrypt.getEncryptData(), userDefine, mode);
         out.println("결과값 : " + reserveCancle);
         break;

      case 81: //SMS잔여개수 확인시 사용
         gotMethod = true;
         smsID = request.getParameter("smsID");
         hashValue = request.getParameter("hashValue");
         encrypt = new CEncrypt("MD5", smsID + hashValue);
         int getRemainCount = smsid.getRemainCount(smsID, encrypt.getEncryptData());
         out.println("잔여량 : " + getRemainCount);
         break;

      case 87: //SMS잔여개수 확인시 사용
         gotMethod = true;
         smsID = request.getParameter("smsID");
         hashValue = request.getParameter("hashValue");
         encrypt = new CEncrypt("MD5", smsID + hashValue);
         String getRemainDay = smsid.getRemainDay(smsID, encrypt.getEncryptData());

         if (getRemainDay.charAt(0) == '-') {
      out.println("오류코드 : " + getRemainDay);
         } else if (getRemainDay.charAt(0) == '0') {
      out.println("만료 될 건이 없습니다.");
         } else {
      String[] res = getRemainDay.split("\\|");
      out.println(res[0] + "일 후 " + res[1] + "건이 만료됩니다.");
         }
         break;
      }
   } catch (Exception e) {
   %>
   Exception:
   <%=e%>
   <%
   return;
   }
   if (!gotMethod) {
   %>
   
   <%
   }
   %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증발송 및 인증번호 확인</title>
</head>
<body>
   <%
   String random = "";
   for(int i =1; i <=6; i++){
      int temp = (int)(Math.random()*10)+1;
      random += temp;
   	}
      try{         
         String id = "tjoeun705";
         String pw = "t705705!java";
         String tel = "027167006";
         
         smsID = id;
         hashValue = pw;
         senderPhone = tel;
         gotMethod = true;
         
         receivePhone = request.getParameter("receivePhone");
         smsContent = "인증번호 : " + random;
         hash_temp = (smsID + hashValue + receivePhone); //아이디, 패스워드,수신번호를 hash화시킴

         encrypt = new CEncrypt("MD5", hash_temp);
         String sendSMS = smsid.sendSMS(smsID, encrypt.getEncryptData(), senderPhone, receivePhone, smsContent);
         
      }catch(Exception e){
         e.getMessage();
      }
   %>
   발송된 인증번호 입력 : <input type="text" name="seno" id="seno"><br>
   <input type="button" value="인증확인" onclick="secheck()">
   
</body>
<script>
   function secheck(){
	   //자바스크립트에서 jsp 변수값을 가져오는 부분
      var ori = "<%=random%>"   
   
      if(document.getElementById("seno").value == ori){
         alert("인증번호가 확인되었습니다");
      }else{
         alert("인증번호를 다시 확인해보세요");
      }
   }
</script>
</html>