<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
	
//포워딩된 페이지는 포워딩page에서 request, response객체에 전달, 클라이언트 모름
//파라미터의 정보를 알 수 있다.
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	//포워딩한 페이지에서 설정한 속성 값 받기
	String s = (String)request.getAttribute("result");
	//리턴 타입 : Object
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<p> 이름 : <%= name %></p>
<p> 나이 : <%= age %>,<%=s%></p>


</body>
</html>