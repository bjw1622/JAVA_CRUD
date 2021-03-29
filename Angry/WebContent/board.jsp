<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.sunmoon.board.BoardService" %>
<%@ page import="kr.ac.sunmoon.board.Message" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>�Ҹ��� ������!!</title>
</head>
<body>
	<%
		String user_id = (String)session.getAttribute("userId");
		if(user_id == null)
		{
	%>
			<script type="text/javascript">
				alert("");
				location.href = 'login.jsp'
			</script>
	<%
		}
	%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<nav class="navbar navbar-default">
		<div class="navbar-brand">
			<li><a href="main.jsp">�Ҹ��� ������</a></li></div>
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
				<li><a href="food.jsp">������(���)</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
					   data-toggle="dropdown">������
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="main.jsp">����</a></li>
						<li><a href="information.jsp">ȸ������</a></li>
						<li><a href ="logoutAction.jsp">�α׾ƿ�</a>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>