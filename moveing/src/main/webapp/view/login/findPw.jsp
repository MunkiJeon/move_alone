<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
</style>
<script type="text/javascript">
	function pw_search() {
		var frm = document.pwfindscreen;
		if (frm.member_mid.value.length < 3) {
			alert("아이디를 올바르게 입력해주세요");
			return false;
		}

		if (frm.member_phone.value.length != 13) {
			alert("핸드폰번호를 정확하게 입력해주세요");
			return false;
		}

		return true;
	}

	function addHypen(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
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
<style>
.findPw {
	margin-top: 150px;
	margin-left: 50px;
	margin-bottom: 50px;
}

section>div {
	margin-top: 5px;
}

section input {
	border: 1px solid;
	padding: 5px;
}
</style>
<form name="pwfindscreen" action="<c:url value='/login/FindPwResult'/>" method="post" onsubmit="pw_search();">
	<div class="findPw">
	<div class="search-title">
		<h3>등록한 정보로 인증</h3>
	</div>
	<section class="form-search">
		<div class="find-id">
			<label>아이디</label> <input type="text" name="member_mid"
				class="btn-name" placeholder="아이디를 입력해주세요"> <br>
		</div>

		<div class="find-phone">
			<label>번호</label> <input type="text" onKeyup="addHypen(this);"
				name="member_phone" class="btn-phone" placeholder="휴대폰번호를 '-'없이 입력">
		</div>
		<br>
	</section>
	<div class="btnSearch">
		<input type="submit" value="찾기"  /> 
		<input type="button" value="취소"
			onclick="history.back()" />
	</div>
	</div>
</form>