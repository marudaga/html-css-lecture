<%@page import="ch05.calc.Calculator"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	Calculator calc = new Calculator();
	calc.setNum1(Integer.parseInt(request.getParameter("num1")));
	calc.setNum1(Integer.parseInt(request.getParameter("num2")));
	calc.setOperator(request.getParameter("operator"));
	
	String s = calc.toString();
	//NumberFormat dc = new NumberFormat.getCurrencyInstance()
			//숫자 3자리 마다 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>결과</h3>

<%= s %>
</body>
</html>