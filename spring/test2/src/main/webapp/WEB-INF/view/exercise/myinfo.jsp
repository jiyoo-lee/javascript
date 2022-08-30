<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYINFO</title>
</head>
<body>
<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<section style="background-color: skyblue; height: 500px">
	MYINFO 메인
	</section>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>