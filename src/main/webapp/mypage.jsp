<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
</head>
<body>
<%  
	String loginBtn = "로그인";
	String loginLink = "login.jsp";
	String id = "";
	MemberVo resultvo = new MemberVo();
	// 세션정보를 확인해서 페이지를 보여줄지 여부를 판단
	if(session.getAttribute("memid") == null) {
		loginBtn = "로그인";
		loginLink = "login.jsp";
		out.println("<script>alert('로그인 후 사용가능합니다');</script>");
		out.println("<script>location.href='login.jsp'</script>");
	}else{
		id = (String)session.getAttribute("memid");
		loginBtn = "로그아웃";
		loginLink = "logout.jsp";
		
		// 세션이 생성 확인 후 
		// 지역변수 자리
		MemberDao memdao = new MemberDao();
		resultvo = memdao.getMemberById(id);
		
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
				<li>MYPAGE</li>
				<li>관리자</li>
			</ul>
		</nav>
	</header>
		
		
	<!-- 메인영역 -->
	<div class="main_content">
	
		<form action="mypagemod.jsp" method="POST">
		
		<h2>마이페이지</h2>
		<h3>개인 정보 확인</h3>
		<table class="join_table"> 
			
			<tr>
				<td class="join_tag">아이디</td>
				<td>
					<p><%= id %></p>							
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
					<input class="username" type="text" name="memname" value="<%= resultvo.getName() %>">
				</td>
			</tr>				
			<tr>
				<td class="join_tag">EMAIL</td>
				<td>
					<input class="usermail" type="text" name="mememail" value="<%= resultvo.getEmail() %>">
				</td>
			</tr>
			<tr>
				<td class="join_tag">전화번호</td>
				<td>
					<input class="usertel" type="text" name="memtel" value="<%= resultvo.getPhone() %>">
				</td>
			</tr>
		</table>		
		
		<div class="join_bths">
			<input type="submit" value="회 원 정 보 수 정">
			<input type="reset" value="수 정 취 소">
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