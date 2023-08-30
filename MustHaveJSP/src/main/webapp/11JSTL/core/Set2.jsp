<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 2</title>
</head>
<body>
	<h4>List 컬렉션 이용하기</h4>
	<%
	// Person 객체를 저장할 수 있는 List계열의 컬렉션을 생성한다.
	ArrayList<Person> pList = new ArrayList<Person>();
	pList.add(new Person("성삼문", 55));
	pList.add(new Person("박팽년", 55));
	%>
	<c:set var="personList" value="<%= pList %>" scope="request"></c:set>
	<ul>
		<li>이름 : ${ requestScope.personList[0].name }</li>
		<!-- 다른 영역에 똑같은 이름으로 저장한 속성이 없으므로 requestScope
		는 생략할 수 있다. -->
		<li>나이 : ${ personList[0].age }</li>
	</ul>
	
	<h4>Map 컬렉션 이용하기</h4>
	<%
	/*
		Map의 Key는 String타입, value는 Person타입으로 정의한 후 2개의
		Person 객체를 저장한다.
	*/
	Map<String, Person> pMap = new HashMap<String, Person>();
	pMap.put("personArgs1", new Person("하위지", 65));
	pMap.put("personArgs2", new Person("이개", 67));
	%>
	<c:set var="personMap" value="<%= pMap %>" scope="request"></c:set>
	<ul>
		<!-- Map컬렉션이므로 Key를 통해 접근하여 출력한다. -->
		<li>아이디 : ${ requestScope.personMap.personArgs2.name }</li>
		<li>비밀번호 : ${ personMap.personArgs2.age }</li>
	</ul>
</body>
</html>