<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <style>
     .information{
 	top:100px;
 	left:40%;
 	position: fixed;
 	display: flex;
 }
 
 .mar{
	margin:10% auto;
	width:80%;
}
    </style>
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">
$(function () {
	$(".touch").click(function() {
		

		if(!$(this).hasClass("qwer")){
			console.log("aaaaaaaaaaaaa")
			$(this).addClass("qwer");
			$(".information").show();
		}else{
			console.log("efwefwe")
			$(this).removeClass("qwer");
			$(".information").hide();
		}
		
	})
})
</script>
<div> <jsp:include page="../inc/guest/side.jsp"/> </div>
<div style="margin:10% auto;">
<h2>매칭정보</h2>
<div style="border-bottom: 2px solid black; width:80%;"></div>

<c:forEach items="${dto3 }" var="dtoa2">
						<div class="information">
							<div style="border: 1px solid black;"><img class="imgSize" src="<c:url value='/resource/image/${dtoa3.pic}'/>" alt=""></div>
							
							<div style="border: 1px solid black;">
							<table>
								<tr>
									<td>이름</td>
								</tr>	
								<tr>
									<td><input type="text" value="${dtoa2.name }"></td>
								</tr>
								<tr>
									<td>전화번호</td>
								</tr>
								<tr>
									<td><input type="text" value="${dtoa2.tel }"></td>
								</tr>
								<tr>
									<td>기사 아이디</td>
								</tr>
								<tr>
									<td><input type="text" value="${dtoa2.id }"></td>
								</tr>
								<tr>
									<td>이메일</td>
								</tr>
								<tr>
									<td><input type="text" value="${dtoa2.email }"></td>
								</tr>
							</table></div>
						</div>
				</c:forEach>

    <table border="" class="mar">
    
				<c:forEach items="${dto4 }" var="dtoo" varStatus="no">
				<tr>
					<td><h2>매칭정보</h2></td>
					<td>기사정보</td>
					<td>
					<div class="touch"><img class="stfImg" src="../resource/image/icon3.png" alt=""></div></td>
				</tr>
				
				<tr>
				<td>이사일: ${dtoo.reservat_date}</td>
				<td></td>
				<td>예약번호: ${dtoo.res_num }</td>
				<td></td>
				<td></td>
				
				<tr><td colspan="5" style="border-bottom: 2px solid black;"></td></tr>
				
					<tr>
						<td>예약날짜: ${dtoo.req_date }</td>
			
						<td>출발지: ${dtoo.start_point }</td>
						
						<td>도착지: ${dtoo.end_point }</td>
						
						<td>요청사항: ${dtoo.requests }</td>
					</tr>
					<tr>
						<td>짐목록: ${dtoo.luggage_list }</td>
						<td>[ 출발지 상세 ]
							<ul>
								<li>엘리베이터: ${ele}</li>
								<li>주차장: ${parking}</li>
								<li>층수: ${floors}</li>
								<li>방개수: ${rooms}</li>
							</ul>
						</td>
						<td>[ 도착지 상세 ]
							<ul>
								<li>엘리베이터: ${ele2}</li>
								<li>주차장: ${parking2}</li>
								<li>층수: ${floors2}</li>
								<li>방개수: ${rooms2}</li>
							</ul>
						</td>
					</tr>
					
					<tr><td colspan="5" style="border-bottom: 2px solid black;"></td></tr>
					
					</c:forEach>
			</table>
			</div>