<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8"); 
	//post에서만 인코딩 필요
	//getParameterNames() : 서버로 전달된 모든 파라미터의 이름 반환
	Enumeration<String>  e = request.getParameterNames();
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>getParameterNames</h3>

<%
	while(e.hasMoreElements()){
		String name = e.nextElement();
		String[] ss = request.getParameterValues(name);
		for(String s : ss){
			out.print("<p>" + name  + " : " + s + "</p>");
		}
	}
%>
</body>
</html>