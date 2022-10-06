<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>파라미터 전송 - post 방식 </h3>

<pre>
 - POST 방식으로 파라미터를 전송하면 body에 정보를 실어서 보냄
 - POST 방식은 용량에 제한이 없음
 - POST 방식은 form 태그의 method="post"를 통해서 전송됨
 - form 태그의 method="post" 의 기본 enctype 설정은
   enctype="application/x-www-form-urlencoded" 이다.
   application/x-www-urlencoded는 주소 형식으로 데이터를 인코딩해서 정보를 보낸다.
 - form 태그의 enctype 설정은 method="post" 에서만 유효하다.
 -쿠키는 캐시의 일종
 -클라이언트 정보를 서버에 저장 혹은 클라이언트에 저장
 -ex.오늘본 쇼핑목록:쿠키(사용자편리) ,로컬스토리지(로그인정보)
  
</pre>

<form action="ex02_ok.jsp" method="post">
	<p> 이름 : <input type="text" name="name"> </p>
	<p> 점수 : <input type="text" name="score"> </p>
	<p>
		<button type="submit">전송하기</button>
	</p>
</form>

</body>
</html>