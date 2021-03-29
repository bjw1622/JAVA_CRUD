<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="kr.ac.sunmoon.board.BoardService" %>
<%@ page import="kr.ac.sunmoon.board.ReplyDAO" %>
<%@ page import="kr.ac.sunmoon.board.ReplyVO" %>
<%@ page import="kr.ac.sunmoon.board.Message" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/reply.css">
<title>불만을 남겨줘</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>
	function doReplyAction(action, msgId, replyId){ 
		var reply = document.getElementById("comment-input").value;
		location.href="./replyAction.jsp?msgId="+msgId+"&reply="+reply+"&actionType="+action+"&replyId="+replyId;
	} 

	</script>

	<nav class="navbar navbar-default">
		<div class="navbar-brand"><a href="main.jsp">불만을 남겨줘</a></div>
		<div class="navbar-header">
			<button class="navbar-toggle" 
			        data-target="#menu-items"
			        data-toggle="collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		
		<div class="collapse navbar-collapse" id="menu-items">
			<ul class="nav navbar-nav">
				<li><a href="food.jsp">게시글</a></li>
				<li><a href="User.jsp">검색</a></li>
				<li><a href="file.jsp">업로드</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
					   data-toggle="dropdown">더보기
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="information.jsp">회원정보</a></li>
						<li><a href ="logoutAction.jsp">로그아웃</a>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #f8ecc9; text-align: center;">리뷰 내용</th>
						</tr>
				</thead>
				<tbody>
				<%
					String msg_id = request.getParameter("msg_id");
				
					BoardService service = new BoardService();
					Message msg = service.getMessage(Integer.parseInt(msg_id)); // 굳이 msg_id를 하는이유는 겹치지 않는 유일한 값이니까??
				%>
					<tr>
						<td style="background-color: #f8ecc9; width: 20% border-right: 3px solid #f8ecc9;">제목</td>
						<td>
							<%= msg.getMsg_title() %>
						</td>
					</tr>
					<tr>
						<td style="background-color: #f8ecc9; width: 20% border-right: 1px solid #f8ecc9;">작성자</td>
						<td>
							<%= msg.getUser_id() %>
						</td>
					</tr>
					<tr>
						<td style="background-color: #f8ecc9; width: 20%  border-right: 1px solid #f8ecc9;">날짜</td>
						<td>
							<%= msg.getMsg_date() %>
						</td>
					</tr>
					<tr>
						<td style="background-color: #f8ecc9; width: 20% border-right: 1px solid #f8ecc9; min-height: 200px;" >리뷰 내용</td>
						<td style="text-align: left;">
							<%= msg.getMsg_content() %><br/>
							<%
							if(msg.getImage_file()!=null && !msg.getImage_file().isEmpty() && !msg.getImage_file().equals("null")) {
							%>
								<img class="fit-picture"  src="/upload/<%=msg.getImage_file()%>" width="400"/>
							<%
							}
							%>
						</td>
					</tr>
				</tbody>
			</table>
			
	<div id="form-commentInfo"> 
		<%
			ReplyDAO replyDao = new ReplyDAO();
			List<ReplyVO> replys = replyDao.selectReply(msg_id);%>	
		<div id="comment-count">댓글 <span id="count"><%=replys.size()%></span></div> 
		<input id="comment-input" placeholder="댓글을 입력해 주세요."> 
		<button id="submit" onclick="doReplyAction('insert', <%= msg.getMsg_id() %>, '');">등록</button> 
	</div>
	 <div id = "comments">
		<%
			for(ReplyVO reply : replys) {
		%>
			<div class ="eachComment">
		 		<div class = "name">
		 			<%= reply.getUserId() %>
		 			<%
			 			String userId = (String)session.getAttribute("userId");
			 			if(userId.equals(reply.getUserId())) { 
		 			%>
		 				<button class = "deleteComment" onclick="doReplyAction('delete', <%= msg.getMsg_id() %>, <%= reply.getReplyId() %>);">삭제</button>
		 			<%
			 			}
		 			%>
		 		</div>
		 		<span class="inputValue"><%= reply.getReply() %></span>
		 		<div class="time"> <%= reply.getReplyDate() %></div>
		 	</div>
		 <%
			}
		 %>
	 </div>
			
			<a href="food.jsp" class="btn btn-primary" style="background-color: #f8ecc9">리뷰 목록</a>
			<%
				String user_id = (String)session.getAttribute("userId");
				if(user_id != null)
				{
					String author_id = msg.getUser_id();
					if(author_id.equals(user_id))
					{
			%>
						<a href="deleteAction.jsp?msg_id=<%= msg.getMsg_id() %>" class="btn btn-primary" style="background-color: #f8ecc9">삭제</a>
						<a href="update.jsp?msg_id=<%= msg.getMsg_id() %>" class="btn btn-primary" style="background-color: #f8ecc9">수정</a>
			<%
					}
				}
			%>
			
		</div>
	</div>

</body>
</html>