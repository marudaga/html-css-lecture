<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
//여기서는 utf-8필요없음
	//파라미터로 넘어온 페이지 번호 (jsp에서 page는 예약어(변수명으로 사용불가))
	String pageNum = request.getParameter("page");
	int current_page = 1;
	if(pageNum != null){
		current_page = Integer.parseInt(pageNum);
	}
	
	MyUtil util = new MyUtil();
	
	int dataCount = 965;
	int size = 10;
	int total_page = util.pageCount(dataCount, size);
	
	
	String listUrl = "list.jsp";
	//String paging = util.paging(current_page, total_page, listUrl);
	String paging = util.pagingUrl(current_page, total_page, listUrl);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style>
*{ margin:0; padding: 0;}
*, *::after, *::before {
	box-sizing: border-box;
}
body {
	font-size: 14px; font-family: 맑은 고딕, 나눔고딕, 돋움,sans-serif;
}
.container {width:700px;  margin:30px auto;}

/* paginate */
.page-navigation { clear: both; padding: 20px 0; text-align: center; }

.paginate {
	text-align: center;
	white-space: nowrap;
	font-size: 14px;	
}
.paginate a {
	border: 1px solid #ccc;
	color: #000;
	font-weight: 600;
	text-decoration: none;
	padding: 3px 7px;
	margin-left: 3px;
	vertical-align: middle;
}
.paginate a:hover, .paginate a:active {
	color: #6771ff;
}
.paginate span {
	border: 1px solid #e28d8d;
	color: #cb3536;
	font-weight: 600;
	padding: 3px 7px;
	margin-left: 3px;
	vertical-align: middle;
}
.paginate :first-child {
	margin-left: 0;
}
</style>
</head>
<body>

<div class="container">
	<h3>페이징처리 테스트</h3>
	
	<p>
		<%= current_page %> / <%= total_page %>
	</p>
	<div class="page-navigation">
		<%= paging %>
	</div>
</div>
</body>
</html>