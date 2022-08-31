<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.mar{
	margin:10% auto;
	width:80%;
}

.tList{
 width:80%;

}
</style>

<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	


	
	})
</script>
<div> <jsp:include page="../inc/guest/side.jsp"/> </div>

			<table class="mar">
				<tr>
					<td><h2>결제내역</h2></td>
				</tr>
				<tr>
					<td>
						<table class="tList">
							<tr>
								<td>아이디</td>
								<td>기사아이디</td>
								<td>종류</td>
								<td>이사날짜</td>
								<td>출발지</td>
								<td>도착지</td>
								<td>짐목록</td>
								<td>비용</td>
								<td>현재 상태</td>
							</tr>
							<tr><td colspan="9" style="border-bottom: 2px solid black;"></td></tr>
							<c:forEach items="${dto2 }" var="dtoa">
							<c:if test="${dtoa.req_state!=2 }">
								<tr>
									<td>${dtoa.user_ID }</td>
									<td>${dtoa.driver_ID }</td>
									<td>${dtoa.SV_Type }</td>
									<td>${dtoa.reservat_date }</td>
									<td>${dtoa.start_point }</td>
									<td>${dtoa.end_point }</td>
									<td>${dtoa.luggage_list }</td>
									<td>${dtoa.cost } 원</td>
									<td>
									<c:if test="${dtoa.req_state==0 }">
										매칭중
									</c:if>
									<c:if test="${dtoa.req_state==1 }">
										매칭완료
									</c:if>
									</td>
								</tr>
							</c:if>
							<tr><td colspan="9" style="border-bottom: 2px solid black;"></td></tr>
							<c:if test="${dtoa.req_state==2 }">
								<tr>
									<td>${dtoa.user_ID }</td>
									<td>${dtoa.driver_ID }</td>
									<td>${dtoa.SV_Type }</td>
									<td>${dtoa.reservat_date }</td>
									<td>${dtoa.start_point }</td>
									<td>${dtoa.end_point }</td>
									<td>${dtoa.luggage_list }</td>
									<td>${dtoa.cost } 원</td>
									<td>
									<c:if test="${dtoa.req_state==2 }">
										매칭완료
									</c:if>
									</td>
								</tr>
							</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
			