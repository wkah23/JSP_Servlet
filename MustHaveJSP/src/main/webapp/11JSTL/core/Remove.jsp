<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="scopeVar" value="page Value"></c:set>
<c:set var="scopeVar" value="Request Value" scope="request"></c:set>
<c:set var="scopeVar" value="Session Value" scope="session"></c:set>
<c:set var="scopeVar" value="Application Value" scope="application"></c:set>
<meta charset="UTF-8">
<title>JSTL - remove</title>
</head>
<body>
	<h4>출력하기</h4>
	<!-- 
		동일한 이름으로 저장했으므로 영역명을 지정하지 않은 상태라면
		가장 좁은 page영역의 속성값이 출력된다.
	 -->
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
	
	<h4>session 영역에서 삭제하기</h4>
	<!-- 영역을 지정한 상태에서 속성을 삭제한다. 이때는 session에서만 삭제된다. -->
	<c:remove var="scopeVar" scope="session"/>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
	
	<h4>scope 지정 없이 삭제하기</h4>
	<!-- 영역 지정없이 삭제하면 동일한 이름의 모든 속성이 삭제되므로 주의해야한다. -->
	<c:remove var="scopeVar"/>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
</body>
</html>