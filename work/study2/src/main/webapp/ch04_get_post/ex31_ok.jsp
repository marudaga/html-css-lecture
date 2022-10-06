<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String method = request.getMethod();//중요 **
String scheme = request.getScheme();
String cp = request.getContextPath();//중요 **
String requestURI = request.getRequestURI();//중요 **
StringBuffer requestURL = request.getRequestURL();
String query = request.getQueryString();//이거말고 getparameter로 받으면됨

String Protocol = request.getProtocol();
String serverName = request.getServerName();
int serverPort = request.getServerPort();
String remoteAddr = request.getRemoteAddr();//중요 **

String agent = request.getHeader("User-Agent");//중요 **
String fileType = request.getHeader("Accept");
String referer = request.getHeader("Referer");
if(referer ==null){
	referer = "";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>request 정보</h3>

<p>path 정보</p>
<p>method : <%= method %></p>
<p>method : <%= scheme %></p>
<p>Context Path: <%= cp %></p>
<!-- 서버하나(프로젝트명)(Get/Post 등 method) -->
<p>request URI : <%= requestURI%></p>
<!-- request URI: cp부터 Query String이전까지의 주소 -->
<p>request URL: <%= requestURL.toString()%></p>
<!--request URL: QueryString전까지의 주소 -->
<p>Query String : <%= query %></p>
<!-- Query String : Get방식으로 전송한 전체 파라미터 -->

<hr>
<p>server 정보</p>
<p>Protocol : <%= Protocol %></p>
<!-- HTTP/1.1 -->
<p>serverName : <%= serverName %></p>
<!-- localhost -->
<p>serverPort : <%= serverPort %></p>
<!-- 포트번호 -->
<p>접속한 클라이언트 ip: <%= remoteAddr %></p>
<!-- header/공백라인/본문 순으로 정보를 가져옴 -->
<hr>

<p>header 정보 </p>
<p>agent: <%= agent %></p><!-- 클라이언트 브라우저, OS 등 정보  -->
<p>fileType: <%= fileType %></p><!--  -->
<p>referer: <%= referer %></p><!-- 이 사이트 이전 주소 -->
<hr>


</body>
</html>