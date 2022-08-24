<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#productManage{
		margin : auto;
		text-align: center;
		width : 750px;
	}
	
	#productManage a:hover{
		color : #C2674B;
	}
	
	#productManage > caption{
		font-size: 19px;
	}
	
	/* #productManage tr:hover {background-color: #C2674B;} */
</style>

<script>
	let path = "${path}";
		
</script>
<table id="productManage">
	<caption>
		<b>상품관리</b>
		<hr>
	</caption>
	<tr>
		<th>번호</th>
		<th>대분류</th>
		<th>소분류</th>
		<th>상품명</th>
		<th>도매가격</th>
		<th>상품가격</th>
		<th></th>
		<th></th>
		<th>상품이미지</th>
	</tr>
	<c:forEach items="${list }" var="pbean">
	<tr>
		<td>${ pbean.no}</td>
		<td>${ pbean.lcname }</td>
		<td>${pbean.scname}</td>
		<td>${pbean.name}</td>
		<td>${ pbean.oriprice}</td>
		<td>${ pbean.discprice}원</td>
		<td><a href="ProductUpdateForm?pno=${ pbean.no}">추가/수정</a></td>
		<td><a href="ProductDelete?pno=${pbean.no}">삭제</a></td>
		<td>
			<img src="../resource/productImg/${pbean.mainImgN }" width="50px" height="60px">		
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="9"><a href="ProductInsertForm">상품등록</a></td>
	</tr>
</table>