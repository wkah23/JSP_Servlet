<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - UseBean</title>
</head>
<body>
	<h3>액션 태그로 폼값 한 번에 받기</h3>
	<!-- 
		폼값을 전송하는 페이지에서 input태그의 name속성과 이를 저장할
		DTO객체의 멤버변수명이 반드시 일치해야하고, 또한 값 설정을 위한
		setter/getter 메서드가 정의되어 있어야 한다.
	 -->
	<jsp:useBean id="person" class="common.Person" />
	<!-- 전송된 폼값이 자바빈즈에 한번에 저장된다. -->
	<jsp:setProperty property="*" name="person" />
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="person"/></li>
		<li>나이 : <jsp:getProperty property="age" name="person"/></li>
	</ul>
</body>
</html>