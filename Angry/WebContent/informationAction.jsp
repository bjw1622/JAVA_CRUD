<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import= "kr.ac.sunmoon.board.Message" %>
<%@ page import= "kr.ac.sunmoon.board.BoardService" %>
<%@ page import= "java.io.PrintWriter" %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String msg_title = request.getParameter("msg_title");
	String msg_content = request.getParameter("msg_content");
	String msg_id = request.getParameter("msg_id");
	
	BoardService service = new BoardService();
	service.updateMessage(msg_title, msg_content, msg_id,"");
	
	PrintWriter script = response.getWriter();
%>
</body>
</html>