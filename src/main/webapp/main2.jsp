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
	
	<div class="wrapper">
	
		<!-- 헤더영역 -->
		<header>
			<div class="logo">
				<h1>자바웹프로그래밍 연습</h1>	
			</div>
			
			<nav>
				<ul class="menu">
					<li>HOME</li>
					<li>소개</li>
					<li>클래스</li>
					<li>고객센터</li>
					<li>MYPAGE</li>
					<li>관리자</li>
				</ul>
			</nav>
		</header>
		
		
		<!-- 메인영역 -->
		<div class="main_content">
		
			<form action="" method="POST">
			
			<h2>회원 가입</h2>
			<h3>회원 이용정보 입력</h3>
			<table class="join_table"> 
				
				<tr>
					<td class="join_tag">아이디</td>
					<td>
						<input class="userid" type="text" name="memid">
						<input class="join_inner_btn" type="button" value="중복확인">
						
						<p class="alert_id">ID는 4글자 이상의 영문 또는 영문+숫자 조합으로 입력하세요</p>
					</td>
				</tr>
				
				<tr>
					<td class="join_tag">비밀번호</td>
					<td>
						<input class="pass1" type="password" name="mempw">						
					</td>
				</tr>	
			</table>
			
			<h3>개인정보 입력</h3>
			<table class="join_table"> 
				
				<tr>
					<td class="join_tag">이름</td>
					<td>
						<input class="username" type="text" name="memname">
					</td>
				</tr>				
				<tr>
					<td class="join_tag">EMAIL</td>
					<td>
						<input class="usermail" type="text" name="mememail">
					</td>
				</tr>
				<tr>
					<td class="join_tag">전화번호</td>
					<td>
						<input class="usertel" type="text" name="memtel">
					</td>
				</tr>
			</table>	
			
			<div class="join_bths">
				<input type="submit" value="회원 등록">
				<input type="button" value="취 소">
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