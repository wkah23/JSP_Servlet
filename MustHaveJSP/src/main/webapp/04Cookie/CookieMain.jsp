<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<!-- 
		쿠키 : 클라이언트의 상태정보를 유지하기 위한 기술로 클라이언트 PC에
			파일형태로 저장된다. 쿠키하나의 크기는 4kb이고, 3000개 까지 생성
			가능하다.
	 -->
	<h2>1. 쿠키(Cookie)설정</h2>
	<%
	/* 
		쿠키는 생성자를 통해서만 생성할 수 있다. setName()이란 메서드가
		없으므로 쿠키는 생성한 후 쿠키명을 변경하는 것이 불가능하다.
	*/
	Cookie cookie = new Cookie("myCookie", "쿠키맛나요");	// 쿠키생성
	/* 
		쿠키의 경로 설정. 컨텍스트 루트 경로로 지정하므로 웹 애플리케이션
		전체에서 사용할 수 있게된다.
	*/
	cookie.setPath(request.getContextPath());	// 경로를 컨텍스트 루트로 설정
	cookie.setMaxAge(3600);	// 유지시간을 1시간으로 설정
	// 응답헤더에 쿠키를 추가하여 클라이언트 쪽으로 전송한다.
	response.addCookie(cookie);	// 응답헤더에 쿠키 추가
	/* 
		여기까지의 코드를 통해 클라이언트측에 쿠키가 생성된다.
	*/
	%>
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	/* 
		request 내장객체의 getCookies()를 통해 현재 생성된 모든 쿠키를
		배열의 형태로 가져온다.
	*/
	Cookie[] cookies = request.getCookies();	// 요청헤더의 모든 쿠키 얻기
	// 생성된 쿠키가 있다면 갯수만큼 반복 (foreach)
	if (cookies != null) {
		for (Cookie c : cookies) {
			String cookieName = c.getName();	// 이름 얻기
			String cookieValue = c.getValue();	// 값 얻기
			// 화면에 출력
			out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
		}
	}
	/* 
		쿠키가 생성된 직후에는 쿠키값을 읽을 수 없다. 클라이언트측에
		있는 쿠키를 서버로 다시 전송하기 위해 페이지 이동을 하거나 새로
		고침을 하여 새로운 요청을 보내야만 읽을 수 있다.
	*/
	%>
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">다음 페이지에서 쿠키값 확인하기</a>
</body>
</html>