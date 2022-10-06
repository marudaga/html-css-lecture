<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>
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

/* container */
.container { margin: 100px auto 10px; width: 300px; }

.title { font-weight: bold; font-size: 16px; }

.table-form td { border: 1px solid #ced4da;; text-align: center; }
.table-form tr:first-child { background: #f8f9fa; }

.msg-box { color: #dc3545; }
</style>
</head>

<body>
<div class="container">
	<form method="post" action="${pageContext.request.contextPath}/bbs/pwd_ok.do">
	<table class="table table-form">
		<tr>
			<td>
				<span class="title">게시물 ${mode=="update"?"수정":"삭제"}</span>
			</td>
		</tr>
			
		<tr>
			<td>
				패스워드 &nbsp;:&nbsp;
				<input type="password" name="pwd" maxlength="10" class="form-control" placeholder="패스워드">
			</td>
		</tr>
	</table>
	
	<table class="table">
		<tr align="center">
			<td>
			  <button type="submit" class="btn">확 인</button>&nbsp;
			  <button type="button" class="btn"
			               onclick="location.href='${pageContext.request.contextPath}/bbs/list.do';">취 소</button>

	          <input type="hidden" name="mode" value="${mode}">
	          <input type="hidden" name="num" value="${num}">
	          <input type="hidden" name="page" value="${page}">
	          <input type="hidden" name="condition" value="${condition}">
	          <input type="hidden" name="keyword" value="${keyword}">
			</td>
		</tr>
	</table>
	</form>

	<table class="table">
		<tr align="center">
			<td><span class="msg-box">${message}</span></td>
		</tr>
	</table>
</div>
	
</body>
</html>