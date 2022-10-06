<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page errorPage="error.jsp" %>

<%
	String s = "10a";
	int n = Integer.parseInt(s);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> page 지시어(directive) </h3>
<p> errorPage 속성 : 에러가 발생할 때 보여줄 페이지 지정 </p>

<p> <%= n %> </p>

</body>
</html>