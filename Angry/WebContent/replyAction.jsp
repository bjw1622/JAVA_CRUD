<%@page import="kr.ac.sunmoon.board.ReplyVO"%>
<%@page import="kr.ac.sunmoon.board.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String msgId = request.getParameter("msgId");
		String actionType = request.getParameter("actionType");
		String replyId = request.getParameter("replyId");
		String reply = request.getParameter("reply");
		String user_id = (String)session.getAttribute("userId");

		ReplyDAO replyDao = new ReplyDAO();
		if(actionType.equals("insert")) {
			ReplyVO replyVo = new ReplyVO();
			replyVo.setMsgId(Integer.parseInt(msgId));
			replyVo.setReply(reply);
			replyVo.setUserId(user_id);
			
			replyDao.insertReply(replyVo);
		} else if(actionType.equals("delete")) {
			replyDao.deleteReply(replyId);
		}
		
	%>
	
	<script type="text/javascript">
		location.href = 'view.jsp?msg_id=<%=msgId%>'
	</script>
	
</body>
</html>