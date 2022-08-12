<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4일차 Multi data 저장(ex28.jsp)</title>
</head>
<body>
<%
	//서버에 대한 절대경로를 출력하는 형태입니다. (본서버에는 해당 라인 적용)
	String url = request.getServletContext().getRealPath("upload"); //서버에서 저장시킬때
	out.print(url);

	// 연습용 경로
	String path = "C:\\myhome2\\faq\\src\\main\\webapp\\upload";
	int max_save = 1024 * 1024 * 2;
	String lang = "UTF-8";
	
	MultipartRequest mr = new MultipartRequest(request,path,max_save,lang,new DefaultFileRenamePolicy());
	Enumeration files = mr.getFileNames(); 
	
	/*첨부파일  3개이므로 각각 해당 파일 정보를 출력함*/
	String filenm = (String)files.nextElement();
	String allfile = mr.getFilesystemName(filenm);
	out.print(allfile);
	
	String filenm2 = (String)files.nextElement();
	String allfile2 = mr.getFilesystemName(filenm2);
	out.print(allfile2);
	
	String filenm3 = (String)files.nextElement();
	String allfile3 = mr.getFilesystemName(filenm3);
	out.print(allfile3);

%>
</body>
</html>