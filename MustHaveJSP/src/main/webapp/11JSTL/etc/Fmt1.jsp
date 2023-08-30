<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 국제회 태그 사용을 위한 선언 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 1</title>
</head>
<body>
<!-- 
	국제화(formatting) 태그 : 국가별로 다양한 언어, 날짜, 시간, 숫자형식을
		설정할 때 사용한다. 접두어로는 fmt를 사용한다.
 -->
	<h4>숫자 포맷 설정</h4>
	<c:set var="number1" value="12345"></c:set>
	<!-- 
		groupingUsed :세자리마다 콤마를 출력한다. 디폴트 값이 true이므로 
			콤마를 출력하고 싶지 않다면 false를 지정해야 한다. 
	 -->
	콤마 O : <fmt:formatNumber value="${ number1 }"></fmt:formatNumber> <br />
	콤마 X : <fmt:formatNumber value="${ number1 }" groupingUsed="false"></fmt:formatNumber> <br />
	<!-- 
		type이 currency인 경우 현지 통화기호로 출력된다.
		var속성 지정시 즉시 출력되지 않고, 원하는 위치에 EL을 통해 출력한다.
		currencySymbol 속성으로 통화기호를 변경할 수 있다.
	 -->
	<fmt:formatNumber value="${ number1 }" type="currency" var="printNum1"></fmt:formatNumber>
	통화기호 : ${ printNum1 } <br />
	<!-- value 속성값을 %단위로 변환해서 출력한다. 즉 100을 곱한 결과에
	%기호를 붙여준다. -->
	<fmt:formatNumber value="0.03" type="percent" var="printNum2"></fmt:formatNumber>
	퍼센트 : ${ printNum2 }
	<!-- 
		Integer.parseInt()와 동일한 기능으로 문자열을 수자롤 변경한다.
		pattern : 반환할 문자열의 패턴을 지정하여 파싱한다.
		integerOnly : 소수점 이하를 절삭하여 정수부만 출력한다.
	 -->
	<h4>문자열을 숫자로 변경</h4>
	<c:set var="number2" value="6,012,789.01"></c:set>
	<!-- 
		pattern으로 주어진 부분을 절삭하여 문자열을 숫자형식으로 파싱한다.
			해당 속성값으로
			000,000.00 사용시 정상
			0,0.0 사용시 정상
			,. 사용시 에러발생
	 -->
	<fmt:parseNumber value="${ number2 }" pattern="0,0.0" var="printNum3" ></fmt:parseNumber>
	소수점까지 : ${ printNum3 } <br />
	<fmt:parseNumber value="${ number2 }" integerOnly="true" var="printNum4"></fmt:parseNumber>
	정수 부분만 : ${ printNum4 }
	
</body>
</html>