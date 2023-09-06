<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<% 
	String loginBtn = "로그인";
	String loginLink = "login.jsp";
	if(session.getAttribute("memid")==null) {
		loginBtn = "로그인";
		loginLink = "login.jsp";
	}else{
		loginBtn = "로그아웃";
		loginLink = "logout.jsp";
	}
%>
<div class="wrapper">
		
	<!-- 헤더영역 -->
	<header>
	
		<div class="top">
			<ul class="topmenu">
				<li><a href="<%=loginLink%>"><%=loginBtn %></a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</div>
		
		<div class="logo">
			<h1>자바웹프로그래밍 연습</h1>	
		</div>
		
		<nav>
			<ul class="menu">
				<li>HOME</li>
				<li>소개</li>
				<li>클래스</li>
				<li><a href="board.jsp?page=1">고객센터</a></li>
				<li><a href="mypage.jsp">MYPAGE</a></li>
				<li><a href="admin/mng_login.html" target="_blank">관리자</a></li>
			</ul>
		</nav>
	</header>
		
		
	<!-- 메인영역 -->
	<div class="main_content">
	
		<form action="loginpro.jsp" method="POST">
		
		<h2>로 그 인</h2>
		<h3>로그인 정보입력</h3>
		<table class="join_table"> 
			
			<tr>
				<td class="join_tag">아이디</td>
				<td>
					<input class="userid" type="text" name="memid">								
				</td>
			</tr>
			
			<tr>
				<td class="join_tag">비밀번호</td>
				<td>
					<input class="pass1" type="password" name="mempw">						
				</td>
			</tr>	
		</table>		
		
		<div class="join_bths">
			<input type="submit" value="로 그 인">
			<input type="button" value="회 원 가 입" onclick="location.href='join.jsp'">
		</div>		
				
		</form>
		
		
	</div>
		
		
	<!-- 푸터영역 -->
	<footer>
		<address>Copywriter &copy; 2022
			<span>GeneratePress.JavaWeb</span>
		</address>
	</footer>
		
</div>

</body>
</html>