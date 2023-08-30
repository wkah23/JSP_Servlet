<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - xml</title>
</head>
<body>
	<!-- import태그를 통해 xml문서를 가져온다. var속성에 지정한 변수에
	저장한다. -->
	<c:import url="../inc/BookList.xml" var="booklist" charEncoding="UTF-8"></c:import>
<%-- 	<c:set> --%>
<!-- 		<booklist> -->
<!-- 			<book> -->
<!-- 				<name>사피엔스</name> -->
<!-- 				<author>유발 하라리</author> -->
<!-- 				<price>19800</price> -->
<!-- 			</book> -->
<!-- 			<book> -->
<!-- 				<name>총,균,쇠</name> -->
<!-- 				<author>제러드 다이아몬드</author> -->
<!-- 				<price>25200</price> -->
<!-- 			</book> -->
<!-- 		</booklist> -->
<%-- 	</c:set> --%>
	<!-- XML파일을 휘래 parse태그에 1차로 설정한다. 뒤에서 blist라는 변수명으로
	각 노드를 파싱할 것이다. -->
	<x:parse xml="${ booklist }" var="blist"></x:parse>
	
	<!-- 
		booklist하위 노드에서 2개의 book이 있으므로 인덱스를 통해 접근한 후
		데이터를 파싱한다. 이와같이 XML문서를 마치 경로처럼 접근하는 것을 xPath
		라고 한다. xPath는 EL과는 다르게 {}(중괄호)를 사용하지 않는다. 
	-->
	<h4>파싱 1</h4><!-- 파싱을 위해 xalan.jar 파일이 필요 교재 참조 -->
	제목 : <x:out select="$blist/booklist/book[1]/name"/> <br />
	저자 : <x:out select="$blist/booklist/book[1]/author"/> <br />
	가격 : <x:out select="$blist/booklist/book[1]/price"/> <br />
	
	<h4>파싱 2</h4>
	<table border="1">
		<tr>
			<th>제목</th>
			<th>저자</th>
			<th>가격</th>
		</tr>
		<x:forEach select="$blist/booklist/book" var="item">
			<tr>
				<!-- 2개 이상의 노드가 있는 경우 forEach태그로 반복할 수 있다. -->
				<td><x:out select="$item/name"/></td>
				<td><x:out select="$item/author"/></td>
				<td>
					<x:choose>
						<x:when select="$item/price >= 20000">
							2만원 이상 <br />
						</x:when>
						<x:otherwise>
							2만원 미만 <br />
						</x:otherwise>
					</x:choose>
				</td>
			</tr>
		</x:forEach>
	</table>
	
	<h4>파싱 3</h4>
	<table border="1">
		<x:forEach select="$blist/booklist/book" var="item">
			<tr>
				<td><x:out select="$item/name"/></td>
				<td><x:out select="$item/author"/></td>
				<td><x:out select="$item/price"/></td>
				<!-- if태그로 조건이 true일때만 실행되는 구문을 작성함.
				비교연산자로 == 대신 =를 사용하니 주의해야 한다. -->
				<td><x:if select="$item/name = '총,균,쇠'">구매함</x:if></td>
			</tr>
		</x:forEach>
	</table>
</body>
</html>