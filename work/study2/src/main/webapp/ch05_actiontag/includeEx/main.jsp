<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%--자바스크립트에서 에러없는데 있다고 뜰수있다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>

<div class="main-container">
	<div class="header">
		<jsp:include page="header.jsp"/>
	</div>
	
	<div class="body-container">
		<h3>메인 화면</h3>
		
		<p>
			메인 화면입니다.
		</p>
	</div>
	
	<div  class="footer">
		<jsp:include page="footer.jsp"/>
	</div>
	
</div>
</body>
</html>