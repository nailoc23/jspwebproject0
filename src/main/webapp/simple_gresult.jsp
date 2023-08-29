<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.test.RPSGame" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table { width: 500px;}
	table th, td {
		border: 1px solid black;
		width: 200px;
	}
	img {
		width: 200px;
		height: 200px;
	}
</style>
</head>
<body>
	<h2>게임결과 보여조기</h2>
	
	<%
		String myselect 
		= request.getParameter("mysel");
		out.println(myselect);
		RPSGame rps = new RPSGame();
		
		int comselect = rps.RandomRPSNumber();
		out.println(comselect);
		
		int mySel = Integer.valueOf(myselect);
		int result = rps.CompareRPS(comselect, mySel);
		
	%>
	
	<table>
		<tr>
			<th>컴퓨터</th>
			<th>VS</th>
			<th>사용자</th>
		<tr>
		<tr>
			<td>
			<%
				if(comselect==1) {
					out.println("<img src='images/1_가위.png'>");
				}
				else if(comselect==2) {
					out.println("<img src='images/2_바위.png'>");
				}
				else {
					out.println("<img src='images/3_보.png'>");
				}
			%>		
			</td>
			<td>
			<% 
				if(result==1) {
					out.println("<h3>you win</h3>");
				}else if(result==-1) {
					out.println("<h3>you lose</h3>");
				}else {
					out.println("<h3>draw</h3>");
				}
			%>
			</td>
			<td>
			<%
				if(myselect.equals("1")) {
					out.println("<img src='images/1_가위.png'>");
				}
				else if(myselect.equals("2")) {
					out.println("<img src='images/2_바위.png'>");
				}
				else {
					out.println("<img src='images/3_보.png'>");
				}				
			%>			
			</td>
		
	</table>
	
	<input type="button" value="새게임" onclick="location.href='simple_game.html'">
</body>
</html>