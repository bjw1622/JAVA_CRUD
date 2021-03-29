<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter" %>
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
				<li><a href="electric.jsp">전자제품</a></li>
				<li><a href="instant.jsp">인스턴트식품(조미료)</a></li>
				<li><a href="clothe.jsp">옷</a></li>
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
			<form method="post" action="writeAction.jsp" enctype="multipart/form-data">

				<table class="table table-striped" style="text-align: center; border: 1px solid #fdc23e;">
					<thead>
						<tr>
							<th colspan ="2" style="background-color: #f8ecc9; text-align: center;">리뷰 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan ="2">
								<input type="text" style="background-color: #f8ecc9" class="form-control" placeholder="제목" name="msg_title" maxlength="50">
							</td>
						</tr>
						<tr>
							<td colspan ="2">
								<textarea class="form-control" style="background-color: #f8ecc9" placeholder="리뷰 내용" name="msg_content" maxlength="2048" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<td style="background-color: #f8ecc9; width:15%; border-right: 3px; solid: #f8ecc9;">이미지 파일 첨부</td>

							<td>
								 <input type="file" name="imageFile" accept="image/*">
							</td>
						</tr>
					</tbody>
				</table>
				<input type="submit" style="background-color: #f8ecc9"  class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>
	</div>
</body>
</html>