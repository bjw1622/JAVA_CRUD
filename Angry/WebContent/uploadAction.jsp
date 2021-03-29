<%@ page import ="file.FileDAO" %>
<%@ page import ="java.io.File" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import ="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>불만을 남겨줘!!</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>FILE</title>
</head>
<body>

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
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
		<%
		String directory = application.getRealPath("/upload/");
		int maxSize = 512400;
		String encoding = "UTF-8";
		//객체를 이용해서 맥스 사이즈 만큼 업로딩 실행
		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory , maxSize , encoding,
				new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		//사용자가 업로드 하고자 하는 파이을 매개변수로 넣어줌
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		new FileDAO().upload(fileName, fileRealName);
		//업로드 메소드 이용
		out.write("파일명: "+ fileName + "<br>");
		out.write("실제파일명: "+ fileRealName + "<br>");
	%>
</body>
</html>
