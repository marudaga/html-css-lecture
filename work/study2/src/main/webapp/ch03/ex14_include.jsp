<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>include 지시어</h3>
<pre>
	- JSP 페이지에 다른 페이지의 내용을 포함할 때 사용한다.
	- JSP 파일을 JAVA 파일로 변환할 때 처리하며, 복사/붙여넣기 개념과 유사하다.
</pre>
<hr>

<%@ include file="sub.jsp" %>
<p>
	<%= subject %> 과목 점수는 <%= score %>점 입니다.
</p>


</body>
</html>