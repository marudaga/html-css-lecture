<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>submit : submit 버튼 이외의 element를 이용하여 전송</h3>


<form name="myForm" action="ex04_ok.jsp" method="post">
	<p> 이름 : <input type="text" name="name" ></p>
	<p> 나이 : <input type="text" name="age"> </p>
	<p>
		<button type="button" onclick="sendOk();">전송</button>
		<button type="reset">초기화</button>
	</p>
</form>


	<script>
		function sendOk(){
			const f = document.myForm;
			
			if(! f.name.value){
				f.name.focus();
				return;
			}
			
			if(!/^(\d){1,3}$/.test(f.age.value)){
				f.age.focus();
				return;
			}
			
			f.action = "ex04_ok.jsp";
			f.submit();
			//submit버튼에서 submit()함수를 호출하면 서버로 두번 전송됨
			//submit버튼이나 이미지 버튼에서는 절대로 submit()함수를 전송으로 사용x
		}
	</script>

</body>
</html>