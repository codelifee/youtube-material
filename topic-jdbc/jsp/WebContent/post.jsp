<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="post.PostDAO" %>
<%@ page import="post.PostDTO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String title = null;
	if(request.getParameter("title") != null) {
		title = (String)request.getParameter("title");
		
	}
	
	
	
	String content = null;
	if(request.getParameter("content") != null) {
		content = (String)request.getParameter("content");
		
	}
	
	
	
	
	
	
	if( title == null || content == null || 
			title.equals("") || content.equals("")) {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		
	} else {
		PostDAO postDAO = new PostDAO();
		
		int result = postDAO.post(new PostDTO(title, content));
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('failed');");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('succeeded');");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}

	}
	
%>
	
	
</body>
</html>