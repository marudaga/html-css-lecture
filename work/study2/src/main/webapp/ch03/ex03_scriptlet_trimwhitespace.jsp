<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- 자바부분이 사라지면서 공백으로 남게 되는데 그부분을 제거 -->
    
<%!
	// 선언부 - 클래스의 선언부에 포함되는 코드 : 필드, 메소드 등
	int n; // 필드
	
	public int sum(int num) { // 메소드
		int s = 0;
		for(int i=1; i<=num; i++) {
			s += i;
		}
		return s;
	}
%>

<%
	// 스크립릿(scriptlet) : 자바의 메소드 코드 안에 포함되는 소스 - _jspService() 메소드에 포함됨
	//(scriptlet) : JSP페이지에서 JAVA언어를 사용하기 위한 요소 중 가장 많이 사용되는 요소.
	int a;

	// a++; // 에러. a가 초기화 되지 않음
	a = 0;
	a++;
	n++; // 필드는 초기화 하지 않으면 0으로 초기화
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p> 1~100 까지 합 : <%= sum(100) %> </p>

<p>
	선언부 변수 : <%= n %>
</p>

<p>
	스크립릿 변수 : <%= a %>
</p>

</body>
</html>