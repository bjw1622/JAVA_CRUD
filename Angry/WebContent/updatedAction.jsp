<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import= "kr.ac.sunmoon.board.Message" %>
<%@ page import= "kr.ac.sunmoon.board.BoardService" %>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import= "kr.ac.common.FileUtils" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.nio.file.*" %>
<%@ page import= "com.oreilly.servlet.*" %>
<%@ page import= "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	//톰캣 경로가 아닌 경로에 파일 업로드 
	String uploads = FileUtils.getFilePath();
	//톰캣 경로에 복사
	String cpUploadss=request.getSession().getServletContext().getRealPath("/upload");	
	MultipartRequest multi=new MultipartRequest(request,uploads, 50*1024*1024, "UTF-8",new DefaultFileRenamePolicy());
	request.setCharacterEncoding("UTF-8");
	String msg_title = multi.getParameter("msg_title");
	String msg_content = multi.getParameter("msg_content");
	String msg_id = request.getParameter("msg_id");
	String imageFileName = multi.getFilesystemName("imageFile");
	File file = multi.getFile("imageFile");
	if(file != null &&file.exists())
		Files.copy(file.toPath(), Paths.get(cpUploadss, imageFileName),  StandardCopyOption.REPLACE_EXISTING);
	
	BoardService service = new BoardService();
	service.updateMessage(msg_title, msg_content, msg_id, imageFileName);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'view.jsp?msg_id=" + msg_id + "'");
	script.println("</script>");
%>
</body>
</html>