<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>  
<%@ page import="human.test.MyDate" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>오늘의 날짜</h2>
	
	<%
		Date today = new Date();
		out.println(today+"<br>");
		MyDate myday = new MyDate();
		String newday 
		= myday.DateFormat(today);
		out.println(newday);
		
	%>
</body>
</html>