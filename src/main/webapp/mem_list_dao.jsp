<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.MemberDao" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원테이블을 처리</h2>
	
	<%
		MemberDao memdao = new MemberDao();
	
		int total = memdao.getMemberCount();
		
		out.println("총갯수: " + total);
		
	%>
</body>
</html>