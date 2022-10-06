<%@page import="com.score.ScoreDAOImpl"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");

	ScoreDAO dao = new ScoreDAOImpl();
	
	String[] hh = request.getParameterValues("haks");
	String pageNum = request.getParameter("page");
	
try{
	dao.deleteScore(hh);
} catch(Exception e){
	
}

response.sendRedirect("list.jsp?page="+pageNum);

%>