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

<h3>JSTL : forEach -반복구문</h3>

<form action="ex14_JSTL_forEach.jsp" method="post">
	<input type="text" name="num" placeholder="단" required="required" pattern="\d+">
	<button type="submit">확인</button>
</form>


<c:forEach var="n" begin="1" end="9" step="1">
	<c:forEach var="i" begin="1" end="9" step="1">
	${i} * ${n} =${i*n }<br>
	</c:forEach>
	<br>
</c:forEach>

</body>
</html>