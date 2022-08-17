<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/top.css'/>">
 <header>
     <nav>
         <h1 class="logo"><a href="<c:url value="/guest/GuestMain"/>">나홀로 이사</a></h1>
         <ul class="list">
         	<li><a href="<c:url value="/guest/CostCalc"/>">비용계산기</a></li>
         </ul>
         <ul class="login">
         	 <c:choose>
         	 	<c:when test="${id!=null }">
		             <li><a href="<c:url value='/login/LogOut'/>">로그아웃</a></li>
		             <li><a href="<c:url value='/staff/StaffMyPage'/>">마이페이지</a></li>     
		                 	 		
         	 	</c:when>
         	 	<c:otherwise>
		             <li><a href="<c:url value='/login/Login'/>">로그인</a></li>
		             <li><a href="<c:url value='/login/SignUp'/>">회원가입</a></li>
         	 	</c:otherwise>
         	 </c:choose>
         </ul>
     </nav>
 </header>
 