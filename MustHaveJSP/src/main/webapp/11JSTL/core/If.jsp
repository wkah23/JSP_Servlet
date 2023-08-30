<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - if</title>
</head>
<body>
<!-- 
	if 태그 : 조건을 확인하여 실행여부를 판단한다.
	속성정리
		test : EL을 이용해서 조건식을 삽입한다.
		var : test 속성에서 판단한 결과값을 저장한다.
 -->
	<c:set var="number" value="100"></c:set>
	<c:set var="string" value="JSP"></c:set>
	
	<h4>JSTL의 if태그로 짝수/홀수 판단하기</h4>
	<!-- 
		if(number%2 == 0) 과 동일한 조건의 if문으로 해당 조건의 결과가
		result에 저장된다. 나머지는 0이므로 true가 저장된다.
	 -->
	<c:if test="${ number mod 2 eq 0 }" var="result">
		${ number }는 짝수입니다. <br />
	</c:if>
	result : ${ result } <br />
	<!-- 
		Java에서는 비교연산자 ==과 equals()는 다르지만, EL에서는 eq를
		통해 값에대한 비교와 문자열에 대한 비교 모두를 할 수 있다.
		여기서 사용한 eq는 Java의 compareTo()와 같이 사전순으로
		문자열을 비교한다. 
	 -->
	<h4>문자열 비교와 else 구문 흉내내기</h4>
	<!-- 첫번째 if문은 false의 결과가 나온다. -->
	<c:if test="${ string eq 'Java' }" var="result2">
		문자열은 Java입니다. <br />
	</c:if>
	<!-- result2에 not을 붙여 반대의 조건을 만든다.
	따라서 Java의 else문과 같은 구문이 된다. -->
	<c:if test="${ not result2 }"> <!-- => true값 -->
		'Java'가 아닙니다. <br />
	</c:if>
	
	<h4>조건식 주의사항</h4>
	<c:if test="100" var="result3">
		EL이 아닌 정수를 지정하면 false <!-- false 이므로 출력이 안된다. -->
	</c:if>
	result3 : ${ result3 } <br />
	
	<c:if test="tRuE" var="result4">
		대소문자 구분없이 "tRuE"인 경우 true <br />
	</c:if>
	result4 : ${ result4 } <br />
	<!-- test에는 앞뒤에 하나라도 공백이 들어가면 무조건 false를
	반환받게 된다. 따라서 주의해야 한다. -->
	<c:if test=" ${ true } " var="result5">
		EL 양쪽에 빈 공백이 있는 경우 false <br />
	</c:if>
	result5 : ${ result5 } <br />
	
	<h4>연습문제 : if 태그</h4>
	<!-- 
		아이디, 패스워드를 입력후 submit버튼을 누르면 EL식을 통해 파라미터를
		받은 후 seoulit/1234인 경우에는 'seoulit님, 반갑습니다~' 라고 출력한다.
		만약 틀렸다면 "아이디/비밀번호를 확인하세요" 라고 출력한다.
		EL과 JSTL의 if태그만을 이용해서 구현하시오.
	 -->
	<form method="get">
		아이디 : <input type="text" name="user" /> <br />
		비밀번호 : <input type="text" name="pass" /> <br />
		<input type="submit" value="로그인" />
	</form>
	<!-- 최초 실행시에는 파라미터가 없는 상태이므로 아무 내용도
	출력되지 않는다. -->
	<c:if test="${ not empty param.user }">
		전송된 아이디 : ${ param.user } <br />
		전송된 비밀번호 : ${ param.pass } <br />
		<!-- 
			아이디, 비밀번호를 입력했을 때만 일치여부를 판단한 후 결과를
			변수에 저장한다.
			if태그는 else구문이 따로 없으므로 not을 통해 두번째 if문을
			구성해야 한다.
		 -->
	</c:if>
	<c:if test="${ param.user == 'seoulit' and param.pass eq '1234' }" var="loginResult">
		${ param.user }님, 반갑습니다~ <br />
	</c:if>
	<c:if test="${ not loginResult  }">
		아이디/비밀번호를 확인하세요. <br />
	</c:if>
</body>
</html>