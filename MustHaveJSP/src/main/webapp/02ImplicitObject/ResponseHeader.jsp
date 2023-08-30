<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 
	get방식으로 전송된 폼값을 날짜형식을 통해 타임스탬프로 변경한다.
	getTime() : 날짜를 1970년부터 지금까지의 흘러간 시간을 초단위로
		변환해서 반환해준다.
	
	응답헤더에 날짜를 지정하는 경우 대한민국은 세계표준시 +09 즉 9시간이
	느리므로 9시간을 더해줘야 정상적인 날짜가 출력된다.
*/
// 응답헤더에 추가할 값 준비
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println("add_date = "+ add_date);
int add_int = Integer.parseInt(request.getParameter("add_int"));
// 문자형은 그대로 사용하면 된다. 서버로 전송된 파라미터는 모두 String
// 타입으로만 받을 수 있다.
String add_str = request.getParameter("add_str");
/* 
	addDateHeader(헤더명, long타입의 타임스탬프) : 응답헤더에 날짜형식을
		추가하는 경우 long 타입의 타임스탬프로 변환한 후 추가해야 한다.
*/
// 응답 헤더에 값 추가
response.addDateHeader("myBirthday", add_date);
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004);
response.addHeader("myName", add_str);
response.addHeader("myName", "안중근");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	// getHeaderNames()를 통해 응답헤더명 전체를 출력한다.
	Collection<String> headerNames = response.getHeaderNames();
	for (String hName : headerNames) {
		// 헤더명을 통해 헤더값을 얻어와서 출력한다.
		String hValue = response.getHeader(hName);
	%>
		<li><%= hName %> : <%= hValue %></li>
	<%
	}
	/*
		첫번째 출력결과에서 myNumber라는 헤더명이 2번 출력되는데 이때
	    동일한 값 8282가 출력된다. 이것은 getHeader() 메서드의 특성으로
	    처음 입력한 헤더값만 출력하게 된다.
	*/
	%>
	<h2>myNumber만 출력하기</h2>
	<%
	/* 
		myNumber라는 헤더명으로 2개의 값을 추가했으므로 아래에서는 각각의
		값이 정상적으로 출력된다. 즉 add계열의 메서드는 헤더명을 동일하게 
		사용하더라도 헤더값은 정상적으로 추가된다.
	*/
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
		<li>myNumber : <%= myNum %></li>
	<%
	}
	/* 
		이처럼 응답헤더에는 개발자가 원하는 값을 추가할 수 있으므로 프로그램에
		여러가지 형태로 응용할 수 있다.
	*/
	%>
</body>
</html>