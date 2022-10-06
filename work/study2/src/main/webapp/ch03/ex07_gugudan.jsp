<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
p { line-height: 1;}
</style>
</head>
<body>

<h3> 구구단 </h3>

<%
	for(int i=2; i<=9; i++){
		out.print("<p>** " + i + "단 **</p>");
		for(int j=1; j<=9; j++){
			out.print("<p>"+i + " * " + j + " = " + (i*j)+"</p>");
			//println하면 사이트에서는 동일 html 코드자체가 한줄로 나오게 됨. print가 트래피적게 먹어서 속도빠름
			//println보다 print가 더 좋은 코드
		}
		out.print("<p> ------------------ </p>");
	}
%>

<hr>

<%	for(int i=2; i<=9; i++) { %>
		<p>** <%= i%> 단 ** </p>
<%		for(int j=1; j<=9; j++){ %>
			<p> <%=i %> * <%=j %> = <%= i*j %> </p>
<% 		} %>
		<p> ------------------ </p>
<%	} %>


</body>
</html>