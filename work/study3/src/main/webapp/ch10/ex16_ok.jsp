<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3>for Each : Colleciton 객체 반복 출력 - List</h3>

<h3>forEach 와 EL를 이용한 출력</h3>
<c:forEach  var="vo" items="${list}">
	<p>${vo.name} | ${vo.age} | ${vo.tel} | ${vo.subject}</p>
	<!-- vo.subject 객체가 없으면 터짐 -->
	<!-- vo.subjecf는 있는데 그 값이 없으면 안나옴 -->
</c:forEach>
<hr>

<h3>varStatus 속성: 반복상태 확인  </h3>
<!--  index:0부터 시작 count:1 부터 시작,first:처음여부,last : 마지막여부 -->
<c:forEach var="vo" items="${list}" varStatus="status">
	<p>
		${vo.name} | ${vo.age} | ${vo.tel} | ${vo.subject} |
		${status.index} | ${status.count} | ${status.first  } | ${status.last}
	</p>
</c:forEach>

</body>
</html>