<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="kr.ac.sunmoon.board.BoardService" %>
<%@ page import="kr.ac.sunmoon.board.Message" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>불만을 남겨줘!!</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<%
		String user_id = (String)session.getAttribute("userId");
		if(user_id == null)
		{
	%>
			<script type="text/javascript">
				alert("로그인 해주세요!");
				location.href = 'login.jsp'
			</script>
	<%
		}
	%>
	
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
				<li class="active"><a href="food.jsp">게시글</a></li>
				<li><a href="User.jsp">검색</a></li>
				<li><a href="file.jsp">업로드</a></li>
			</ul>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
					   data-toggle="dropdown">더보기
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="information.jsp">회원정보</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
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
						<th style="background-color: #f8ecc9; text-align: center;">번호</th>
						<th style="background-color: #f8ecc9; text-align: center;">제목</th>
						<th style="background-color: #f8ecc9; text-align: center;">작성자</th>
						<th style="background-color: #f8ecc9; text-align: center;">작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardService service = new BoardService();
						ArrayList<Message> msgs = service.getMessages();
						for(int i=0; i<msgs.size(); i++)
						{
							Message msg = msgs.get(i);
							
					%>
						<tr>
							<td><%= msg.getMsg_id() %></td>
							<td><a href="view.jsp?msg_id=<%= msg.getMsg_id() %>"><%= msg.getMsg_title() %></a></td>
							<td><%= msg.getUser_id() %></td>
							<td><%= msg.getMsg_date() %></td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			
			<a href="write.jsp" style="background-color: #f8ecc9" style="color: red" class="btn btn-primary pull-right">글쓰기</a>
			
		</div>
	</div>
</body>
</html>