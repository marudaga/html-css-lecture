<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.NumberFormat"%>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String birth = request.getParameter("birth");
int byear = Integer.parseInt(birth.substring(0,4));

String phone = request.getParameter("phone");
int Isalary = Integer.parseInt(request.getParameter("salary"));
int Ibonus = Integer.parseInt(request.getParameter("bonus"));

String t="";
//띠
String[] arr = { "원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양" };
for(int i=0; i<=11; i++)
{
	if(byear % 12 == i)
	{
		t = arr[i];
	}
}
//나이
Calendar now = Calendar.getInstance();
int nowYear = now.get(Calendar.YEAR);
int age = nowYear-byear+1;
//세금
DecimalFormat decFormat = new DecimalFormat("###,###");
int Itax=0;
if((Isalary+Ibonus)>=3000000){
	Itax = (int)((Isalary+Ibonus)*0.03);
}else if((Isalary+Ibonus)>=2000000){
	Itax = (int)((Isalary+Ibonus)*0.02);
}else Itax=0;
String tax = decFormat.format(Itax);
//실급여
int Iactualsal = Isalary+Ibonus-Itax;
String actualSal = decFormat.format(Iactualsal); 
//salary
String salary = decFormat.format(Isalary);
//bonus
String bonus= decFormat.format(Ibonus);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body {
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 14px;
	color: #222;
}

a { color: #222; text-decoration: none; cursor: pointer; }
a:active, a:hover { color: #f28011; text-decoration: underline; }

/* form-control */
.btn {
	color: #333;
	border: 1px solid #999;
	background-color: #fff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.btn:active, .btn:focus, .btn:hover {
	background-color: #f8f9fa;
	color:#333;
}
.btn[disabled], fieldset[disabled] .btn {
	pointer-events: none;
	cursor: default;
	opacity: .65;
}

.form-control {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-select[readonly] { background-color:#f8f9fa; }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }

/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #212529; border-bottom: 1px solid #ced4da; }
.table-border tbody > tr { border-bottom: 1px solid #ced4da; }
.table-border tfoot > tr { border-bottom: 1px solid #ced4da; }
.td-border td { border: 1px solid #ced4da; }

.container { width: 500px; margin:30px auto; }

.title { width:100%; font-size: 16px; font-weight: bold; padding: 13px 0; }

.table-article td {border: 1px solid #ced4da; }
.table-article tr > td:first-child {
	text-align: center; background: #f8f9fa; width: 100px; text-align: right; padding-right: 10px; }
.table-article tr > td:nth-child(2) { padding-left: 10px; }
</style>

</head>
<body>

<div class="container">
	<div class="title ">
	    <h3><span>|</span> 인사관리</h3>
	</div>
	<form class="form-control" name="Form" action="insa_ok.jsp" method="post"></form>
	<table class="table table-article" border="1px solid gray" style="border-collapse: collapse">
		<tbody>
			<tr>
				<td>이름</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><%=byear %></td>
			</tr>
			<tr>
				<td>띠</td>
				<td><%=t %></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%=age %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=phone %></td>
			</tr>
			<tr>
				<td>기본급</td>
				<td><%=salary %></td>
			</tr>
			<tr>
				<td>수당</td>
				<td><%=bonus %></td>
			</tr>
			<tr>
				<td>세금</td>
				<td><%=tax %></td>
			</tr>
			<tr>
				<td>실급여</td>
				<td><%=actualSal %></td>
				<!--<td name="actualSal"><%=actualSal %></td>  -->
			</tr>
		</tbody>
	</table>
	
</div>	

</body>
</html>