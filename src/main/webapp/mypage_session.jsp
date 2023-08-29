<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>마이페이지 화면</h2>
	
	<%
		String sesid = (String)session.getAttribute("memid");
	
		out.println("저장된 세션값은: " + sesid);
		
	%>
</body>
</html>