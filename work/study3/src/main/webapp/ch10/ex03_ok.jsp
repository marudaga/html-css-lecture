<%@page import="ch10.user.User"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<!-- 
	el의 주 사용목적은
	request, pageContext, session등에서 설정한 
	속성(attribute)을 출력(클라이언트에 전송)하기 위함
 -->

<h3>EL을 사용하지 않은 경우</h3>
<%
	User vv = (User)request.getAttribute("vo");
	String city = request.getParameter("city");
%>
<p>
	<%=vv.getName() %>, <%=vv.getAge() %>, <%=vv.getTel() %>,<%=vv.getSubject() %>
	<!--  필드값이 null 인 경우 null로 출력한다. -->
</p>
<p><%=city %></p>
<hr>

<h3>EL을 사용하여 출력</h3>
<p>
 ${vo.name}, ${vo.age}, ${vo.tel},${vo.subject} ${dto.city }
 <!--dto.city객체자체는 있는데 필드 값이 null인 경우 아무것도 출력하지 않는다.(attribute의 마지막 확인)(대소문자 주의**) -->
 <!-- city객체자체가 없으면 터짐 -->
</p>

<p>
	${param.city}
	<!-- 파라미터는 param이라는 내장 객체를 이용한다. -->
	<!--  request.getParameter("city") 와 유사 -->
</p>

</body>
</html>