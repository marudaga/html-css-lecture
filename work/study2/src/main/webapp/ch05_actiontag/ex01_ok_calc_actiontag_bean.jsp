<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	 request.setCharacterEncoding("utf-8");
	//id도 변수
	//int calc =10; userBean과 같은 이름을 사용불가 
%>
<jsp:useBean id="calc" class="ch05.calc.Calculator"></jsp:useBean>
<%-- Calculator calc = new Calculator();와 유사  --%>
<jsp:setProperty property="*" name="calc" />
<%--calc.setNum1(Integer.parseInt(request.getParameter("num1")));
	calc.setNum1(Integer.parseInt(request.getParameter("num2")));
	calc.setOperator(request.getParameter("operator"));
	의 역할을 함
	단.form태그의 input요소의 name 속성과 동일한 Calculator클래스의 필드에 값을 설정
	 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>결과 : jsp 액션 태그</h3>

	<p>
		<%= calc.toString() %>
	</p>
</body>
</html>