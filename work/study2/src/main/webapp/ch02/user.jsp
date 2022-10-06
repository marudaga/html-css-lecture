<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- HTML에서 / 는 http://localhost:9090 이다. -->
<!-- form의 action 속성 : 클라이언트가 서버에게 요청할 주소 -->
<!-- form의 method 속성 : 메소드 방식 설정(기본:get) -->
<form action="/study2/user" method="post">
	<p> 이름 : <input type="text" name="name"> </p>
	<p> 나이 : <input type="text" name="age"> </p>
	<p>
		<button type="submit">보내기</button>
	</p>
</form>


</body>
</html>