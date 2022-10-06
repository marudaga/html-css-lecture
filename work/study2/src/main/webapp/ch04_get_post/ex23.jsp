<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>폼 : disabled속성의 객체는 서버에 전송되지 않는다.</h3>

<form action="ex23_ok.jsp" method="post">
	<p>번호 : <input type="text" name="num" value="1111" readonly="readonly"> </p>
	<p>이름 : <input type="text" name="name"> </p>
	<p>나이 : <input type="text" name="age" value="20" disabled="disabled"> </p>
	<p>
		<input type="hidden" name="id">
		<button type="submit">확인</button>
	</p>

</form>
</body>
</html>