<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	response.setStatus(HttpServletResponse.SC_OK);
	//IE등은 자체에러페이지 출력됨, 개발자가 설정한 에러페이지가 출력안됨
	//에러가 발생할 때 출력되는 페이지가 아닌 정상페이지로 설정
	//
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3>경고 !!!</h3>
<div>
	<p>요청하신 URL은 존재하지 않습니다.</p>
</div>
</body>
</html>