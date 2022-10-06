<%@ page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>파라미터 인코딩 - GET 방식</h3>

<pre>
  - GET : 기본 파라미터 전송 방식
    기본적으로 클라이언트가 서버에 접속하면 파라미터 전송 방식은 GET 방식이다.
  - Query String : GET 방식으로 전송되는 파라미터
  - 주소줄에 파라미터를 실어서 보냄
   <%--  형식 : 주소?이름1=값&이름2=값2&이름3=값 --%>  
</pre>

<p> a 태그를 이용하여 GET 방식으로 파라미터 전송 </p>
<p>
	<!-- 한글을 인코딩하지 않고 GET 방식으로 전송 : IE는 에러가 발생 -->
	<a href="ex01_ok.jsp?name=이자바&age=20">확인</a> | 
	
	<!-- 자바를 이용하여 한글 인코딩 -->
	<a href="ex01_ok.jsp?name=<%= URLEncoder.encode("홍길동", "UTF-8")%>&age=20">확인</a>
</p>
<hr>

<p> 자바 스크립트를 이용하여 GET 방식으로 파라미터 전송 </p>
<p>
	<button type="button" onclick="send()">확인</button>
</p>

<script type="text/javascript">
function send() {
	let name = "김&바";
	let age = 17;
	
	// name을 인코딩하지 않고 서버로 전송하면 크롬은 "김" 만 전달되므로 반드시 인코딩이 필요
	name = encodeURIComponent(name); // 주소형식으로 인코딩
	
	location.href="ex01_ok.jsp?name="+name+"&age="+age;
}
</script>

</body>
</html>