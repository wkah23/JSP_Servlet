<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 2</title>
</head>
<body>
	<c:set var="today" value="<%= new Date() %>"></c:set>
	
	<!-- 
		날짜만 출력할 때 사용한다. type = "date"
		dateStyle 속성에 따라 아래와 같이 표현된다.
			full : 0000년 0월 0일 0요일
			short : 00. 0. 0
			long : 0000년 0월 0일
			default : 0000. 0. 0
	 -->
	<h4>날짜 포맷</h4>
	full : <fmt:formatDate value="${ today }" type="date" dateStyle="full"/> <br />
	short : <fmt:formatDate value="${ today }" type="date" dateStyle="short"/> <br />
	long : <fmt:formatDate value="${ today }" type="date" dateStyle="long"/> <br />
	default : <fmt:formatDate value="${ today }" type="date" dateStyle="default"/> 
	<!-- 
		시간만 출력할 때 사용한다. type = "time"
		timeStyle의 값에 따라
			full : 오후 00시 00분 00초 대한민국
			short : 오후 00:00
			long : 오후 00시 00분 00초 KST
			default : 오후 00:00:00
	 -->
	<h4>시간 포맷</h4>
	full : <fmt:formatDate value="${ today }" type="time" timeStyle="full"/> <br />
	short : <fmt:formatDate value="${ today }" type="time" timeStyle="short"/> <br />
	long : <fmt:formatDate value="${ today }" type="time" timeStyle="long"/> <br />
	default : <fmt:formatDate value="${ today }" type="time" timeStyle="default"/>
	<!-- 
		날짜와 시간을 둘다 표시하므로 포맷도 각각 지정할 수 있다.
		앞에서 사용한 속성값들을 조합해서 테스트해보자.
	 -->
	<h4>날짜/시간 표시</h4> 
	<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/> <br />
	<fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/> <br />
	
	<h4>타임존 설정</h4>
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/> <br />
	</fmt:timeZone>
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/> <br />
	</fmt:timeZone>
	
	<fmt:timeZone value="Asia/Seoul">
		<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>
	
	<h4>timezone에 사용할 수 있는 문자열 구하기</h4>
	<c:forEach var="ids" items="<%= TimeZone.getAvailableIDs() %>">
		${ ids } <br />
	</c:forEach>
</body>
</html>