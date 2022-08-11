<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">

	<%
	String cate = request.getParameter("cate").intern();
	String msg = "";	//해당 코드 번호를 한글화 or 영문화로 변경
	switch(cate){
		case "0" :
			msg = "JAVA";
			break;
		case "1" :
			msg = "Servlet";
			break;
		case "2" :
			msg = "JavaScript";
			break;
		case "3" :
			msg = "ajax";
			break;
		case "4" :
			msg = "JSP";
			break;
	}
	request.setAttribute("msg", msg);	//select2.jsp로 return해줌
%>


