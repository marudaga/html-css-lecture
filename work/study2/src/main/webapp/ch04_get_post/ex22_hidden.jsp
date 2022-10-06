<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>hidden 객체</h3>

<!-- 
	hidden 객체는 text객체와 유사하지만 화면에 표시안하지만 서버에 정보전송
 -->

<form action="ex22_ok.jsp" method="post">
	<p>
		<input type="text" name="num1" placeholder="첫번째수">
		<input type="text" name="num2" placeholder="두번째수">
		<input type="hidden" name="operator">
	</p>
	<p>
		<button type="button" onclick="send('+');">합</button>
		<button type="button" onclick="send('-');">차</button>
		<button type="button" onclick="send('*');">곱</button>
		<button type="button" onclick="send('/');">몫</button>
	</p>
</form>

<script>
	function send(oper){
		const f = document.forms[0];
		
		if( !/^(\d+)$/.test(f.num1.value)){
			f.num1.focus();
			return;
		}

		if( !/^(\d+)$/.test(f.num2.value)){
			f.num2.focus();
			return;
		}

		f.operator.value = oper;

		f.submit();
		
	}
</script>
</body>
</html>