<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
	//jsp:param 액션 태그로 넘긴 파라미터는 request.getParameter()로 받는다.
	String menuItem = request.getParameter("menuItem");
	if(menuItem == null) menuItem = "";

%>

<ul>
	<li><a href="main.jsp" class="menu-item">홈</a></li>
<% if(menuItem.equals("guest")){ %>
	<li style="font-weight:bold;">방명록</li>
<% } else { %>
	<li><a href="guest.jsp" class="menu-item">방명록</a></li>
<% } %>
	<li><a href="bbs.jsp" class="menu-item">게시판</a></li>
	<li><a href="#" class="menu-item">공지사항</a></li>
	<li><a href="#" class="menu-item">일정관리</a></li>
</ul>