<%@page import="review.dataload"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트 출력 파트</title>
</head>
<body>
<%
	ArrayList<dataload> list = (ArrayList<dataload>)request.getAttribute("list");
	for(dataload aa : list){
%>	
고유값 : <%=aa.getP_idx() %>
고객명 : <%=aa.getP_nm() %>
상품명 : <%=aa.getP_product() %>
<% 	
	}
%>
</body>
</html>