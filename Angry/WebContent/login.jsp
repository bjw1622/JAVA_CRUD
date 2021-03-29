<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" initial-scale="2">
<link rel="stylesheet" href="css/bootstrap.css">
<title>�Ҹ��� ������!!</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
		<nav class="navbar navbar-default">
			<div class="navbar-brand">�Ҹ��� ������</div>
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
					<li><a href="food.jsp">�Խ���</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" 
					   	data-toggle="dropdown">������
						<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
						<li><a href="join.jsp">ȸ������</a></li>
					</ul>
					</li>
				</ul>
			</div>
		</nav>
		
		<div class="container">
		<div class="jumbotron" style="padding-top:20px;">
			<h3 style="text-align: center;">�α���</h3>
			<form method="post" action="loginAction.jsp">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="���̵�" name="userId" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="��й�ȣ" name="userPw" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="�α���">
			</form>
		</div>
	</div>
</body>
</html>