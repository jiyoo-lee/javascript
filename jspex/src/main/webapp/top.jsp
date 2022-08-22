<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String msg = (String)request.getAttribute("msg");
%>
<div style="text-align: center"><b><%=msg%></b></div>