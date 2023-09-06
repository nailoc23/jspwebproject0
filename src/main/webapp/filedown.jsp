<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 1 다운로드 파일의 실제 폴더 경로
		String fileName = request.getParameter("filename");
		//out.println("다운로드파일명: " + fileName);
		String realPath = "D:\\zsync\\Sync\\bigdata_code\\workspace_stsb_4_19\\jspwebproject4\\src\\main\\webapp\\upload\\";
		String downFilePath = realPath + fileName;
		
		// 2 파일 InputStream으로 읽기
		File file = new File(downFilePath);
		FileInputStream fin = new FileInputStream(file);
		
		// 3파일 웹으로 출력
		// 3-1 http 통신의 헤더를 세팅
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename="+fileName);
		
		// 3-2 OutStream 으로 쓰기
		out.clear();
		out = pageContext.pushBody();
		OutputStream fos = response.getOutputStream();
		
		// 3-3. 파일사이즈 만큼 반복해서 전송
		int length;
		byte[] buf = new byte[(int)file.length()];
		while( ( length= fin.read(buf) ) > 0 ) {
			fos.write(buf, 0, length);
		}
		
		// 마무리
		fos.flush();
		fos.close();
		fin.close();
		
	%>
</body>
</html>