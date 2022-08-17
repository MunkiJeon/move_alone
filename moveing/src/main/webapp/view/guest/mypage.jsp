<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<style>
*{
	margin:0px;
	padding:0px;
 }
 .menuI{
 	left:0px;
 	
 	width:100px;
 	height:600px;
 	background:#40699A;
 	position:fixed;
 	z-index: 1;
 	border: 1px solid black;
 }
 
 .box{
 	left:0px;
 	top:110px;
 	width:100px;
 	height: 400px;
 	background:#40699A;
 	position:fixed;
 	z-index: 2;
 }
 .menuI2{
 	width: 95px;
 	height: 90px;
 	display:inline-block;
 	margin-top: 5px;
 	cursor:pointer;
 }
  .header{
 	
 	width:93%;
 	height:80px;
 	border-bottom: 1px solid black;
 	margin-left: 100px;
 }
 
 .tableM{
 	/* border:1px solid black; */
 	margin-left:100px;
 	width:93%;
 	}
 	
  hr{
	margin-top: 25px;
	margin-bottom: 25px; 
	width: 100%;
 }
 .mar{
 	margin-left: 100px;
 	height: 100px;
 }

</style>
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">
let msg = "${msg}";
let st = "${oh}";
if(msg=="성공" && st == "yes"){
	alert("${msg}")	
}else if(msg=="실패" && st == "yes"){
	alert("${msg}")
}

$(function () {
	
	let index = 0;
	$(".tableM .section").hide();
	$(".tableM .section").eq(index).show();
	$(".menuI2").click(function() {
		index = $(this).index()
		$(".tableM .section").hide();
		$(".tableM .section").eq(index).show();
		
	})

	$(".menuI>.box>label").each(function () {
		$(this).css({background:"url('../ff/gg"+($(this).index()+1)+".png')",
			backgroundColor:"#40699A",
			"background-size":"100px 100px",
			"background-repeat":"no-repeat",
			"background-position":"center",
			"color":"white"})
	})
})
</script>

<!-- <input type="checkbox" id="w1">
<input type="checkbox" id="w2">
<input type="checkbox" id="w3">
<input type="checkbox" id="w4">
<input type="checkbox" id="w5"> -->

<div class="menuI">
	<div class="box">
		<label class="menuI2" id ="w1">내 정보</label>
		<label class="menuI2" id ="w2">기사정보</label>
		<label class="menuI2" id ="w3">내역</label>
		
		
	</div>
</div>

<div class="mar"><jsp:include page="../inc/guest/top.jsp"/></div>

<table class="tableM">
	<tr>
		<td>
			<table class="section">
				<tr>
					<td><h2>내 정보</h2></td>
				</tr>
				<tr>
					<td class="section2">
						<form action="GuestModifyReg" method="get" >
							<table >
								<tr>
									<td align="center">아이디</td>
								</tr>
								<tr>
									<td align="center"><input type="text" class="sss" name="id" value="${dto.id}" readonly="readonly"/></td>
								</tr>
								<tr>
									<td align="center">비밀번호</td>
								</tr>
								<tr>
									<td align="center"><input type="password" name="pw" placeholder="비밀번호 재설정"/></td>
								</tr>
								<tr>
									<td align="center">이름</td>
								</tr>
								<tr>
									<td align="center"><input type="text" name="pname" value="${dto.name}" disabled readonly="readonly"/></td>
								</tr>
								<tr>
									<td align="center">전화번호</td>
								</tr>
								<tr>
									<td align="center"><input type="text" name="tel" value="${dto.tel }"/></td>
								</tr>
								<tr>
									<td align="center">이메일</td>
								</tr>
								<tr>
									<td align="center"><input type="text" name="email" value="${dto.email}" /></td>
								</tr>
								<tr>
									<td align="center">
									<input type="submit" value="수정"/>
							
									</td>
								</tr>
								<tr>
									<td><a href="Out">탈퇴하기</a></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td>
			<table class="section">
				<tr>
					<td><h2>기사정보</h2></td>
				</tr>
					<tr>
						<td><div style="border: 1px solid black;"></div></td>
						<td><div style="border: 1px solid black;"></div></td>
					</tr>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td>
			<table class="section">
				<tr>
					<td><h2>결제내역</h2></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td>아이디</td>
								<td>예약날짜</td>
								<td>출발지</td>
								<td>도착지</td>
								<td>포장박스</td>
								<td>비용</td>
							</tr>
							<tr><td colspan="6"><hr></td></tr>
							<c:forEach items="${dto2 }" var="dtoa">
							<tr>
								<td>${dtoa.user_ID }</td>
								<td>${dtoa.reservat_date }</td>
								<td>${dtoa.start_point }</td>
								<td>${dtoa.end_point }</td>
								<td>${dtoa.box }</td>
								<td>${dtoa.cost }</td>
							</tr>
							
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<div class=mar><jsp:include page="../inc/guest/top.jsp"/></div>
