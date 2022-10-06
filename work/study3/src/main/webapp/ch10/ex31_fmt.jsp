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

<h2> JSTL -fmt 태그 : 숫자, 날짜, 시간을포맷팅하는 기능과 국제화, 다국어 지원 기능</h2>

<p>default locale : <%= response.getLocale() %></p>
<p>default locale : ${pageContext.response.locale}</p>
<!-- 지역
locale 로케일 -->

<h3>통화기호</h3>
<p> 디폴트(한국) : <fmt:formatNumber value="12345.6789" type="currency"/> </p>

<p>
	<fmt:setLocale value="en_US"/>
	통화 : <fmt:formatNumber value="12345.6789" type="currency"/>
			<!-- $12,345,678 -->
</p>

<p>
	<fmt:setLocale value="ko_KR"/>
	통화 : <fmt:formatNumber value="12345.6789" type="currency"/>
</p>
<hr>

<h3>숫자</h3>
<p> number : <fmt:formatNumber value="12345.6789" type="number"/></p>
<p> currency : <fmt:formatNumber value="12345.6789" type="currency"/></p>
<p> currency : <fmt:formatNumber value="12345.6789" type="currency" currencySymbol="W"/></p>
<p> percent : <fmt:formatNumber value="0.756" type="percent"/></p>
<p> pattern=".0 : <fmt:formatNumber value="12345.6789" pattern=".0"/></p>
<p> number : <fmt:formatNumber value="12345.6789" pattern="#,##0.0"/></p>
<p> number : <fmt:formatNumber value="0.6789" pattern="#,##0.0"/></p>
<p> number : <fmt:formatNumber value="0.6789" pattern="#,##0.0"/></p>
<p> number : <fmt:formatNumber value="12345.6789" pattern="￦#,##0.0"/></p>
<!-- #숫자있으면 나오고 없으면 안나옴 -->
<hr>
<h3>날짜</h3>
<c:set var="now" value="<%= new java.util.Date() %>"/>
<p> ${now}</p>
<p> date : <fmt:formatDate value="${now}" type="date"/> </p>
<p> time: <fmt:formatDate value="${now}" type="time"/> </p>
<p> both : <fmt:formatDate value="${now}" type="both"/> </p>

</body>
</html>