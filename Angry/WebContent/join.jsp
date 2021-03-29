<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		if(user_id != null)
		{
	%>
			<script type="text/javascript">
				location.href = 'main.jsp'
			</script>
	<%
		}
	%>
	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button class="navbar-toggle" 
			        data-target="#menu-items"
			        data-toggle="collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<div class="navbar-brand">불만을 남겨줘</div> 
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
						<li><a href="login.jsp">로그인</a></li>
						<li  class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align: center;">회원가입</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" 
					       name="userId" maxlength="20" required>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" 
					       name="userPw" maxlength="20" required>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" 
					       name="userName" maxlength="20" required>
				</div>
				<div class="form-group" style="text-align: center">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active" id="female_label">
							<input type="radio" name="userGender" value="Male" checked="checked">남자
						</label>
						<label class="btn btn-primary" id="male_label">
							<input type="radio" name="userGender" value="Female">여자
						</label>
					</div>
				</div>
				<div class="form-group">
					<input type="email" class="form-control" placeholder="이메일 주소" 
					       name="userEmail" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="회원가입">
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		var element = document.getElementById('female_label');
		var positionInfo = element.getBoundingClientRect();
		var width = positionInfo.width;
		document.getElementById('male_label').setAttribute("style","width:" + width + "px");
	</script>
	
</body>
</html>