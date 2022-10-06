<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// scriptlet(java 코드 영역) - java 주석(자바 코드영역에서만 가능)
	int s = 0;
	for(int i=1; i<=100; i++) {
		s += i;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> JSP 주석 </h3>

<!-- HTML 주석(HTML remark) : 클라이언트에게 전송됨 -->
<%-- JSP 주석(JSP remark) : 클라이언트에게 전송되지 않음 --%>
<!-- 

 -->
<p> 1~100 까지의 합은 <%=s %> 입니다.</p>

</body>
</html>