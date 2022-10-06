<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//자바코드
	request.setCharacterEncoding("utf-8");//post 방식으로 전송된 한글 인코딩 설정
	
	// 클라이언트가 보낸 파라미터 받기
	String name = request.getParameter("name");
	String subject = request.getParameter("subject"); 
	int s = Integer.parseInt(request.getParameter("score"));
	//subject 파라미터(받을 매개변수) 없으면 null
	
	String result;
	result = s >= 80 ? "우수" : "노력";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> 크라이언트가 보낸 정보</h3>

<p>이름 :  <%= name %> </p>
<p>과목 :  <%= subject %> </p>
<p>점수 :  <%= s %>, <%= result %> </p>

</body>
</html>