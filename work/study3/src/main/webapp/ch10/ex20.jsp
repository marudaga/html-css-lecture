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

<h2> c:url, c:param태그</h2>
<!-- 
	* c: url태그
		- url을 만들며 URL 인코딩 또는 URL 형식 지정에 사용
		- context path가 자동으로 추가
		-get방식에서는 인코딩과 디코딩과정 거쳐야함
	* c: param 태그
		-c:import, c:url태그에 파라미터를 전달하기 위해 사용
 -->
 
 <!-- 파라미터를 인코딩하여 주소를 만든다. -->
 <c:url var="a" value="ex20_ok.jsp">
 	<c:param name="name" value="홍길동"/>
 	<c:param name="age" value="20"/>
 </c:url>
 
 <p>
 	<a href="${a}">확인</a>
 	<!-- 주소가 ex20_ok.jsp;jsessionid=B2180D0A8092433C1C52F87DE1437076?name=%ed%99%8d%ea%b8%b8%eb%8f%99&age=20
 			로 변경되어잇음 -->
 </p>
</body>
</html>