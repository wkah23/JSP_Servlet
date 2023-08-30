<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String pValue = "방랑시인";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - param</title>
</head>
<body>
	<!-- Person클래스로 request영역에 JavaBean을 생성한다. -->
	<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
	<!-- setter()를 통해 멤버변수의 값을 설정한다. -->
	<jsp:setProperty property="name" name="person" value="김삿갓"/>
	<jsp:setProperty property="age" name="person" value="56"/>
	<!-- 다음페이지로 포워드 한다. 이때 3개의 파라미터를 전송한다. -->
	<jsp:forward page="ParamForward.jsp?param1=김병연">
		<jsp:param value="경기도 양주" name="param2"/>
		<jsp:param value="<%= pValue %>" name="param3"/>
	</jsp:forward>
</body>
</html>