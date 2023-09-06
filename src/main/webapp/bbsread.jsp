<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<%@ page import="human.dao.FilesDao" %>
<%@ page import="human.vo.FilesVo" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/board.css">
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
				<li><a href="board.jsp">고객센터</a></li>
				<li><a href="mypage.jsp">MYPAGE</a></li>
				<li><a href="admin/mng_login.html" target="_blank">관리자</a></li>
			</ul>
		</nav>
	</header>
		
	<%
		String curPage = request.getParameter("page");
		String no = request.getParameter("no");
	
		BoardVo tempvo = new BoardVo();
		BoardDao bbsdao = new BoardDao();		
		tempvo = bbsdao.readBoardByNo(no);
		
		FilesVo filesvo = new FilesVo();
		FilesDao filedao = new FilesDao();
		filesvo = filedao.readFilesByNo(no);
		
	%>
		
	<!-- 메인영역 -->
	<div class="main_wrap">
		
		<div class="sub_banner">
			<h2>고객센터</h2>
		</div>
		
		<div class="content_wrap">
		
			<h2> # 공지사항</h2>
			<table class="board_table">
				
				<thead>
				<tr>
					<th colspan="6" class="post_title">글읽기</th>					
				</tr>
				</thead>
				
				<tbody>
				<tr>
					<th class="post_writer">작성자</th>
					<td><%= tempvo.getWriter() %></td>
					
					<th class="post_date">작성일</th>
					<td><%= tempvo.getRegdate() %></td>
					
					<th class="post_view">조회수</th>
					<td><%= tempvo.getHit() %></td>
					
				</tr>
				<tr>
					<th class="post_email">이메일</th>
					<td colspan="2"><%= tempvo.getEmail() %></td>
					<th class="post_date">연락처</th>
					<td colspan="2"><%= tempvo.getHp() %></td>
				</tr>
				
				<tr>
					<th class="post_subject">제목</th>
					<td colspan="5"><%= tempvo.getSubject() %></td>
				</tr>
				<tr>
					<th class="post_content">내용</th>
					<td colspan="5"><%= tempvo.getContent() %></td>
				</tr>
				<tr>
					<th class="post_file">첨부파일</th>
					<td colspan="5"><a href="filedown.jsp?filename=<%= filesvo.getFilename() %>"><%= filesvo.getFilename() %></a></td>
				</tr>
				</tbody>
				
			</table>
			
			<div class="board_btns">
				<form class="control" action="board.jsp" method="GET">	
					<input type="hidden" name="page" value="<%= curPage %>">								
					<input class="control_btn" type="submit" value="목록">
				</form>
			</div>		
			
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