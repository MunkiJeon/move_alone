<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.mar{
	margin:10% auto;
}

</style>
    
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">



</script>
<div> <jsp:include page="../inc/staff/side.jsp"/> </div>
    <table class="mar">
				<tr>
					<td>
						<h1>매출</h1>
					</td>
				</tr>
				<tr>
					<td>
						<table border="">
							<tr>
								<td>아이디</td>
								<td>예약날짜</td>
								<td>출발지</td>
								<td>도착지</td>
								<td>포장박스</td>
								<td>금액</td>
							</tr>
							<tr>
								<td colspan="6"><hr></td>
							</tr>
							
							<c:forEach items="${dtoS2}" var="dtoa">
						
							<tr>
								<td >${dtoa.user_ID}</td>
								<td>${dtoa.reservat_date}</td>
								<td>${dtoa.start_point}</td>
								<td>${dtoa.end_point}</td>
								<td>${dtoa.shopping_list}</td>
								<td>${dtoa.cost}</td>
							</tr>
							
							</c:forEach>
							
							<tr><td colspan="6">합계:${re }</td></tr>
						</table>
					
			</table>