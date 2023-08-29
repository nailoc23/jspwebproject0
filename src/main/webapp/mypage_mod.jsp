<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>마이페이지 정보수정</h2>
	
	<%
		if(session.getAttribute("memid") == null) {
			
			out.println("마이페이지에 접속할 수 없습니다");
			
		}else{
			
			out.println("마이페이지에서 정보를 수정할 수 있습니다");
		}
	%>

</body>
</html>