<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("username");
	String stdId = request.getParameter("stdId");
	String gender = request.getParameter("gender");
	String[] subjects = request.getParameterValues("subject");
	String s = "";
	for(String a: subjects){
		s +=a + " ";
	}
	String city = request.getParameter("city");
	String []hobbys = request.getParameterValues("hobby");
	String h = "";
	if(hobbys != null){
		for(String a : hobbys){
			h += a + " ";
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>결과</h3>

<p>이름 : <%= name %></p>
<p>학벌 : <%= stdId %></p>
<p>성별 : <%= gender %></p>
<p>과목 : <%= subjects %></p>
<p>출신도 : <%= city %></p>
<p>취미 : <%=  hobbys %></p>
</body>
</html>