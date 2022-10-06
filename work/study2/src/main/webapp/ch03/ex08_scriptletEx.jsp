<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	int n = 0;
	int row = 10;
	int col = 10;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { margin: 0; padding: 0; box-sizing: border-box; }
.layout { margin: 30px auto 5px; width: <%= col*30%>px; }
.table { width:100%; border-spacing: 0; border-collapse: collapse; }
.table td { text-align: center; padding: 3px; }
</style>

</head>
<body>

<div class="layout">
	<form name="frm">
		<table class="table">
			<% for(int i=1; i<=row; i++) { %>
				<tr>
					<% for(int j=1; j<=col; j++) { %>
						<td>
							<input type="checkbox" name="chk" value="<%= ++n %>">
						</td>
					<% } %>
				</tr>
			<% } %>
		</table>
		
		<table class="table">
			<tr>
				<td style="text-align: right;">
					<button type="button" onclick="sendOk();">확인</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
function sendOk() {
	const f = document.frm;
	let cnt = 0;
	let arr = [];
	
	for(let i=0; i<f.chk.length; i++) {
		if(f.chk[i].checked) {
			cnt++;
			arr.push(f.chk[i].value);
		}
	}
	
	if(cnt === 0) {
		alert('선택 항목이 없습니다.');
		return;
	}
	
	alert( arr.join() );
	
}
</script>

</body>
</html>