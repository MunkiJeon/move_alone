<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<style>

.mar{
	margin:10% auto;
}
 .modifyForm{
 	border: 2px solid black;
 	position: fixed;
 	left:1000px;
 	top:200px;
 }

</style>

<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".modifyForm").hide();
	
	$(".modifyBtn").click(function() {
		$(".modifyForm").show();
	})
	
	$(".modifyForm .cancel").click(function() {
		$(".modifyForm").hide();
	})
})
</script>


<div> <jsp:include page="../inc/guest/side.jsp"/> </div>
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

<table class="mar">
   <tr>
      <td><h2>내 정보</h2></td>
   </tr>
   <tr>
      <td >
         <form action="GuestModifyReg" method="get">
            <table>
               <tr>
                  <td><b>아이디</b></td>
                  <td><input type="text" name="id" value="${dto.id}" readonly="readonly" disabled readonly="readonly">
                  </td>
               </tr>
               <tr>
                  	<td><b>비밀번호</b></td>
                  	<td><input type="text" name="pw" class="pw" maxlength="8" value="*******" disabled readonly="readonly"></td>
                   <td><button type="button" style="background: gray;" onclick="pw_unlock()">잠김</button></td> 
               </tr>
<!--                    <tr>
                           <td><b>비밀번호변경</b></td>
                           <td><input type="password" name="re_password"
                              placeholder="변경할비밀번호"></td>
                        </tr> -->
               <tr>
                  <td><b>이름</b></td>
                  <td><input type="text" name="pname" value="${dto.name}"/></td>
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
                  <td><input class="modifyBtn" type="button" value="비밀번호 수정"></td>
               </tr>
               <tr>
                  <td><a href="Out">탈퇴하기</a></td>
               </tr>
            </table>
         </form>
      </td>
   </tr>
</table>
<script>

function pw_unlock() {
	console.log("pw_unlock 눌림");
	var pw = prompt("비밀번호를 입력해 주세요", "");
	pw_ch(pw);
}
function pw_ch() {
	if(${dto.pw == pw}){
		alert("비밀번호 인증 되었습니다." +${dto.pw.equals(pw)});
		$(".mar .pw").val(${dto.pw});
	}else{
		alert("비밀번호 인증 실패 하였습니다."+${dto.pw.equals(pw)});		
	}
}
</script>