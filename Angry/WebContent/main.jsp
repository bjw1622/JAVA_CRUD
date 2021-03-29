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
		<style type="text/css">
			.tg  {border-collapse:collapse;border-color:#93a1a1;border-spacing:0;}
			.tg td{background-color:#fdf6e3;border-color:#93a1a1;border-style:solid;border-width:1px;color:#002b36;
  			font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
			.tg th{background-color:#657b83;border-color:#93a1a1;border-style:solid;border-width:1px;color:#fdf6e3;
  			font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
			.tg .tg-0lax{text-align:left;vertical-align:top	}
			.container{display: flex; justify-content:space-between; width:100%}
			.a{margin-right : 50px;}
			.image{text-align:center;}
		</style>
	<div class = container>
	<div class = a>
	<table class="tg">
		<caption>
			<span style=" font: italic bold 1.6em/1em Georgia, serif ; color: blue;">
			이달의 리뷰왕!!
			</span>
		</caption>
		<thead>
  			<tr>
    			<th class="tg-0lax">랭킹</th>
    			<th class="tg-0lax">닉네임</th>
    			<th class="tg-0lax">리뷰 갯수</th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
			    <td class="tg-0lax">1</td>
			    <td class="tg-0lax">bjw1622</td>
			    <td class="tg-0lax">8</td>
			 </tr>
			 
			 <tr>
			    <td class="tg-0lax">2</td>
			    <td class="tg-0lax">ehkim</td>
			    <td class="tg-0lax">6</td>
			  </tr>
			  
			  <tr>
				<td class="tg-0lax">3</td>
			    <td class="tg-0lax">dmsvy</td>
			    <td class="tg-0lax">4</td>
			  </tr>
			  
			  <tr>
			    <td class="tg-0lax">4</td>
			    <td class="tg-0lax">alsrud</td>
			    <td class="tg-0lax">3</td>
			  </tr>
			  
			  <tr>
			    <td class="tg-0lax">5</td>
			    <td class="tg-0lax">tjrgud</td>
			    <td class="tg-0lax">1</td>
			  </tr>
		</tbody>
	</table>
	</div >
	<div class = image>
		<img src ="/upload/unnamed.png" width ="300" height="300" >
	</div> 
	<div>
	<table class="tg">
		<caption>
			<span style=" font: italic bold 1.6em/1em Georgia, serif ; color: blue;">
			이주의 리뷰왕!!
			</span>
		</caption>
		<thead>
  			<tr>
    			<th class="tg-0lax">랭킹</th>
    			<th class="tg-0lax">닉네임</th>
    			<th class="tg-0lax">리뷰 갯수</th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
			    <td class="tg-0lax">1</td>
			    <td class="tg-0lax">bjw1622</td>
			    <td class="tg-0lax">8</td>
			 </tr>
			 
			 <tr>
			    <td class="tg-0lax">2</td>
			    <td class="tg-0lax">ehkim</td>
			    <td class="tg-0lax">6</td>
			  </tr>
			  
			  <tr>
				<td class="tg-0lax">3</td>
			    <td class="tg-0lax">dmsvy</td>
			    <td class="tg-0lax">4</td>
			  </tr>
			  
			  <tr>
			    <td class="tg-0lax">4</td>
			    <td class="tg-0lax">alsrud</td>
			    <td class="tg-0lax">3</td>
			  </tr>
			  
			  <tr>
			    <td class="tg-0lax">5</td>
			    <td class="tg-0lax">tjrgud</td>
			    <td class="tg-0lax">1</td>
			  </tr>
		</tbody>
	</table>
	</div>
	</div>
</body>
</html>