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

<h3>JSTL : forEach - 반복구문</h3>


<form action="ex13_JSTL_forEach.jsp" method="post">
	<input type="text" name="num" placeholder="단" required="required" pattern="[1-9]{1}">
	<button type="submit">확인</button>
</form>

<c:if test="${not empty param.num }">
	<p>**${param.num} 단 ** </p>
	<c:forEach var="n" begin="1" end="9" step="1"><!-- step:증가분. 1이면 생략 가능 -->
		${param.num} *${n} = ${param.num * n}<br>
	</c:forEach>
</c:if>
</body>
</html>