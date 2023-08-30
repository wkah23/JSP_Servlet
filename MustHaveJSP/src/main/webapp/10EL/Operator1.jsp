<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num1 = 3;
pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3", "5");
pageContext.setAttribute("num4", "8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) - 연산자</title>
</head>
<body>
	<h3>변수 선언 및 할당</h3>
	<!-- 
		EL 및 JSTL은 영역에 저장된 속성들을 이용해서 연산하거나 출력한다.
		따라서 스크립틀릿에서 선언한 변수는 EL에서 사용할 수 없다.
	 -->
	스크립틀릿에서 선언한 변수 : ${ num1 } <br />
	page 영역에 저장된 변수 : ${ num2 } <br />
	<!-- 
		톰캣 8.0부터는 EL에서 변수할당을 할 수 있다. 하지만 변수할당과
		동시에 출력되므로, 할당문 뒤에 :''를 붗여줘야 출력되지 않는다.
		즉, EL에서 변수할당은 많이 사용되지 않는다.
	 -->
	변수 할당 및 즉시 출력 : ${ num1 = 7 } <br />
	변수 할당 및 별도 출력 : ${ num2 = 8;'' } => ${ num2 } <br />
	num1 = ${ num1 }, num2 = ${ num2 }, num3 = ${ num3 }, num4 = ${ num4 }
	
	<h3>산술 연산자</h3>
	num1 + num2 : ${ num1 + num2 } <br />
	num1 - num2 : ${ num1 - num2 } <br />
	num1 * num2 : ${ num1 * num2 } <br />
	num3 / num4 : ${ num3 / num4 } <br />
	num3 div num4 : ${ num3 div num4 } <br />
	num3 % num4 : ${ num3 % num4 } <br />
	num3 mod num4 : ${ num3 mod num4 } <br />
	
	<h3>+ 연산자는 덧셈만 가능</h3>
	num1 + "34" : ${ num1 + "34" } <br />
	num2 + "이십" : \${ num2 + "이십" } <br />
	"삼십" + "사십" : \${ "삼십" + "사십" }
	
	<h3>비교 연산자</h3>
	num4 > num3 : ${ num4 gt num3 } <br />
	num1 < num3 : ${ num1 lt num3 } <br />
	num2 >= num4 : ${ num2 ge num4 } <br />
	num1 == num4 : ${ num1 eq num4 }
	
	<h3>논리 연산자</h3>
	num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 } <br />
	num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 }
</body>
</html>