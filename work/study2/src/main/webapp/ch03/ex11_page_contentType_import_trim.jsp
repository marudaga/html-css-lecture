<!-- page의 contentType 속성 : 클라이언트에게 전송하는 문서 타입. 생략하면 인코딩은 ISO-8859_1 -->
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- page의 import 속성 : 필요한 자바 클래스 import -->
<%@ page import="java.util.Arrays"%>

<!-- 불필요한 공백 제거 -->
<!-- : 자바부분이 사라지면서 공백으로 남게 되는데 그부분을 제거 -->
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String[] ss = new String[] {"java", "spring", "html", "css", "oracle"};

	Arrays.sort(ss);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> page 지시어(directive) </h3>

<p> page 지시어 : JSP 페이지의 설정 정보 지정(지시어는 scriptlet에서 @붙인 것) </p>

<div>
	<% for(String s : ss) { %>
		<p> <%= s %> </p>
	<% } %>
</div>

</body>
</html>