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

<h3>c:forTokens</h3>

<!-- 제공된 구분자로 구분된 토큰을 반복 출력 -->
<c:forTokens var="color" items="red,blue,green" delims=",">
	색상명:<c:out value="${color}"/><br>
</c:forTokens>
</body>
</html>