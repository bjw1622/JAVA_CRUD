<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" initial-scale="2">
<link rel="stylesheet" href="css/bootstrap.css">
<title>불만을 남겨줘!!</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
		<nav class="navbar navbar-default">
			<div class="navbar-brand">불만을 남겨줘</div>
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
					<li><a href="food.jsp">게시판</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" 
					   	data-toggle="dropdown">더보기
						<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
					</li>
				</ul>
			</div>
		</nav>
		
		<div class="container">
		<div class="jumbotron" style="padding-top:20px;">
			<h3 style="text-align: center;">로그인</h3>
			<form method="post" action="loginAction.jsp">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPw" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
			</form>
		</div>
	</div>
</body>
</html>