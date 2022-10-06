<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

/* board */
.board { margin: 30px auto; width: 700px; }

.title { width:100%; font-size: 16px; font-weight: bold; padding: 13px 0; }

.table-form { margin-top: 20px; }
.table-form td { padding: 7px 0; }
.table-form tr:first-child {  border-top: 2px solid #212529; }
.table-form tr > td:first-child { width: 110px; text-align: center; background: #f8f9fa; }
.table-form tr > td:nth-child(2) { 	padding-left: 10px; }
.table-form input[type=text], .table-form input[type=file], .table-form textarea { width: 97%; }
.table-form input[type=password] { width: 50%; }
</style>
<script>
function sendOk() {
	const f = document.boardForm;

	if( ! f.name.value.trim() ) {
		f.name.focus();
		return;
	}
	
	if( ! f.content.value.trim() ) {
		f.content.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/guest/write_ok.do";
	f.submit();
}
</script>
</head>
<body>

<div class="board">
	<div class="title">
	<h3><span>|</span>방명록</h3>
	</div>
	<form name="boardForm" method="post">
		<table class="table table-border table-form">
			<tr>
				<td>작성자</td>
			</tr>
			<tr>
				<td>
					<input name="name" type="text" class="form-control" value="">
				</td>
			</tr>
			<tr>
				<td>내&nbsp;&nbsp;용</td>
			</tr>
			<tr>
				<td valign="top">
					<textarea name="content" class="form-control">${dto.content}</textarea>
					<!-- 위 태그는 value가 아닌 태그안에 입력 -->
					</td>
			</tr>
	</table>
	
	<div>
		<button type="button" class="btn" onclick="sendOk();">등록하기</button>
		<button type="reset" class="btn">다시등록</button>
	</div>
	</form>
	<table class="table">
	<c:forEach var="dto" items="${list}" varStatus="status">
		<thead>
			<tr>
				<td>${dto.name}</td>
				<td>${dto.reg_date}&nbsp;|</td>
				<td>
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/guest/delete.do';">삭제</button>
				</td>
			</tr>
			<tr>
			<td>${dto.content}</td>
			</tr>
		</thead>
	</c:forEach>
		
	</table>
</div>
<div class="page-navigation">
		${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
	</div>
</body>
</html>