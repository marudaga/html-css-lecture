<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	int n = 0;
	int row = 10;
	int col = 7;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>스크립 릿, 표현식 예</h3>

<p>
out 객체 : JSP 내장객체, 클라이언트에게 정보(문자열)를 전송하는 객체
</p>
<table border="1" style="margin: 30px auto; width: <%= col*50%>px; border-collapse: collapse;">
<%
	for(int i=1; i<=row; i++) {
		out.print("<tr height='30' align='center'>");
		for(int j=1; j<=col; j++) {
			out.print("<td>" + (++n) + "</td>");
		}
		out.print("</tr>");
	}

%>
</table>

</body>
</html>