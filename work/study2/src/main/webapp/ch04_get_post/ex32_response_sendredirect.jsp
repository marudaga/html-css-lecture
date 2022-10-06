<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>response 내장 객체 :응답(response)정보를 담은 객체</h3>
<!-- 
	-response :HttpServletResponse 객체
	- redirect 
	:redirect:다시 지시하다(접속하라고)
	: 웹컨테이너는 웹브라우저에게 주어진 페이지로 이동하라고 명령을 내린 (302응답신호를 보냄)
	-> 웹 브라우저는 주어진 주소의 새로운 페이지에 접속 함
	:resquest, response 객체가 초기화(객체 재생성)
	:redirect의 경우 : 로그인 후, 로그아웃 후, DB의 INSERT,UPDATE, DELETE후
	 

 -->
 <%
 	//response.sendRedirect("서버")
 	 response.sendRedirect("ex32_ok_response_sendredirect.jsp");
 %>
</body>
</html>