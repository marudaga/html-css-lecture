<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>폼 예제</h3>

<form action="ex21_ok.jsp" method="post">
	<p>이름 : <input type="text" name="username"></p>
	<p>학벌 : <input type="text" name="stdId"></p>
	<p>성별 :
			남자<input type="radio" name="gender" value="M">
			여자<input type="radio" name="gender" value="F" checked='checked'>
	</p>
	<p>좋아하는 과목
		<input type="text" name="subject">
		<input type="text" name="subject">
		<input type="text" name="subject">
	</p>
	<p>출신도 : 
		<select name="city">
			<option value="">::선택::</option>
			<option value="서울">서울시</option>
			<option value="인천">인천</option>
			<option value="경기">경기도</option>
			<option value="대구">대구</option>
			<option value="기타">기타</option>
		</select>
	</p>
	<p>
		취미 : 
		<select name="hobby" multiple="multiple" size="5">
		 	<option value="운동">운동</option>
			<option value="영화">영화</option>
			<option value="등산">등산</option>
			<option value="무등산">무등산</option>
			<option value="음악">음악</option>
		</select>
	</p>
	<p>
		<button type="submit">보내기</button>
	</p>
</form>
</body>
</html>