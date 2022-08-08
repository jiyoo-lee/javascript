<%@page import="faqs.selectDB"%>
<%@page import="faqs.selectDB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" 
contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ List</title>
<link rel="stylesheet" type="text/css" href="./faq.css?v=1">
<script>
	function faq_write(){
		location.href='./faq_write.html'
	}
	
	function modify(fidx) {
		location.href = "./faq_view.html?idx=" + fidx;
	}
</script>
</head>
<body>
<%
ArrayList<selectDB> faqdata = (ArrayList<selectDB>)request.getAttribute("list");
%>
<section class="faq_view">
	<div class="faq_list">
		<p>FAQ LIST</p>
		<span class="faq_content">
			<ul>
				<li>카테고리</li>
				<li>제목</li>
				<li>글쓴이</li>
				<li>작성날짜</li>
			</ul>
		</span>
		<% if(faqdata.size()==0){ %>
		<span class="faq_content_view">
			<ul class="nodata">
				<li>등록된 FAQ가 없습니다.</li>
			</ul>
		</span>
		<% } else { 
			for(selectDB fetch : faqdata){
				String category = fetch.getF_category();
				String cate_nm = "";
				switch(category){
				case "shipping" :
					cate_nm ="배송문의";
					break;
					
				case "exchange/refund" :
					cate_nm ="반품/교환/환불";
					break;
					
				case "order/pay" :
					cate_nm ="주문/결제";
					break;
					
				case "service" :
					cate_nm ="회원서비스";
					break;
					
				case "safe" :
					cate_nm ="안전거래";
					break;
				}
		%>
		<span class="faq_content_view" onclick="modify(<%=fetch.getF_idx()%>)">
			<ul>
				<li><%=cate_nm%></li>
				<li class="left_text"><%=fetch.getF_question()%></li>
				<li><%=fetch.getF_writer()%></li>
				<li><%=fetch.getIndate()%></li>
			</ul>
		</span>
		<%
				}
			}
		%>
	</div>
	<div class="pageing">
	<ol>
	<li>1</li>
	</ol>
	</div>
	<div class="page_btn">
	<input type="button" value="FAQ 등록" class="faq_btn" title="FAQ 등록" onclick="faq_write();">
	</div>
</section>
</body>
</html>