<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h2>EL및 JSTL에서 Map 접근</h2>
<h3>EL에서 Map 접근</h3>
<p>${map.name} | ${map.age} | ${map.subject}
<hr>

<h3>JSTL에서 Map 접근</h3>
<c:forEach var="a" items="${map}">
	<p>${a.key} : ${a.value} </p>
</c:forEach>
<hr>

<h3>JSTL에서 list의 Map접근</h3>
<c:forEach var="m" items="${list}">
	<p> ${m.name} | ${ m.city }</p>
</c:forEach>


</body>
</html>