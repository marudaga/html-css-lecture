<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//action태그 : <jsp:?>형태로 ?에는 useBean(), setProperty, include(jsp 내용추가),forwarding(포워딩)
//포워딩()
</script>
</head>
<body>

	<h3>계산기</h3>
	<form action="ex01_ok_calc.jsp" method="post">
		<p>
			<input type="text" name="num1" required pattern="\d+">
			<!-- name속성의 이름은 2글자까지 소문자만 넣기 -->
			<select name="operator">
				<option value="+">더하기</option>
				<option value="-">빼기</option>
				<option value="*">곱하기</option>
				<option value="/">나누기</option>
			</select>
			<input type="text" name="num2" required pattern="\d+">
			<button type="submit"> = </button>
		</p>
		<a></a>
	</form>
</body>
</html>