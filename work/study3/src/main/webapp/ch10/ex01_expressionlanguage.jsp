<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3>EL(Expression Language)</h3>

<h3> 사칙연산</h3>

<p>${ 3+5 }</p><!-- 8:long형 -->
<p>${ "3"+5 }</p><!-- 8:long형 -->
<p>${ "3"+"5" }</p><!-- 8:long형 -->

<p>${10/5 }</p><!--2.0:Double  -->
<p>${13/5 }</p><!--2.6:Double  -->
<p>${10 mod 5 }</p><!--3 int  -->
<p>${10 % 5 }</p><!--3 int -->
<p> EL에서 "A" + "B"의 결과는 에러,+로 문자열 결합안됨 </p>
<hr>

<h3>비교/논리 연산</h3>
<p> 3==4 : ${3==4 },3 eq 4 : ${ 3 eq 4 }</p>
<p> 3!=4 : ${3!=4 }</p>


<p> 3 &lt; 4 : ${3<4 },3 lt 4 : ${ 3 lt 4 }</p>
<p> 3 &gt; 4 : ${3>4 },3 gt 4 : ${ 3 gt 4 }</p>

<p> 3 &lt; 4 : ${3<=4 },3 le 4 : ${ 3 le 4 }</p>
<p> 3 &gt; 4 : ${3>=4 },3 ge 4 : ${ 3 ge 4 }</p>
<p> empty name : ${empty name}</p>
	<!-- name 속성이 없으므로 참 -->
	<!--  empty는 값이 null, 빈문자열, 길이가 0인 배열등은 true -->
<p>${10%2 ==0 ?"짝":"홀수" }</p>
<p> 논리 연산자 : not, and , or, !, &amp;&amp;, || </p>

<h3>기타 연산자</h3>
<p>문자열 결합 : +=, ${"서울" +="경기"}</p>
<p> ; 연산자 : a;b에서 a는 출력하지않고 b만 출력
<p> ${1+2;2+5}</p><!-- 7 -->

<p> 할당 연산자 : 할당 자체도 출력</p>
<p> ${a=10 } ${a }</p><!-- 결과 10 10  -->
<p>${a=10;a=20;a} </p><!-- 10 -->
</body>
</html>