<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> 표현식 </h3>
<pre>
표현식(Expression) : (scriptlet에서 =추가한 것)
JSP페이지 내에서 사용되는 변수 또는 리턴값이 있는 메소드 결과값을 출력하기 위해 사용. 
결과값은 String 타입이며, 세미콜론 사용불가

	- 자바 코드의 결과를 클라이언트에게 전송하기 위해 사용
	- 표현식은 out.print(값); 형식의 자바 코드로 변환
	- 표현식은 서버측에서 실행되고 실행결과(문자열)을 클라이언트에게 전송 
</pre>
<hr>

<!-- 표현식 -->
<p>
	합 : <%= 1+2+3+4+5 %>
</p>

<p>
	<%
		// 스크립 릿(자바 코드)
		int n = 10;
		String result = n%2 == 0 ? "짝수" : "홀수";
	%>
	<%= n %>은 <%= result %> 입니다.
</p>


</body>
</html>