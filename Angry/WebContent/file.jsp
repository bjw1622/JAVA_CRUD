<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>불만을 남겨줘!!</title>
</head>
<body>
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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
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
				<li class="active"><a href="file.jsp">업로드</a></li>
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
	<form action = "uploadAction.jsp" method="post" enctype="multipart/form-data">
		파일 :<input type ="file" name="file"><br>
		<input type="submit" value="업로드"><br>
	</form>
</body>
</html>