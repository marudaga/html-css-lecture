<%@page import="ch10.user.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	 request.setCharacterEncoding("utf-8");

	List<User> list = new ArrayList<>();
	
	list.add(new User("홍길동",20,"010-1111-1111", "자바"));
	list.add(new User("너너너",21,"010-1111-2222", "오라클"));
	list.add(new User("도도도",21,"010-1111-3333", "HTML"));
	list.add(new User("가가가",20,"010-1111-1000", "CSS"));
	list.add(new User("후후후",23,"010-1111-2000", "Javascript"));
	
	request.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<jsp:forward page="ex16_ok.jsp"/>

</body>
</html>