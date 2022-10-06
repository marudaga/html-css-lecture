<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("utf-8"); 
String msg= request.getParameter("msg");
String itemRight = request.getParameter("itemRight");

Map<String, String[]> paramMap = request.getParameterMap();
String []ss = paramMap.get("itemRight");
String option = request.getParameter("option");

String subject="";
if(ss !=null){
	for(String s:ss){
		subject += s+ " ";
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3>요청 받은 메시지 정보</h3>
<p>친구목록 : <%=subject%></p>
<p>메세지 : <%=msg%></p>
</body>
</html>