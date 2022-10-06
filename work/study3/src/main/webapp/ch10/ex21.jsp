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

<h2> c:import 태그</h2>
<!-- 
	jsp:include 액션태그와 유사
	서버 내부 및 서버 외부 자원의 내용을 포함가능
 -->
 
 <h3> 내부 자원 포함</h3>
 <c:set var="a" value="ex11_JSTL_if.jsp" />
 <c:import var="u" url="${a}"/>
 <p><c:out value="${a}"/>소스보기</p>
 <c:out value="${u}"/>
 <hr>
 
 <p><c:out value="${a}"/>소스 실행결과 보기</p>
 <c:out value="${u}" escapeXml="false"/>
 <hr>
 
 <p> c:import에서 var속성을 지정하지 않으면 바로 실행결과 출력
 <c:import url="ex19.jsp"/>
 <hr>
 
 <h3>외부 자원 포함</h3>
 <c:set var="a" value="https://www.naver.com"/>
 <c:import var="u" url="${a}"/>
 <p>네이버 홈페이지</p>
 <c:out value="${u}" escapeXml="false"/>
 <hr>
 
 <p>네이버 소스보기</p>
 <c:out value="${u}"/>
 <hr>

</body>
</html>