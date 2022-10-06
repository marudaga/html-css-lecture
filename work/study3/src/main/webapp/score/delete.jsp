<%@page import="com.score.ScoreDAOImpl"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String hak = request.getParameter("hak");
	String pageNum = request.getParameter("page");
	
	ScoreDAO dao = new ScoreDAOImpl();
	
	try{
		dao.deleteScore(hak);
	} catch(Exception e){
	}
	
	response.sendRedirect("list.jsp?page="+pageNum);
	
%>