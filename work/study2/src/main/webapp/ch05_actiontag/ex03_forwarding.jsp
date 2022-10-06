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

<h3>forward</h3>

<!-- 
	-클라이언트로부터 요청받은 서블릿(JSP)은 다르 서버의 자원(서블릿,JSP)으로 request하여 처리
	-포워딩 :서블릿 컨테이너안에서 이루어져 클라이언트는 몰루, 브라우저 주소줄도 바뀌지않음
	- request은 page는 포워딩 페이지(source)에 request,response객체에 그대로 전달
	- 요청받은 페이지가 포워딩한 페이지에 새로운 정보를 전달하기 위해서는 
	  request.setAttribute(name,value)을 이용한다.
	**  db에서 INSERT,UPDATE,DELETE한 후 에 포워딩하면 안됨 2번 진행됨
	 -->	
<form action="ex03_ok_forwarding.jsp" method="post">
	<p>이름 : <input type="text" name="name"> </p>
	<p>나이 : <input type="text" name="age"> </p>
	<p>
		<button>확인</button>
	</p>
</form>

</body>
</html>