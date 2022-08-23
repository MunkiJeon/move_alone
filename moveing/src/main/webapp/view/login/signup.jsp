<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.custom-btn {
	color: #fff;
	line-height: 42px;
	padding: 0;
	border: none;
	font-size: 15px;
	cursor: pointer;
	background-color: #40699A;
	width: 100%; 
	height: 50px;
}

#id_check {
	color: #fff;
	padding: 0;
	border: none;
	width: 70px;
	height: 30px;
	cursor: pointer;
	background-color: #40699A;
}

.formW {
	margin-top: 150px;
}

td {
	margin: 5px;
}

input, select  {
	border: 1px #979797 solid;
	height: 30px;
	margin: 5px;
}

#singup {
	margin: auto;
	margin-top: 100px;
	text-align: left;
	width: 800x;
	border-spacing: 0 10px;
}

#singup p {
	margin: 0px;
}

caption {
	font-size: 30px;
	margin-bottom: 50px;
}

#outer {
	display: flex;
	justify-content: center;
}

input{
   text-align:center;
}
</style>


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
		
		if($('input[name="mail"]').val() == ""){
			alert("이메일을 입력하세요");		
			$('input[name="mail"]').focus();
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
		
		var tempPw = $('input[name="pw"]').val();
		if(tempPw.search(reg) == -1){
			alert("비밀번호는 3~10자의 영문, 숫자만 가능합니다");
			return;
		} 
		
		var reg2 = /^[가-힣]*$/;
		
		var tempName = $('input[name="pname"]').val();
		if(tempName.search(reg2) == -1){
			alert("이름은 한글 입력만 가능합니다.");
			return;
		}
		
	
		
		document.f.submit();
	}
	
/* 	function mail_change(){
		if(document.join.mail3.options[document.join.mail3.selectedIndex].value == '0'){
			document.join.mail2.disabled = true;
			document.join.mail2.value = "";
			}

		if(document.join.mail3.options[document.join.mail3.selectedIndex].value == '9'){
			 document.join.mail2.disabled = false;
			 document.join.mail2.value = "";
			 document.join.mail2.focus();

		} else{

		 document.join.mail2.disabled = true;
		 document.join.mail2.value = document.join.mail3.options[document.join.mail3.selectedIndex].value;

		}
	} */
	
	 function addHypen(obj) {
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";

	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
</script>

 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<form name=f action="SignUpReg" class="formW" method="post">
<div id="outer">
	<table class="singup" >
		<caption>
			나홀로이사 회원가입
		</caption>
		
		<tr>
			<td><b>아이디</b></td>
			<td><input type="text" name="pid" style="width: 150px" maxlength="10" 
			placeholder="3~10자의 영문, 숫자"> 
			<input type="button" id="id_check" value="중복체크">
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
			<td><input type="text" name="pname" style="width: 150px" placeholder="한글 입력만 가능"></td>
		</tr>
		<tr>
			<td valign="top"><b>전화번호</b></td>
			<td><input type="text" name="number" placeholder="번호를 ' - ' 없이 입력" onKeyup = "addHypen(this);"
				style="width: 150px"></td>
		</tr>
		<tr>
			<td><b>이메일</b></td>
			<td><input type="text" name="mail" style="width: 150px"/> </td>
			</tr>
			
			<tr>
			<td colspan="8"><br> <input type="submit" value="회원가입"
				class="custom-btn" onClick="gotoRegisterProc()"></td>
		</tr>

	</table>
	</div>
</form>
	<!-- 	<form name="join">   
		<div id="outer">   
		<table>
		<tr>
			<td><b>이메일</b></td>
			<td><input type="text" name="mail" style="width: 100px"/> @ </td>
			<td><input type="text" name="mail2" value="" disabled style="width: 100px"></td>
			<td><select name="mail3" onchange="mail_change()">
			   	<option value="0" >선택하세요</option>
			   	<option value="9">직접입력</option>
    			<option value="naver.com">naver.com</option>
   				<option value="nate.com">nate.com</option>    
   				</select>
			</td>
		</tr>

		<tr>
			<td colspan="8"><br> <input type="submit" value="회원가입"
				class="custom-btn" onClick="gotoRegisterProc()"></td>
		</tr>
	</table>
	</div>
</form> -->