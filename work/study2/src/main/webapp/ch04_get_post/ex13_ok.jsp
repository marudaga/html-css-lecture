<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
	 	//파라미터이름, 값 (key, value)
	Map<String, String[]> paramMap = request.getParameterMap();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>getParameterMap()으로 파라미터 받기</h3>

<%
String name = paramMap.get("name")[0];
String pwd = paramMap.get("pwd")[0];
String age = paramMap.get("age")[0];
String gender = paramMap.get("gender")[0];
String []ss = paramMap.get("subject");

String subject="";
if(ss !=null){
	for(String s:ss){
		subject += s+ " ";
	}
}
out.print("<p>이름:"+name+"</p>");
out.print("<p>패스워드:"+pwd+"</p>");
out.print("<p>나이:"+age+"</p>");
out.print("<p>성별:"+gender+"</p>");
out.print("<p>과목:"+subject+"</p>");

out.print("<hr>");

//map은 key에서 반복자를 가져온다.
Iterator<String> it = paramMap.keySet().iterator();
while(it.hasNext() ){
	String key = it.next(); //파라미터 이름
	String[] values = paramMap.get(key); //파라미터 값
	
	if(values != null) {
		for(String s : values){
			out.print("<p>"+key+" : " + s +"</p>");
		}
	}
}

%>
</body>
</html>