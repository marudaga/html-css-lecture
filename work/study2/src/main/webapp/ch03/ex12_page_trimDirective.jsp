<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page buffer="1kb" autoFlush="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> page 지시어(directive) </h3>

<!-- 
  buffer 속성 : 출력할 버퍼의 크기. 기본 8kb
  :데이터를 한 곳에서 다른 한 곳으로 전송하는 동안 
  일시적으로 그 데이터를 보관하는 메모리의 영역
  autoFlush 속성 : 버퍼가 꽉 찬경우 버퍼를 비울지의 여부. 기본 true
 -->

<!-- 
	buffer의 크기를 1kb 주고 autoFlush="false"로 설정하면 아래 내용은 4kb가 넘으므로 오류가 발생
 --> 

<% for(int i=1; i<=1000; i++) { %>
1234
<% } %>

</body>
</html>