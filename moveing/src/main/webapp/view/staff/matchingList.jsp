<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	$(".selected2").click(function() {
		let info3 = $(this).val();
		let info4 = $(".selected2");
		
			$.ajax({
				url:'<c:url value="/ajax/AjaxSelected2"/>',
				type:"POST",
				data:{ino2:info3},
				async:false,
				dataType:'json',
				success:function(data){
					
					console.log(data.cnt)
					console.log(info4.parent(".btna"))
					if(data.cnt==1){
						let clone = $("."+info4.attr("data-index")).clone();
						console.log(clone)
						console.log(data.cnt)
						//$("."+info4.attr("data-index")).remove();
						//clone.eq(0).remove();
						//$(".testtest").append(clone);
						location.reload();
						alert("처리완료");
						
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
					<td>
						<h1>매칭현황</h1>
					</td>
				</tr>
				<tr>
					<td>
						<table class="tList" border="">
							
							<tr>
								<td>고객아이디</td>
								<td>이사날짜</td>
								<td>종류</td>
								<td>출발지</td>
								<td>도착지</td>
								<td>구매</td>
								<td>금액</td>
							</tr>
							<tr><td colspan="7" style="border-bottom: 2px solid black;"></td></tr>
							
							
							<c:forEach items="${dtoS3}" var="dtoa" varStatus="no">
							<tr class="btna${no.index}">
									<td>${dtoa.driver_ID}</td>
									<td>${dtoa.reservat_date }</td>
									<td>${dtoa.SV_Type }</td>
									<td>${dtoa.start_point }</td>
									<td>${dtoa.end_point }</td>
									<td>${dtoa.shopping_list }</td>
									<td>${dtoa.cost }</td>
								<td><button class="selected2" data-index="btna${no.index}" value="${dtoa.res_num }">완료</button></td>
							</tr>
							
							
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>		