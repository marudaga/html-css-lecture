<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<p> pageContext : 현재 페이지의 설정 정보</p>
<p> Context Path : <%=request.getContextPath() %></p>
<p> Context Path : ${pageContext.request.contextPath }</p>
<hr>

<p>header : 요청 헤더 정보 </p>
<p>User-Agent: ${header["user-agent"]} </p>
<hr>

<p>기타 내장 객체 </p>
<p> EL에서 session 객체 : sessionScope</p>

<p>
</body>
</html>