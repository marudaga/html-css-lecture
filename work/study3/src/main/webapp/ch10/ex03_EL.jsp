<%@page import="ch10.user.User"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	User dto = new User("홍길동", 20, "010-1111-1111", null);
	request.setAttribute("vo", dto);
	//서버에 vo속성에 dto 저장함
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<jsp:forward page="ex03_ok.jsp">
	<jsp:param value="서울" name="city"/>
</jsp:forward>

</body>
</html>