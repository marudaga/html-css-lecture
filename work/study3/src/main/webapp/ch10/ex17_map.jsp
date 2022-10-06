<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Map<String, Object> m  = new HashMap<>();
	m.put("name", "이이이");
	m.put("age", 20);
	m.put("subject", "servlet");
	List<Map<String,Object>> list = new ArrayList<>();
	Map<String, Object> a;
	
	a = new HashMap<>();
	a.put("name", "가나다");
	a.put("city", "서울");
	list.add(a);
	
	a = new HashMap<>();
	a.put("name", "누누누");
	a.put("city", "경기");
	list.add(a);
	
	a = new HashMap<>();
	a.put("name", "마마마");
	a.put("city", "인천");
	list.add(a);
	
	request.setAttribute("map", m);
	request.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<jsp:forward page="ex17_ok.jsp"/>
</body>
</html>