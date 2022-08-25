<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
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

.custom-btn_2 {
	color: #fff;
	line-height: 32px;
	padding: 0;
	border: none;
	font-size: 15px;
	cursor: pointer;
	background-color: #40699A;
	width: 50%;
	height: 30px;
}

.maintxt {
	font-size: 30px;
}

#loginform {
	margin-top: 150px;
}

#loginTable {
	width: 270px;
	height: 120px;
	text-align: center;
	border-spacing: 0 10px;
}

input, select {
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
	</script>
	
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('ca6ca84b0af293faaba25728ed29e816');

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
        
        window.Kakao.init('ca6ca84b0af293faaba25728ed29e816');
    	function kakaoLogout() {
        	if (!Kakao.Auth.getAccessToken()) {
    		    console.log('Not logged in.');
    		    return;
    	    }
    	    Kakao.Auth.logout(function(response) {
        		alert(response +' logout');
    		    window.location.href='/'
    	    });
    };

    </script>


<form action="LoginReg" id="loginform" name="myform" class="formW"
	method="post" onsubmit="return checkForm();">
	<div id="outer">
		<table align="center" id="loginTable">
			<tr>
				<td colspan="2" class="maintxt">나홀로이사 로그인</td>
			</tr>
			<tr>
				<td align="left" width="30%"><b>아이디</b></td>
				<td><input type="text" name="id" value="" style="width: 100%"></td>
			</tr>
			<tr>
				<td align="left"><b>비밀번호</b></td>
				<td><input type="password" name="pw" value=""
					style="width: 100%"></td>
			</tr>

			<tr>
				<td align="center" colspan="2"><input type="submit" value="로그인"
					class="custom-btn"></td>
			</tr>
			<tr>
				<td class="button-login" align="center">
				<a href="javascript:kakaoLogin();">
				 <img src="<c:url value="/resource/image/"/>kakao_login.png" alt="카카오계정 로그인">
				</a>
				
				</td>
			</tr>

			<tr>
				<td><a href="<c:url value='/login/FindId'/>">ID 찾기</a></td>
				<td><a href="<c:url value='/login/FindPw'/>">PW 찾기</a></td>
			</tr>







		</table>

	</div>
</form>