<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%--빈 생성 --%>
<jsp:useBean id="vo" class="ch05.user.User"/>

<%--생성된 빈에 속성(파라미터)값 설정 --%>
<%--property="*" 는 form input 요소의 name과 User클래스의  필드이름이 동일한 경우만 설정 --%>
<jsp:setProperty property="*" name="vo"/>

<%--form input 요소의 name과 User 클래스의 필드가 다른 경우 --%>
<jsp:setProperty property="num" param="no" name="vo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p> <%= vo.getNum() %></p>
<p> <%= vo.getName() %></p>
<p> <%= vo.getSubject() %></p>
<p> <%= vo.getAge() %>, <%= vo.getAge() >= 19 ? "성인":"초딩" %></p>

</body>
</html>