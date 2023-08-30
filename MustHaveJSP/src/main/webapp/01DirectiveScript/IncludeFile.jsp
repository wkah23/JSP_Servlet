<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	HTML 주석 : 보통의 경우 인클루드되는 JSP파일은 HTML태그 없이 순수한 JSP
	코드만 작성하는것이 좋다. 포함되었을때 HTML태그가 중복될 수 있기 때문이다.
 -->
<%
LocalDate today = LocalDate.now(); 
LocalDate tomorrow = LocalDate.now().plusDays(1);
%>
