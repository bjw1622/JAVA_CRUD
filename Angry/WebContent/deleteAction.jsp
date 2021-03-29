<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="kr.ac.sunmoon.board.BoardService" %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String msg_id = request.getParameter("msg_id");
		
		BoardService service = new BoardService();
		service.deleteMessage(msg_id);
	%>
	
	<script type="text/javascript">
		location.href = 'food.jsp'
	</script>
	
</body>
</html>