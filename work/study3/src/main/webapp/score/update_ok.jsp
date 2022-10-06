<%@page import="com.score.ScoreDAOImpl"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	
%>
<jsp:useBean id="dto" class="com.score.ScoreDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	ScoreDAO dao = new ScoreDAOImpl();

	String pageNum = request.getParameter("page");
	
	try{
		dao.updateScore(dto);
	} catch(Exception e){
	}
	
	response.sendRedirect("list.jsp?page="+pageNum);
%>