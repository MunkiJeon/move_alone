<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="935361390447-sdf1ni7i8qsp2g9j32dh4ivhr7if5qan.apps.googleusercontent.com">

<style type="text/css">
	
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
	
	.maintxt {
		font-size: 30px;	
	}
	
	
	#loginform {
		margin-top: 150px;		
	}
	
	#loginTable{
		width : 270px;
		height : 120px;
		text-align: center;
		border-spacing: 0 10px;
	}
	
	input, select  {
	border: 1px #979797 solid;
	height: 30px;
	margin: 5px;
}

#outer {
	display: flex;
	justify-content: center;
}




</style>

<script type="text/javascript">
	function checkForm(){
		
		if(document.myform.id.value == ""){
			alert("아이디를 입력하세요");
			return false;
		}
		
		if(document.myform.pw.value == ""){
			alert("비밀번호를 입력하세요");
			return false;
		}
	}
	
	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
	
	
</script>

<form action="LoginReg" id="loginform" name="myform" class="formW"  method="post" onsubmit="return checkForm();">
  <div id="outer">
  <table  align="center" id="loginTable">
    <tr>
			<td colspan="2" class="maintxt">나홀로이사 로그인
			</td>
		</tr>
		<tr>
			<td align="left" width="30%"><b>아이디</b></td>
			<td><input type="text" name="id" value="" style="width:100%"></td>
		</tr>
		<tr>
			<td align="left"><b>비밀번호</b></td>
			<td><input type="password" name="pw" value="" style="width:100%"></td>
		</tr>
		
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="로그인" class="custom-btn">		
			</td>
		</tr>
		
		<tr>
		 <td class="g-signin2" data-onsuccess="onSignIn"></td>
		</tr>
		
   </table>
  
   </div>
</form>