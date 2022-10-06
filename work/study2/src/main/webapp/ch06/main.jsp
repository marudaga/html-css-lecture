<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<h3>에러 코드별 에러 처리</h3>
<!-- 
	response.setStatus(HttpServletResponse.SC_OK);
	//에러가 발생할 때 출력되는 페이지가 아닌 정상페이지로 설정


 -->

<!-- error폴더는 예시 web.xml참고-->
<!--  web.xml에 추가 사항 -->
<!-- 에러 코드별 에러 처리 -->
	<!--  
	<error-page>
		<error-code>404</error-code>
		<location>/error/error404.jsp</location>
	</error-page>
	<error-page>
		<error-code>500</error-code>
		<location>/error/error500.jsp</location>
	</error-page>
	-->
<p>
	<a href="user.jsp">확인 1</a>
</p>
<p>
	<a href="test.jsp">확인 2</a>
</p>
</body>
</html>