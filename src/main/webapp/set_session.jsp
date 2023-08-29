<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	out.println("<h2>세션값을 생성하는 방법</h2>");

	// 로그인 후 id정보를 가지고 있다고 가정
	String id = "kkws";
	
	session.setAttribute("memid", id);  // 서버에 세션으로 아이디를 저장
	
%>

</body>
</html>