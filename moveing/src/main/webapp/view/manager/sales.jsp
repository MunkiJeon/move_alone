<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource'/>/css/manager/calculate.css">
<div class="managerWrap">
	<table class="sales">
		<tr>
			<td>매입</td>
			<td>매출</td>
			<td>정산</td>
		</tr>
		<tr>
			<td>${ma }</td>
			<td>${pl }</td>
			<td>${pl-ma }</td>
		</tr>
	</table>
</div>