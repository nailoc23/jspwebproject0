<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.vo.CarVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자동차 정보 저장 출력</h2>
	<%
		// CarVo 없다면 친구의 자동차 정보를 저장하려면
		String fcarColor = "blue";
		double fcarWidth = 2.5;
		String fcarModel = "현대자동차";
		
		CarVo cvo = new CarVo();
		cvo.setColor("blue");
		cvo.setWidth(2.5);
		cvo.setModel("현대자동차");
		
		//   SelCar(String color, double width, String model);
		// ->SelCar(CarVo car);
		out.println("친구자동차 색깔: " + cvo.getColor());
		out.println("친구자동차 크기: " + cvo.getWidth());
		out.println("친구자동차 모델: " + cvo.getModel());
		
	%>

</body>
</html>