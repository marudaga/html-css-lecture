<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- web-inf(css,javascript,img등은 있으면안됨
	안에 있는 건 클라이언트에서 직접접근 불가 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<!-- HTML에서 주소의 가장 /는 https://localhost:9090 -->
<form action="/study2/ch05/demo" method="post">
	<p>이름 : <input type="text" name="name"></p>
	<p>나이 : <input type="text" name="age"></p>
	<p>
		<button type="submit">확인</button>
</form>

</body>
</html>