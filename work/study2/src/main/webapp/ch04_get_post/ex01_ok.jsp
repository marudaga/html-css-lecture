<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	// 클라이언트가 보낸 요청 파라미터 받기
	// request : 요청 정보를 가지고 있는 JSP 내장객체
	
	String name = request.getParameter("name");

	// GET 방식
	//명등성 :  연산을 여러 번 적용하더라도 결과가 달라지지 않는 성질
	// :명등이 있어서 캐시가 된다.
	// :(검색할 때, 주소이동할때)
	// :명등성 있음(캐시를 가져옴(쓰레기 데이터 일 수있음)), post는 멱등성 없음 (db데이터 다시가져옴)
	//get은 인코딩해야됨 post는 안해도 브라우저가 해줌
	//tomcat: was
	// GET 방식으로 넘어온 인코딩된 파라미터를 디코딩하지 않으면 WAS 에 따라 한글이 깨질 수 있다.
	name = URLDecoder.decode(name, "utf-8");
	
	int age = Integer.parseInt(request.getParameter("age"));
	String city = request.getParameter("city"); // 보낸 파라미터가 없는 경우 null
	
	String result = age >= 19 ? "성인" : "미성년자";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>GET - 요청 정보(검색할 때, 주소이동할때)</h3>

<p>이름 : <%= name %> </p>
<p>나이 : <%= age %>, <%= result %> </p>
<p>출신도 : <%= city %> </p>


</body>
</html>