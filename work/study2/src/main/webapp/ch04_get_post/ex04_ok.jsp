<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");//없으면 안터짐
	int age = Integer.parseInt(request.getParameter("age"));
	//없으면 터짐 string이 ""이면 되지만 null이면 터짐 값이 없으면 null이 넘어감
	String result = age>=19? "성인" : "초딩";
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> 요청 받은 결과</h3>

<p> 이름 : <%= name %></p>
<p> 나이 : <%= age %>, <%= result %></p>
</body>
</html>