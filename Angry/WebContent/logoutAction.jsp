<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="kr.ac.sunmoon.user.UserService" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
%>
</body>
</html>
