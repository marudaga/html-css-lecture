<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
String name= request.getParameter("name");
String age = request.getParameter("age");
String id = request.getParameter("id");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>폼 : disabled 속성의 객체는 서버에 전송되지 않는다.</h3>

<p>번호 : <%= num %></p>
<p>이름 : <%= name %></p>
<p>나이 : <%= age %></p><!-- disabled는 서버에 전송되지 않으므로 null -->
<p>id  : <%= id%></p>
</body>
</html>