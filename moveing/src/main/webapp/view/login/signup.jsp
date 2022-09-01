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

		
/* 		$('input[name="pid"]').keydown(function(){ //키보드가 한번이라도 눌리면 발생하는 이벤트 처리
			$('#id_message').css('display', 'none'); // 키가 눌렸을 때 안보이게.
			isChanged = true;
			ues=""; // 새로운 데이터의 입력이 들어오면 상태 초기화
		}); */
		
	});//ready
	
	function gotoRegisterProc(){
		var reg = /^[a-zA-Z0-9]{3,10}$/;
		var tempId = $('input[name="pid"]').val();
		var tempPw = $('input[name="pw"]').val();
		var tempName = $('input[name="pname"]').val();
		var reg2 = /^[가-힣]*$/;
		var tempTel = $('input[name="number"]').val();
		var regNum = /[^0-9]/;
		
		if($('input[name="pid"]').val() == ""){
			alert("아이디를 입력하세요");
			$('input[name="pid"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if($('input[name="pw"]').val() == ""){
			alert("비밀번호를 입력하세요");	
			$('input[name="pw"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if($('input[name="re_password"]').val() == ""){
			alert("비밀번호 확인을 입력하세요");	
			$('input[name="re_password"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if($('input[name="pw"]').val() != $('input[name="re_password"]').val()){
			alert("비밀번호가 일치하지 않습니다.");
			$('input[name="res"]').val("unsuitable");
		}else if($('input[name="pname"]').val() == ""){
			alert("이름을 입력하세요");		
			$('input[name="pname"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if($('input[name="number"]').val() == ""){
			alert("전화번호를 입력하세요");		
			$('input[name="number"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if(tempTel.search(regNum) == -1){//--------------------
			alert("숫자로만 입력하세요");		
			$('input[name="number"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if($('input[name="mail"]').val() == ""){
			alert("이메일을 입력하세요");		
			$('input[name="mail"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if(idUsable == ""){
			alert("아이디 중복체크를 수행해주세요");
			$('input[name="pid"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if(idUsable == "IMPOSSIBLE"){
			alert("아이디 중복여부를 확인하세요");
			$('input[name="pid"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if(tempId.search(reg) == -1){
			alert("아이디는 3~10자의 영문, 숫자만 가능합니다");
			$('input[name="pid"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if(tempPw.search(reg) == -1){
			alert("비밀번호는 3~10자의 영문, 숫자만 가능합니다");
			$('input[name="pw"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else if(tempName.search(reg2) == -1){
			alert("이름은 한글 입력만 가능합니다.");
			$('input[name="pname"]').focus();
			$('input[name="res"]').val("unsuitable");
		}else{
			$('input[name="res"]').val("Suitable");
		}
		console.log("회원가입 결과 :"+$('input[name="res"]').val());
		if($('input[name="res"]').val()=="Suitable"){//Suitable unsuitable	
			document.f.submit();
		}
	}
	var reg = /^[a-zA-Z0-9]{3,10}$/;
	
	function idCheck(obj) {
		
		var tempId = $('input[name="pid"]').val();
		if(tempId.search(reg) == -1){
			$("#id_message").html("<font color=red>아이디는 3~10자의 영문, 숫자만 가능합니다</font>");	
			$('#id_message').show(); 
		}else{
			$("#id_message").html("");
		}
	}
	
	function pwCheck(obj) {
		var tempPw = $('input[name="pw"]').val();
		if(tempPw.search(reg) == -1){
			$("#pw_CHmessage").html("<font color=red>비밀번호는 3~10자의 영문, 숫자만 가능합니다</font>");	
		}else{
			$("#pw_CHmessage").html("");
		}
	}

	function pwComparison(obj) {
		if($('input[name="pw"]').val()==obj.value){
			$("#pw_COmessage").html("<font color=green>비밀번호가 일치 합니다.</font>");	
		}else{
			$("#pw_COmessage").html("<font color=red>비밀번호가 같지 않습니다.</font>");	
		}
	}
	
	 function addHypen(obj) {
		 console.log(obj.value);
		 var tempTel = $('input[name="number"]').val();
		var regNum = /^[0-9]/;
		 console.log("---->"+tempTel.search(regNum))
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";
	    
	    if(tempTel.search(regNum)==-1){
	    	$("#tel_message").html("<font color=red>숫자만 입력해주세요</font>");
	    }else{
	    	$("#tel_message").html("");
	    }

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
			<td><input type="text" name="pid" style="width: 150px" maxlength="10"  onKeyup = "idCheck(this);" placeholder="3~10자의 영문, 숫자"> 
			<input type="button" id="id_check" value="중복체크">
			</td>
		</tr>
		<tr><td colspan="3" align="center"><span id="id_message" style="font-size: 10px"></span></td></tr>
		
		<tr>
			<td><b>비밀번호</b></td>
			<td><input type="password" name="pw" maxlength="10" onKeyup = "pwCheck(this);" style="width: 150px" placeholder="3~10자의 영문, 숫자"></td>
		</tr>
		<tr><td colspan="3" align="center"><span id="pw_CHmessage" style="font-size: 10px"></span></td></tr>
	 	<tr>
			<td><b>비밀번호 확인</b></td>
			<td><input type="password" name="re_password" maxlength="10" onKeyup = "pwComparison(this);" style="width: 150px"></td>
		</tr>
		<tr><td colspan="3" align="center"><span id="pw_COmessage" style="font-size: 10px"></span></td></tr>
		<tr>
			<td><b>성명</b></td>
			<td><input type="text" name="pname" style="width: 150px" placeholder="한글 입력만 가능" ></td>
		</tr>
		<tr>
			<td><b>전화번호</b></td>
			<td><input type="text" name="number" placeholder="번호를 ' - ' 없이 입력" onKeyup = "addHypen(this);" style="width: 150px"></td>
		</tr>
		<tr><td colspan="3" align="center"><span id="tel_message" style="font-size: 10px"></span></td></tr>
		<tr>
			<td><b>이메일</b></td>
			<td><input type="text" name="mail" style="width: 150px"/></td>
		</tr>
			
		<tr>
			<td><input type="hidden" name="res" value="unsuitable"></td>
			<td colspan="8"><br><input type="button" class="custom-btn" value="회원가입" onClick="gotoRegisterProc()"/></td>
		</tr>

	</table>
	</div>
</form>