<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="kr.ac.sunmoon.board.BoardService" %>
<%@ page import="kr.ac.sunmoon.board.Message" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>불만을 남겨줘</title>
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
		
		BoardService service = new BoardService();
		Message msg = service.getMessage(Integer.parseInt(request.getParameter("msg_id")));
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
						<li><a href="information.jsp">회원정보</a></li>
						<li><a href ="logoutAction.jsp">로그아웃</a>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<form method="post" action="updatedAction.jsp?msg_id=<%= msg.getMsg_id() %>" enctype="multipart/form-data">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan ="2" style="background-color: #eeeeee; text-align: center;">업데이트 메세지</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan ="2">
								<input type="text" class="form-control" placeholder="Title" name="msg_title" maxlength="50" value="<%= msg.getMsg_title() %>">
							</td>
						</tr>
						<tr>
							<td colspan ="2">
								<textarea class="form-control" placeholder="Content" name="msg_content" maxlength="2048" rows="10"><%= msg.getMsg_content() %></textarea>
							</td>
						</tr>
						<tr>
							<td style="background-color: #f8ecc9; width:15%; border-right: 3px; solid: #f8ecc9;">이미지 파일 변경</td>

							<td>
								 <input type="file" name="imageFile" accept="image/*">
							</td>
						</tr>
					</tbody>
				</table>
				<input type="submit"  style="background-color: #f8ecc9" style="color: red" class="btn btn-primary pull-right"  value="수정">
			</form>
		</div>
	</div>
</body>
</html>