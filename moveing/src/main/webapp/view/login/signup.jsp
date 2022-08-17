<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.singup{margin:0 auto;}
.formW{margin-top: 150px;}
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
	/* 5 */
	.custom-btn {
	  background: #000;
	  color: #fff;
	  line-height: 42px;
	  padding: 0;
	  border: none;
	  font-size: 15px;
	  cursor:pointer;
	}
	
	.formW{

	margin-top: 150px;

	
}

	input {
		border: 1px #979797 solid; 
	}
	
	#singup{
		margin: auto;
		margin-top : 100px;
		text-align: left;
		width: 800x;
		border-spacing: 0 10px;
		
	}
	
	#singup p{
		margin: 0px;
	}
	
	caption {
		font-size: 30px;
		margin-bottom: 50px;
	}

	
</style>
<form action="SignUpReg" class="formW" method="post">
   <table class="singup">
      <tr><td align="center"><h2 >정보입력</h2></td></tr>
      <tr>
         <td align="center">아이디</td>
      </tr>
      <tr>
         <td align="center"><input type="text" name="pid" placeholder="아이디를 입력하세요"/></td>
      </tr>
      <tr>
         <td align="center">비밀번호</td>
      </tr>
      <tr>
         <td align="center"><input type="password" name="pw" placeholder="영문,숫자,특수문자를 포함한 8자 이상의 문자"/></td>
      </tr>
      <tr>
         <td align="center">이름</td>
      </tr>
      <tr>
         <td align="center"><input type="text" name="pname" placeholder="이름을 입력하세요"/></td>
      </tr>
      <tr>
         <td align="center">전화번호</td>
      </tr>
      <tr>
         <td align="center"><input type="text" name="number" placeholder="01012345678"/></td>
      </tr>
      <tr>
         <td align="center">이메일</td>
      </tr>
      <tr>
         <td align="center"><input type="text" name="mail" placeholder="id@example.com" /></td>
      </tr>
      <tr>
         <td align="center"><input type="submit" value="회원가입"></td>
      </tr>
      <tr>
         <td><h2>이미 회원이신가요?</h2><a href="Login">로그인하기</a></td>
      </tr>
   </table>

<script type="text/javascript">

	var idUsable = "";  // null, POSSIBLE, IMPOSSIBLE
	
	$(document).ready(function(){
		
		//중복체크 버튼을 클릭했을 때
		$('#id_check').click(function(){
			
			if($('input[name="pid"]').val().length == 0){
				alert("아이디를 입력하세요");
				return;
			}
			else{
				$.ajax({ 
					url : '<c:url value="/ajax/IdCheckProc"/>', 
					type:'POST',
					data : {
					
						id : $('input[name="pid"]').val() // 사용자가 입력한 id
					},
					dataType:'json',
					success : function(responseData){
						idUsable = $.trim(responseData);
						
						console.log(responseData.chk =='POSSIBLE');
						console.log(responseData.chk);
						console.log('POSSIBLE');
						if(responseData.chk.trim() == 'POSSIBLE'){ 					
							$('#id_message').html("<font color=blue>사용 가능합니다.</font>");
							$('#id_message').show(); 
						}else{
							$('#id_message').html("<font color=red>이미 사용중인 아이디</font>");
							$('#id_message').show();
						}
					}
				});//ajax	
			} 
		});
		
		
		$('input[name="pid"]').keydown(function(){ //키보드가 한번이라도 눌리면 발생하는 이벤트 처리
			$('#id_message').css('display', 'none'); // 키가 눌렸을 때 안보이게.
			isChanged = true;
			ues=""; // 새로운 데이터의 입력이 들어오면 상태 초기화
		});
		
	});//ready
	
	function gotoRegisterProc(){
		
		if($('input[name="pid"]').val() == ""){
			alert("아이디를 입력하세요");
			$('input[name="pid"]').focus();
			return;
		}
		
		if($('input[name="pw"]').val() == ""){
			alert("비밀번호를 입력하세요");	
			$('input[name="pw"]').focus();
			return;
		}
		
		if($('input[name="re_password"]').val() == ""){
			alert("비밀번호 확인을 입력하세요");	
			$('input[name="re_password"]').focus();
			return;
		}
		
		if($('input[name="pw"]').val() != $('input[name="re_password"]').val()){
			alert("비밀번호가 일치하지 않습니다.");		
			return;
		} 
		
		if($('input[name="pname"]').val() == ""){
			alert("이름을 입력하세요");		
			$('input[name="pname"]').focus();
			return;
		}
		
		if($('input[name="number"]').val() == ""){
			alert("전화번호를 입력하세요");		
			$('input[name="number"]').focus();
			return;
		}
		
		if($('input[name="maile"]').val() == ""){
			alert("이메일을 입력하세요");		
			$('input[name="maile"]').focus();
			return;
		}
		
		
		if(idUsable == ""){
			alert("아이디 중복체크를 수행해주세요");
			return;
		}
		
		if(idUsable == "IMPOSSIBLE"){
			alert("아이디 중복여부를 확인하세요");
			return;
		}
		
		var reg = /^[a-zA-Z0-9]{3,10}$/;
		
		var tempId = $('input[name="pid"]').val();
		if(tempId.search(reg) == -1){
			alert("아이디는 3~10자의 영문, 숫자만 가능합니다");
			return;
		}
		
		var tempPw = $('input[name="password"]').val();
		if(tempPw.search(reg) == -1){
			alert("비밀번호는 3~10자의 영문, 숫자만 가능합니다");
			return;
		} 
		
		document.f.submit();
	}
</script>

 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<form name=f action="SignUpReg" class="formW" method="post">
	<table class="singup" >
		<caption>
			SIGN UP
		</caption>
		
		<tr>
			<td><b>아이디</b></td>
			<td><input type="text" name="pid" style="width: 150px" maxlength="10" placeholder="3~10자의 영문, 숫자"> 
			<input type="button" id="id_check" value="중복체크" style="height: 22px;">
				<span id="id_message" style="font-size: 13px"></span></td>
		</tr>
		
		<tr>
			<td><b>비밀번호</b></td>
			<td><input type="password" name="pw" maxlength="8"
				style="width: 150px" placeholder="3~10자의 영문, 숫자"></td>
		</tr>
	 	<tr>
			<td><b>비밀번호 확인</b></td>
			<td><input type="password" name="re_password" maxlength="8"
				style="width: 150px"></td>
		</tr> 
		<tr>
			<td><b>성명</b></td>
			<td><input type="text" name="pname" style="width: 150px"></td>
		</tr>
		<tr>
			<td valign="top"><b>전화번호</b></td>
			<td><input type="text" name="number"
				style="width: 150px"></td>
		</tr>

		<tr>
			<td><b>이메일</b></td>
			<td><input type="text" name="mail" style="width: 150px"/></td>
		</tr>

		<tr>
			<td colspan="8"><br> <input type="submit" value="회원가입"
				class="custom-btn" onClick="gotoRegisterProc()"
				style="width: 100%; height: 50px"></td>
		</tr>
		
		<tr>
			<td><h2>이미 회원이신가요?</h2> <a href="Login">로그인하기</a></td></tr>

	</table>
</form>