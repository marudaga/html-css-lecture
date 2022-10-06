<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	String s = "";

	int n1 = Integer.parseInt(request.getParameter("num1"));
	int n2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("operator");
	
	//if(op == "+") ->객체가 같은지 확인(항상false나옴)(다른객체니까)
	//equlas를 사용해야 문자열을 비교가능 operator.equals("+"){}
		
	try{
		switch(op){
		case "+" : s = String.format("%d + %d = %d", n1, n2, n1+n2); break;
		case "-" : s = String.format("%d - %d = %d", n1, n2, n1-n2); break;
		case "*" : s = String.format("%d * %d = %d", n1, n2, n1*n2); break;
		case "/" : s = String.format("%d / %d = %d", n1, n2, n1/n2); break;
		}
	} catch(ArithmeticException e){
		s = "연산이 불가합니다.";
	} catch(Exception e){
		s = "오류입니다.";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p><%= s %></p>
</body>
</html>