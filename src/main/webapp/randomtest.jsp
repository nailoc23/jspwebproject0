<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.test.MyGame" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//double rand = Math.random();
		//int num = (int)(rand*10)+1; // 1~10
		MyGame game = new MyGame();
		
		int num = game.MyRandom();
		out.println(num);
		// jsp파일안에 자바코드 그대로 사용 가능
	%>
</body>
</html>