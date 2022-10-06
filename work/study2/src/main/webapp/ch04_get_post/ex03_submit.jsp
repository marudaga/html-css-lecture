<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>submit</h3>
<%--
	- submit 버튼은 form 태그 안에 있어야 서버로 form 태그 안의 파리미터로 전송한다.
	- submit 버튼 종류
	<button>전송</button>
	<button type="submit">전송</button>
	<input type="submit" value="전송">
	<input type="image" src="이미지">
	input의 submit,image는 전송할때 사용하면 db에 정보를 2번 보냄
	input 요소의 required속성과 pattern 속성은 form 태그안에 submit 버튼으로 요청할 때만 유효
	-reset 버튼(form태그 안에 있어야함)
	value속성 갑으로 초기화
	
--%>

<form action="ex03_ok.jsp" method="post">
	<p> 이름 : <input type="text" name="name" required></p>
	<p> 나이 : <input type="text" name="age" required pattern="\d{1,3}"> </p>
	<p>
		<button>전송</button>
		<button type="submit">전송</button>
		<input type="submit" value="전송">
		<input type="image" src="btn_submit.gif" style="vertical-align:bottom;"> |
		<button type="button">일반버튼-전송안됨</button>
		<button type="reset">초기화</button>
	</p>
</form>

<hr>

<!-- 
	<input type="text" name="age"> 가 하나만 있고 
		form태그안에 있으면	서버로 전송됨
	-<input type="text" style="display:none;">하나더 만들고 display:none;화면에서 없애야함
 -->
<form action="ex03_ok.jsp" method="post">
	<p> 이름 : <input type="text" name="name" required> </p>
	<p> 나이 : <input type="text" name="age" pattern="\d+"></p>
	
	<input type="text" style="display:none;">
	<p>
	<button type="button" onclick="sendOk();">일반버튼</button>
	</p>
	
	<script type="text/javascript">
		function sendOk(){
			const f = document.forms[1];
			if(!/^(\d){1,3}$/.test(f.age.value)){
				f.age.focus();
				return;
			}
			
			f.submit();
		}
	</script>
</form>
</body>
</html>