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
	<%
		String id = request.getParameter("memid");
		String pw = request.getParameter("mempw");
		String name = request.getParameter("memname");
		String email = request.getParameter("mememail");
		String tel = request.getParameter("memtel");
		
		/* out.println(id+"<br>");
		out.println(pw+"<br>"); */
		
		MemberDao memdao = new MemberDao();
		
		int result = memdao.regMember(id, pw, name, email, tel);
		
		out.println("등록결과: " + result);
		
		if(result!=0) {
			response.sendRedirect("main.jsp");
		}
	
	%>
</body>
</html>