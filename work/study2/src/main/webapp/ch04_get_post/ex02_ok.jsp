<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// POST 방식으로 넘어온 파라미터의 인코딩 설정(주소안보임)
	//회원가입 ,로그인, 게시판 글쓸때, 상품결제(되돌리기안됨)
	// POST 방식에서는 파라미터를 받기 전 반드시 아래처럼 문자 인코딩을 설정해야 하며,
	//      설정하지 않으면 한글이 깨진다.
	//insert, update,delete는 post(데이터)
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int score = Integer.parseInt(request.getParameter("score"));
	String result = score>=80 ? "우수" : "노력";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>파라미터 받기 - post</h3>
<p> 이름 : <%= name %> </p>
<p> 점수 : <%= score %>, <%= result %> </p>

</body>
</html>