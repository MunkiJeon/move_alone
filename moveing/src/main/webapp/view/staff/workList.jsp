<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.mar{
	margin:10% 8%;
	width:95%;
}
.tList{
	width:95%;
}

</style>

<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">

$(function(){
	$(".selected").click(function() {
		let info = $(this).val();
		let info2 = $(".selected");
		
			$.ajax({
				url:'<c:url value="/ajax/AjaxSelected"/>',
				type:"POST",
				data:{ino:info},
				async:false,
				dataType:'json',
				success:function(data){
					
					console.log(data.cnt)
					console.log(info2.parent(".btn"))
					if(data.cnt==1){
						location.reload();
						console.log(data.cnt)
						//$("."+info2.attr("data-index")).remove();
						alert("선택완료");
					}
				},
				error:function(e){
					console.log(e)
				}
			})
		})
	
})
</script>
<div> <jsp:include page="../inc/staff/side.jsp"/> </div>
<table class="mar">
				<tr>
					<td><h2>매칭목록</h2></td>
				</tr>
				
				<tr>
					<td>
						<table class="tList">
						
							<tr>
								<td>아이디</td>
								<td>이사날짜</td>
								<td>종류</td>
								<td>출발지</td>
								<td>도착지</td>
								<td>구매</td>
								<td>금액</td>
							</tr>
							<tr><td colspan="7" style="border-bottom: 2px solid black;"></td></tr>
						
								<c:forEach items="${dto4}" var="dtoaa" varStatus="no">
									
								<tr class="btn${no.index}">
									<td>${dtoaa.user_ID}</td>
									<td>${dtoaa.reservat_date }</td>
									<td>${dtoaa.SV_Type }</td>
									<td>${dtoaa.start_point }</td>
									<td>${dtoaa.end_point }</td>
									<td>${dtoaa.shopping_list }</td>
									<td>${dtoaa.cost }</td>
									<td><button class="selected" data-index="btn${no.index}" value="${dtoaa.res_num }">선택</button></td>
								</tr>
								</c:forEach>
								
						
						</table>
					</td>
				</tr>
			</table>