<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.mar{
	margin:10% auto;
}


</style>
<div> <jsp:include page="../inc/staff/side.jsp"/> </div>
<table class="mar">
	<tr>
		<td>
			<h2>내정보</h2>
		</td>
	</tr>
	<tr>
		<td>
			<table>
					<tr>
						<td align="center">아이디</td>
					</tr>
					<tr>
						<td align="center"><input class="sss" type="text" name="pid" disabled value="${dtoS.id}" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="center">비밀번호</td>
					</tr>
					<tr>
						<td align="center"><input type="password" name="pw" disabled value="${dtoS.pw}"/></td>
					</tr>
					<tr>
						<td align="center">이름</td>
					</tr>
					<tr>
						<td align="center"><input type="text" name="pname" disabled value="${dtoS.name}" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="center">전화번호</td>
					</tr>
					<tr>
						<td align="center"><input type="text" name="number" disabled value="${dtoS.tel}"/></td>
					</tr>
					<tr>
						<td align="center">이메일</td>
					</tr>
					<tr>
						<td align="center"><input type="text" name="mail" disabled value="${dtoS.email}" /></td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
		</td>
	</tr>
</table>