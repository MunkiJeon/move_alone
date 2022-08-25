<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.map.model.UserDTO"%>
<%@ page import="com.map.model.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("member_name");
	String tel = request.getParameter("member_phone");
	
	UserDAO dao = new UserDAO();
	String id = dao.findId(name, tel);
%>
<style>
.container {
	margin-top: 150px;
	margin-left: 50px;
	margin-bottom: 50px;
}
</style>
<form name="idsearch" method="post">
	<%
		if (id != null) {
	%>

	<div class="container">
		<div class="found-success">
			<h4>회원님의 아이디는</h4>
			<div class="found-id">
				<%=id%></div>
			<h4>입니다</h4>
		</div>
		<div class="found-login">
			<input type="button" id="btnLogin" value="로그인"
				onclick="location='/moveing/login/Login'" />
		</div>
	</div>
	<%
	} else {
	%>
	<div class="container">
		<div class="found-fail">
			<h4>등록된 정보가 없습니다</h4>
		</div>
		<div class="found-login">
			<input type="button" id="btnback" value="다시 찾기"
				onClick="history.back()" /> <input type="button" id="btnjoin"
				value="회원가입" onclick="location='/moveing/login/Signup'" />
		</div>
	</div>

	<div class="adcontainer"></div>
	<%
	}
	%>
</form>
