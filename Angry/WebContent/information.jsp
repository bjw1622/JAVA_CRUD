<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="kr.ac.sunmoon.board.BoardService" %>
<%@ page import="kr.ac.sunmoon.user.UserService" %>
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
				alert("Please login..");
				location.href = 'login.jsp'
			</script>
	<%
		}
		
		UserService userService = new UserService();
		String messageCnt = userService.getMessageCnt(user_id);
		String replyCnt = userService.getReplyCnt(user_id);
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
						<th style="background-color: #f8ecc9; text-align: center;">나의 아이디</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><%=user_id%></td>
						</tr>
				</tbody>
				
				<thead>
					<tr>
						<th style="background-color: #f8ecc9; text-align: center;">게시글 수</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><%=messageCnt%></td>
						</tr>
				</tbody>
				
				<thead>
					<tr>
						<th style="background-color: #f8ecc9; text-align: center;">댓글 수</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><%=replyCnt%></td>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>