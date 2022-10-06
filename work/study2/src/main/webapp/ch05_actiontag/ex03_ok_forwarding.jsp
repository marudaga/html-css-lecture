<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	int age = Integer.parseInt(request.getParameter("age"));
	String s = age >=19? "성인" : "미성년자";
	
	//포워딩하는 페이지에 새로운 정보전달
	request.setAttribute("result", s);
		//request.setAttribute(String, Object)
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3>포워딩하면 이페이지는 클라이언트 화면에 안보임</h3>

<!-- jsp 액션태그를 이용한 포워딩 -->
<jsp:forward page="ex03_result.jsp"/>

</body>
</html>