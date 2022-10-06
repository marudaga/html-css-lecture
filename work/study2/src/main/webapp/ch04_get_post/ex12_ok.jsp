<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	//getParameterValues() : 리턴 타입 - String[]
	// : 리턴 타입 - String[]
	// : 동일한 이름으로 파라미터를 전송한 경우 반드시 getParameterValues() 로 파라미터 받는다.
	// : <select>의 multitple 속성을 준 경우에도 반드시 getParameterValues()로 파라미터 받는다
	String name = request.getParameterValues("name")[0];
	String pwd = request.getParameterValues("pwd")[0];
	String age = request.getParameterValues("age")[0];
	String gender = request.getParameterValues("gender")[0];
	String []ss = request.getParameterValues("subject");
	//checkbox, radio 는 선택항목이 없으면 
	//getParameterValues(), getParameter()모두 null
	
	String subject = "";
	//ss가 null 이면 for문을 못돌려서 error 
	if(ss != null){
		for(String s: ss){
			subject += s + " ";
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>getParameterValues</h3>

<p> 이름 : <%= name %> </p>
<p> 패스워드 : <%= pwd %> </p>
<p> 나이 : <%= age %> </p>
<p> 성별 : <%= gender %> </p>
<p> 과목 : <%= subject %> </p>

</body>
</html>