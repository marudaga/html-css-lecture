<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	int rows = 10;
	int cols = 15;
	
	int width = cols * 30 + 20 * (cols/5) + 30;
	if(cols/5 == 0) width -= 20;
	
	// String []cc = {"2:3","2:4","5:6","5:7", "8:2","8:3"};
	String []cc = {"B-3","B-4","E-6","E-7", "H-2","H-3"};
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

.reserve-container { margin:30px auto; width: <%=width%>px; }
.reserve-container table td { padding: 5px 0; }
.reserve-container .screen {
	width:100%;
	font-size: 15px;
	font-weight: 500;
	padding: 10px 0;
	text-align: center;
	background: #e4e4e4;
}
#
</style>

</head>
<body>

<div class="reserve-container">
	<div class="screen">
		스크린
	</div>
		<form action="reserveEx_ok.jsp" method="post" name="myForm" class="form-control">
			<table class="table-border table">
				<thead>
					<tr>
						<% for( int i=1; i<cols; i++) { %>
						<td><%=i%></td>
						<% }%>
					</tr>
				</thead>
				<tbody>
				<% for(char c='A';c<='J';c++){ %>
					<tr>
						<% for(int j=1;j<cols;j++){ %>
						<td><input  type="checkbox" name="chk" value="<%=c%>-<%=j%>" onclick="check(this);"></td>
						<% }%>
					</tr>
				<% }%>
				</tbody>
			</table>
		</form>
	
<script>
	
	
if(document.getElementsByName(chk)[i].nodeValue=='B-3'){
	document.getElementsByName(chk)[i].setattributes('disabled','disabled');
	document.getElementsByName(chk)[i].setattributes('checked','checked');
}
function check(obj){
	
}
</script>
</div>

</body>
</html>