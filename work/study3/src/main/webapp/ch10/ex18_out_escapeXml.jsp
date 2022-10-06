<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String s = "<p style='color:red;'>자바</p>";
	
	pageContext.setAttribute("msg", s);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h2> c:out 태그 - 표현식의 결과를 출력한다.</h2>

<h3>EL을 이용한 출력(글자는 red로 출력)</h3>
<p>${msg}</p>
<hr>

<h3>c:out를 이용한 출력, 기본 escapeXml이 true로 태그 문자는 그대로 출력</h3>
<p><c:out value="${msg}"/></p>
<hr>

<h3>c:out를 이용한 출력</h3>
<p><c:out value="${msg}" escapeXml="false"/></p>
<hr>

</body>
</html>