<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h2> functions 태그(비추 java로 가능함)</h2>

<c:set var="str" value="seoul korea"/>

<p>${fn:contains(str,"kor") ? "kor존재" : "kor없음" }</p>
<p>${fn:containsIgnoreCase(Str, "KOR") ? "kor존재" : "kor없음" }</p>
<p>${fn:startsWith(str,"seoul") ?"seoul로 시작" : "seoul로 시작하지않음" }
<p>${fn:endsWith(str,"korea") ? "korea로 끝" : "korea로 끝나지않음 "}
<p> kor의 위치 : ${fn:indexOf(str,"kor") }</p>
<p> substring(str, 6,9) : ${fn:substring(str,6,9) }</p>
<p> substringAfter(str, "seoul") : ${fn:substringAfter(str,"seoul") }</p>
<p> substringBefore(str, "korea") : ${fn:substringBefore(str,"korea") }</p>
<p> length(str) : ${fn:length(str) }</p>
<p>replace(str,"korea", "한국") : ${fn:replace(str, "korea", "한국") }</p>
<p> 대문자로 ${fn:toUpperCase(str) } </p>


</body>
</html>