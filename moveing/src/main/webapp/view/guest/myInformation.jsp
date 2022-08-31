<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<style>

.mar{
	margin:10% auto;
}
 .modifyForm{
 	background: rgb(212,244,250);
 	border: 2px solid black;
 	position: fixed;
 	left:30%;
 	top:20%;
 }
 .info_ChangeForm{
 	background: rgb(212,244,250);
 	border: 2px solid black;
 	position: fixed;
 	left:30%;
 	top:20%;
 }
 .DeleteForm{
 	padding: 5px;
 	background: rgb(212,244,250);
 	border: 2px solid black;
 	position: fixed;
 	left:20%;
 	top:15%;
 }
 .mar button{
 	padding: 5px;
 	background: rgb(61, 81, 255);
 	color: white;
 }
</style>

<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".modifyForm").hide();
	$(".info_ChangeForm").hide();
	$(".DeleteForm").hide();
	
	$(".pw_Change").click(function() {
		$(".modifyForm").show();
	})
	$(".modifyForm .cancel").click(function() {
		$(".modifyForm").hide();
	})
	
	$(".info_Change").click(function() {
		$(".info_ChangeForm").show();
	})
	$(".info_ChangeForm .cancel").click(function() {
		$(".info_ChangeForm").hide();
	})
	
	$(".delete").click(function() {
		$(".DeleteForm").show();
	})
	$(".DeleteForm .cancel").click(function() {
		$(".DeleteForm").hide();
	})
	
})

function pw_unlock() {
	/* console.log("pw_unlock 눌림"); */
	var pw = prompt("비밀번호를 입력해 주세요", "");
	pw_ch(pw);
}
function pw_ch(pw) {
	/* console.log(pw);
	console.log("${dto.pw}"); */
	if("${dto.pw}" == pw){
		alert("비밀번호 인증 되었습니다.");
		$(".mar .pw").val("${dto.pw}");
		$(".mar .tel").val("${dto.tel}");
		$(".mar .email").val("${dto.email}");
	}else{
		alert("비밀번호 인증 실패 하였습니다."+${dto.pw.equals(pw)});		
	}
}
</script>


<div> <jsp:include page="../inc/guest/side.jsp"/> </div>
<div class="modifyForm">
<form action="GuestPwModify" method="get">
	<table>
		<tr>
			<td>현재 비밀번호</td>
			<td><input type="text" class="pwP" name="pwP" maxlength="8" style="border-bottom: 1px solid black;"></td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
			<td><input type="text" class="pwN" name="pwN" maxlength="8" style="border-bottom: 1px solid black;"></td>
		</tr>
		<tr height="5px"></tr>
		<tr>
			<td align="center"><input type="submit" value="확인"></td>
			<td align="center"><input class="cancel" type="button" value="취소"></td>
		</tr>
	</table>
</form>
</div>

<div class="info_ChangeForm">
<form action="GuestModifyReg" method="get">
	<table>
		<tr>
                  <td><b>아이디 [변경 불가]</b></td>
                  <td><input type="text" name="id" value="${dto.id}" disabled readonly="readonly">
                  </td>
               </tr>
               <tr>
                  	<td><b>비밀번호 [변경 불가]</b></td>
                  	<td><input type="text" name="pw" class="pw" maxlength="8" value="*******" disabled readonly="readonly"></td>
               </tr>
               <tr>
                  <td><b>이름</b></td>
                  <td><input type="text" name="pname" value="${dto.name}"/></td>
               </tr>

               <tr>
                  <td valign="top"><b>전화번호</b></td>
                  <td><input type="text" name="tel" class="tel" value="${dto.tel}" /></td>
               </tr>

               <tr>
                  <td valign="top"><b>이메일</b></td>
                  <td><input type="text" name="email" class="email" value="${dto.email}" /></td>
               </tr>
		<tr height="5px"></tr>
		<tr>
			<td align="center"><input type="submit" value="확인"></td>
			<td align="center"><input class="cancel" type="button" value="취소"></td>
		</tr>
	</table>
</form>
</div>

<div class="DeleteForm">
<form action="GuestDeleteReg" method="get">
	<table>
		<tr><td align="center"><h2>탈퇴 안내</h2></td></tr>
		<tr>
			<td colspan="2">
			<p align="center" style="font-size: 20px;" >사용하고 계신 아이디 : ${dto.id}</p>
			<p align="center">탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
			탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 <br>신중하게 선택하시기 바랍니다.<br>
			- 탈퇴 후에도 결제와 이사 기록은 당사에 보관 됩니다. -</p>
			<p align="center" style="font-size: 10px; color: gray;">탈퇴를 진행 하시려면 비밀번호 입력후 "탈퇴하기"를 눌러주세요.</p>
			</td>
		</tr>
		<tr>
			<td align="center">암호입력: <input type="password" name="pw2"/> <input type="submit" value="탈퇴하기"></td>
		</tr>
		<tr height="5px"></tr>
		<tr>
			<td align="center"><input class="cancel" type="button" value="취소"></td>
		</tr>
	</table>
</form>
</div>

<table class="mar">
   <tr>
      <td align="center">
      <h2>내 정보</h2>
      <button type="button" class="PersonInfo" style="background: gray; color: white;" onclick="pw_unlock()">개인정보 숨김</button>
      </td>
      <td></td>
   </tr>
   <tr>
      <td >
         <form action="GuestModifyReg" method="get">
            <table>
               <tr>
                  <td><b>아이디</b></td>
                  <td><input type="text" name="id" value="${dto.id}" disabled readonly="readonly">
                  </td>
               </tr>
               <tr>
                  	<td><b>비밀번호</b></td>
                  	<td><input type="text" name="pw" class="pw" maxlength="8" value="*******" disabled readonly="readonly"></td>
                    
               </tr>
               <tr>
                  <td><b>이름</b></td>
                  <td><input type="text" name="pname" value="${dto.name}" disabled readonly="readonly"/></td>
               </tr>

               <tr>
                  <td valign="top"><b>전화번호</b></td>
                  <td><input type="text" name="tel" class="tel" value="010********" disabled readonly="readonly" /></td>
               </tr>

               <tr>
                  <td valign="top"><b>이메일</b></td>
                  <td><input type="text" name="email" class="email" value="****@*****.***" disabled readonly="readonly" /></td>
               </tr>
				<tr height="20px"></tr>
               <tr>
                  <td colspan="2" align="center" >
                  <button class="info_Change" type="button">개인정보 수정</button>
                  <button class="pw_Change" type="button">비밀번호 변경</button>
                  </td>
               </tr>
               <tr height="20px"></tr>
               <tr>
                  <td colspan="3" align="center">
                  <button class="delete" type="button">탈퇴하기◀</button>
               </tr>
            </table>
         </form>
      </td>
   </tr>
</table>
<script>


</script>