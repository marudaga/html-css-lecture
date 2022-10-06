<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String subject="자바";

	pageContext.setAttribute("msg", "안녕하세요");//속성을 설정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>pageContext 내장 객체 : JSP 페이지 실행에 필요한 context정보 가짐</h3>


<!-- pageContext.setAttribute(name,value)로 설정한 속성 가져오기-->
<p><%= pageContext.getAttribute("msg") %> </p>



<!-- 표현식으로 출력 -->
<p><%= subject %> </p>

<!-- 출력 -->
<p><% out.print(subject); %> </p>

<!--(비추) pageContext.getOut()메소드로 출력  -->
<p><% pageContext.getOut().print(subject); %> </p>

<!-- (비추)response.getWriter()메소드로 출력 -->
<p><% response.getWriter().print(subject); %> </p>


</body>
</html>