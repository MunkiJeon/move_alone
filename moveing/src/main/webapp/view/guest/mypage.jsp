<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<style>
*{
	margin:0px;
	padding:0px;
 }
 .menuI{
 	left:-100px;
 	top:150px;
 	width:100px;
 	height:300px;
 	/*  background:#40699A;  */
 	position:fixed;
 	z-index: 3;
 	/* border: 1px solid red; */
 	display: flex;
 }
 
 .box{
 	left:0px;
 	top:150px;
 	width:100px;
 	height:292px;
 	 background:#40699A; 
 	
 	/* border:1px solid blue; */
 	
 }
 .box2{
 	top:120px;
 	left:90px;
 	width:30px;
 	height:40px;
 	border: 1px solid black; 
 	background:#40699A; 
 	border-radius:20%;
 	position: absolute;
 	text-align: right;
 	line-height: 35px;
 	cursor:pointer;
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
 	

 .mar{
 	margin-left: 100px;
 	height: 100px;
 }
 .information{
 	top:100px;
 	left:35%;
 	position: fixed;
 	display: flex;
 }
 .modifyForm{
 	border: 2px solid black;
 	position: fixed;
 	left:500px;
 	top:100px;
 }
 .imgSize{
 	width: 300px;
 	height: 220px;
 }
.menuI>.box2 input[type=checkbox]{
	display: none;
}
</style>
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">
/* let msg = "${msg}";
let st = "${oh}";
if(msg=="성공" && st == "yes"){
	alert("${msg}")	
}else if(msg=="실패" && st == "yes"){
	alert("${msg}")
} */

$(function () {
	
	
	$(".modifyForm").hide();
	let index = 0;
	$(".tableM .section").hide();
	$(".tableM .section").eq(index).show();
	$(".information").hide();
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
	
	$(".tableM .section .stfImg").hover(
			function () {
				$(".information").show();
			},
			function () {
				$(".information").hide();
			})
			
	$(".tableM .section .section2 .modifyBtn").click(function() {
		$(".modifyForm").show();
	})
	$(".modifyForm .cancel").click(function() {
		$(".modifyForm").hide();
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
		<label class="menuI2" id ="w2">이사정보</label>
		<label class="menuI2" id ="w3">내역</label>
	</div>
	
	<label for="bo"class="box2">
	▶<input type="checkbox" id="bo">
	</label>
</div>

<div class="modifyForm"><form action="GuestPwModify" method="get">
	<table>
		<tr>
			<td>현재 비밀번호</td>
			<td><input type="text" name="pwP" maxlength="8"></td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
			<td><input type="text" name="pwN" maxlength="8"></td>
		</tr>
		
		<tr><td><input type="submit" value="확인"></td>
		<td><input class="cancel" type="button" value="취소"></td>
		</tr>
	</table>
</form></div>

<div class="mar"><jsp:include page="../inc/guest/top.jsp"/></div>

						<div class="information">
							<div style="border: 1px solid black;"><img class="imgSize" src="<c:url value="/resource/image/"/>${dto3.pic}" alt=""></div>
							
							<div style="border: 1px solid black;">
							<table>
								<tr>
									<td>이름</td>
								</tr>
								
								<tr>
									<td><input type="text" value="${dto3.name }"></td>
								</tr>
								<tr>
									<td>전화번호</td>
								</tr>
								<tr>
									<td><input type="text" value="${dto3.tel }"></td>
								</tr>
								<tr>
									<td>기사 아이디</td>
								</tr>
								<tr>
									<td><input type="text" value="${dto3.id }"></td>
								</tr>
								<tr>
									<td>이메일</td>
								</tr>
								<tr>
									<td><input type="text" value="${dto3.email }"></td>
								</tr>
							</table></div>
						</div>

<table class="tableM">
	<tr>
      <td>
         <table class="section">
            <tr>
               <td><h2>내 정보</h2></td>
            </tr>
            <tr>
               <td class="section2">
                  <form action="GuestModifyReg" method="get">
                     <table>
                        <tr>
                           <td><b>아이디</b></td>
                           <td><input type="text" name="id" value="${dto.id}"
                              readonly="readonly" disabled readonly="readonly">
                           </td>
                        </tr>
                        <tr>
                           <td><b>기존비밀번호</b></td>
                           <td><input type="text" name="pw" maxlength="8"
                              value="${dto.pw}" disabled readonly="readonly"></td>
                        </tr>
<!--                         <tr>
                           <td><b>비밀번호변경</b></td>
                           <td><input type="password" name="re_password"
                              placeholder="변경할비밀번호"></td>
                        </tr> -->

                        <tr>
                           <td><b>이름</b></td>
                           <td><input type="text" name="pname" value="${dto.name}"
                            /></td>
                        </tr>

                        <tr>
                           <td valign="top"><b>전화번호</b></td>
                           <td><input type="text" name="tel" value="${dto.tel }" /></td>
                        </tr>

                        <tr>
                           <td valign="top"><b>이메일</b></td>
                           <td><input type="text" name="email" value="${dto.email}" /></td>
                        </tr>



                        <tr>
                           <td align="center"><input type="submit" value="기본정보수정" /></td>
                        </tr>
                        <tr>
                           <td><a href="Out">탈퇴하기</a></td>
                           <td><input class="modifyBtn" type="button" value="비밀번호 수정"></td>
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
	
			<table border="" class="section">
				<c:forEach items="${dto4 }" var="dtoo">
				<tr>
					<td><h2>매칭정보</h2></td>
					<td>기사정보</td>
					<td><label><img class="stfImg" src="../resource/image/icon3.png" alt=""></label></td>
				</tr>
				
				<tr>
				<td >이사일: ${dtoo.req_date}</td>
				<td></td>
				<td>예약번호: ${dtoo.res_num }</td>
				<td></td>
				<td></td>
				
				<tr><td colspan="5" style="border-bottom: 2px solid black;"></td></tr>
				</tr>
				
					<tr>
						<td>예약날짜: ${dtoo.reservat_date }</td>
			
						<td>출발지: ${dtoo.start_point }</td>
						
						<td>도착지: ${dtoo.end_point }</td>
						
						<td>박스: ${dtoo.shopping_list }</td>
					</tr>
					<tr>
					<td>종류: ${dtoo.luggage_list }</td>
					<td>출발지 상세<ul><li>엘리베이터: ${ele}</li>
					<li>주차장: ${parking}</li>
					<li>층수: ${floors}</li>
					<li>방개수: ${rooms}</li>
					</ul></td>
					<td>도착지 상세<ul><li>엘리베이터: ${ele2}</li>
					<li>주차장: ${parking2}</li>
					<li>층수: ${floors2}</li>
					<li>방개수: ${rooms2}</li>
					</ul></td>
					</tr>
					
					<tr><td colspan="5" style="border-bottom: 2px solid black;"></td></tr>
					
					<tr><td>요청사항: ${dtoo.requests }</td>
					
					</tr>
					
					</c:forEach>
			</table>
			
		</td>
	</tr>
	
	
	<tr>
		<td>
		<c:forEach items="${dto2 }" var="dtoa">
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
							
							<tr>
								<td>${dtoa.user_ID }</td>
								<td>${dtoa.reservat_date }</td>
								<td>${dtoa.start_point }</td>
								<td>${dtoa.end_point }</td>
								<td>${dtoa.shopping_list }</td>
								<td>${dtoa.cost }</td>
							</tr>
							<tr><td></td></tr>
							
							
						</table>
					</td>
				</tr>
			</table>
			</c:forEach>
		</td>
	</tr>
</table>

<div class=mar><jsp:include page="../inc/guest/top.jsp"/></div>
