<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import ="java.util.*" %>
<%@page import ="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ex27.jsp 파일 업로드 처리 part</title>
</head>
<body>
<%
	String now = new SimpleDateFormat("yyyyMMdd").format(new Date());

	String save = "C:\\myhome2\\faq\\src\\main\\webapp\\upload";
	int max_save = 1024 * 1024 * 2;
	String lang = "UTF-8";
	
	MultipartRequest mr = new MultipartRequest(request,save,max_save,lang,new DefaultFileRenamePolicy());
	
	Enumeration files = mr.getFileNames(); 
	String filenm = (String)files.nextElement();
	String postfile = mr.getOriginalFileName(filenm);
	String savefile = mr.getFilesystemName(filenm);
	
	String filetype = mr.getContentType(filenm);
// 	out.print(postfile);
// 	out.print(savefile);
// 	out.print(filetype);

	/*파일명을 강제 변경 업로드 된 파일을 변경하는 방식*/
	if(savefile != null){
		File f = new File(save+"\\"+savefile);
		String fnm = f.getName();
		
		//IndexOf : 앞부터 단어를 읽어감
		//lastIndexOf : 뒤부터 단어를 읽어감
		//substring : 글자를 자를때 사용
		String split = fnm.substring(fnm.lastIndexOf("."));
		String newfilename = now + split;
		
		/* Files.io 사용해서 해당 파일명을 변경*/
		Path a = Paths.get(save+"\\"+savefile);
		Path b = Paths.get(save+"\\"+newfilename);
		Files.move(a, b, StandardCopyOption.ATOMIC_MOVE);
		//StandardCopyOption.ATOMIC_MOVE : JAVA언어
		// 기존파일은 삭제하고 변경된 파일로 복사하면서 이름이 변경
	}
%>
</body>
</html>