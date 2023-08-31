<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		/* out.println(writer+"<br>");
		out.println(subject+"<br>");
		out.println(content+"<br>"); */
		
		BoardVo tempvo = new BoardVo();
		tempvo.setWriter(writer);
		tempvo.setSubject(subject);
		tempvo.setContent(content);
		
		BoardDao bbsdao = new BoardDao();
		int result = bbsdao.regBoard(tempvo);
		
		out.println("등록결과: " + result);
		
		
	%>
</body>
</html>