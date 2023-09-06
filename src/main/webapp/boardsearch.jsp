<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>    
    
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>    
    
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
				<li><a href="board.jsp?page=1">고객센터</a></li>
				<li><a href="mypage.jsp">MYPAGE</a></li>
				<li><a href="admin/mng_login.html" target="_blank">관리자</a></li>
			</ul>
		</nav>
	</header>
		
		
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
					<th colspan="4" class="post_title">게시글 검색결과</th>
				</tr>
				<tr>
					<th class="post_num">번호</th>
					<th>제목</th>
					<th class="post_date">작성일</th>
					<th class="post_view">조회수</th>
				</tr>
				</thead>
				
				<tbody>
	
				<%
					String keyWord = request.getParameter("keyword");
				
					BoardDao bbsdao = new BoardDao();
					ArrayList<BoardVo> result = bbsdao.searchBoard(keyWord);
					/* out.println("검색어는: " + keyWord); */
					for(int i=0; i<result.size(); i++) {
						BoardVo eachvo = result.get(i);
				%>
					
					<tr class="post">
						<td class="post_num"><%= eachvo.getNo() %></td>
						<td><a href="bbsread.jsp?no=<%= eachvo.getNo() %>"><%= eachvo.getSubject() %></a></td>
						<td class="post_date"><%= eachvo.getRegdate() %></td>
						<td class="post_view"><%= eachvo.getHit() %></td>
					</tr>
           		<%				
					}
				%>
				
				</tbody>
			</table>
			
			<div class="board_btns">
				<form class="search" action="boardsearch.jsp" method="GET">
					<select class="search_box" name="search_cate" id="search_cate">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
					<input class="search_box" type="text" name="keyword">
					<input class="search_btn" type="submit" value="검색">
				</form>
			</div>
			
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