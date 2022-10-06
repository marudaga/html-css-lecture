<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	 //post 방식으로 넘어온 피라미터의 인코딩 설정(파라미터를 받기전에 설정)
	 request.setCharacterEncoding("utf-8");

	//request.getParameter() : get, post방식으로 넘오온 파라미터 받기
	// : 리턴타입 - String
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String city = request.getParameter("city");
		// 존재하지 않는 파라미터는 null 을 반환
	String subject = request.getParameter("subject");
		// 동일한 이름으로 파라미터를 전송한 경우 getParameter()는 첫번째 파라미터만 받는다.
		// 동일한 이름으로 파라미터가 2개 이상인 경우 반드시 getParameterValues()로 받는다.
		//checkbox는 선택한 것이 없으면  null을 반환한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> get Parameter()로 클라이언트가 요청한 파라미터 받기</h3>

<p> 이름 : <%= name %> </p>
<p> 패스워드 : <%= pwd %> </p>
<p> 나이 : <%= age %> </p>
<p> 성별 : <%= gender %> </p>
<p> 출신도 : <%= city %> </p>
<p> 과목 : <%= subject %> </p>


</body>
</html>