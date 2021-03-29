<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import= "kr.ac.sunmoon.user.UserService" %>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import= "kr.ac.sunmoon.board.Message" %>
<%@ page import= "kr.ac.sunmoon.board.BoardService" %>
<%@ page import= "kr.ac.common.FileUtils" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.nio.file.*" %>
<%@ page import= "com.oreilly.servlet.*" %>
<%@ page import= "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<html>
<head>
<meta charset="utf-8">
<title>불만을 남겨줘</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");	
String user_id = request.getParameter("userId");
	String user_pw = request.getParameter("userPw");
	String user_name = request.getParameter("userName");
	String user_gender = request.getParameter("userGender");
	String user_email = request.getParameter("userEmail");
	
	UserService service = new UserService();
	int result = service.join(user_id, user_pw, user_name, user_gender, user_email);
	
	if(result == 0)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	else
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>