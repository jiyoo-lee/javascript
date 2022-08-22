<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web-page Main</title>
</head>
<% String p = (String)request.getAttribute("product"); %>
 <%String img = (String)request.getAttribute("imgs");%>
<script src="./ckeditor/ckeditor.js"></script> <!-- engine -->
<body>
<header style="height: 200px; background-color: yellowgreen">
<%@include file = "top.jsp"%></header>
<section style="height: 800px; background-color: skyblue">
<%@include file = "view.jsp"%></section>
<footer style="height: 100px; background-color: lightgray">
<%@include file = "footer.jsp"%>
</footer>
</body>
<script>
	CKEDITOR.replace("contentText");

</script>
</html>