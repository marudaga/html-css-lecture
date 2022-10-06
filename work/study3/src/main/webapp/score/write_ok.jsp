<%@page import="java.sql.SQLException"%>
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
	try{
		dao.insertScore(dto);
		//리다이렉트 : 로그인후, 로그아웃후, INSERT, UPDATE, DELETE 후
		response.sendRedirect("list.jsp");
		return;
	} catch(SQLException e){
		if(e.getErrorCode() ==1){
			request.setAttribute("msg","등록된 학번입니다.");
		} else if(e.getErrorCode() ==1840 || e.getErrorCode() ==1861){
			request.setAttribute("msg","날짜 형식이 올바르지않습니다");
		} else{
			request.setAttribute("msg","등록 실패.");
		}
	}
%>
<jsp:forward page="write.jsp"/>