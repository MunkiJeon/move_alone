<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resource'/>/css/manager/matching.css">
<div class="managerWrap">
	<table border="" width="100%">
		<tr>
			<td colspan="16" align="center">

				<div id="SearchBox">
					예약번호: <input type="text" id="search_resnum" name="search_resnum"placeholder="예약번호">
					이름: <input type="text" id="search_title" name="search_name"placeholder="고객 혹은 기사"> 
					아이디: <input type="text"id="search_id" name="search_id" placeholder="고객 혹은 기사">
					이사날짜: <input type="date" id="search_date" name="search_date"
						placeholder="입사일">
				</div>
				<button id="searchBtn">검색</button>
				<button id="addBtn">추가</button>
				<button id="editBtn">수정</button>
				<button id="deleteBtn">삭제</button>
			</td>
		</tr>
		<tr>
			<td colspan="16" align="center" style="font-size: 30px;"
				bgcolor="lime">현재 매칭중</td>
		</tr>
		<tr align="center">
			<td><input type="checkbox" id="allCheck"></td>
			<td>예약번호</td>
			<td>고객이름</td>
			<td>고객아이디</td>
			<td>기사이름</td>
			<td>기사아이디</td>
			<td>이사 날짜</td>
			<td>출발지</td>
			<td>출발지 옵션</td>
			<td>도착지</td>
			<td>도착지 옵션</td>
			<td>짐목록</td>
			<td>요청 박스 갯수</td>
			<td>요구사항</td>
			<td>상태</td>
			<td>작성날자</td>
		</tr>
<c:forEach items="${mainData }" var="dto" varStatus="no">
	<c:if test="${dto.req_state==0}">
        <tr align="center"> <!-- 모양  -->
            <td><input type="checkbox" id="allCheck"></td>
            <td>${dto.res_num }</td>
            <td>${dto.user_ID }</td>
            <td>${dto.user_ID }</td>
            <td>${dto.driver_ID }</td>
            <td>${dto.driver_ID }</td>
            <td>${dto.reservat_date }</td>
            <td>${dto.start_point }</td>
            <td>${dto.start_op }</td>
            <td>${dto.end_point }</td>
            <td>${dto.end_op }</td>
            <td>${dto.luggage_list }</td>
            <td>${dto.box }</td>
            <td>${dto.req_state }</td>
            <td><a href="">보기</a></td>
        </tr>
      </c:if>
</c:forEach> 
		<tr>
			<td colspan="16" align="center" style="font-size: 30px;"
				bgcolor="blue">현재 매칭완료</td>
		</tr>
		<tr align="center">
			<td><input type="checkbox" id="allCheck"></td>
			<td>예약번호</td>
			<td>고객이름</td>
			<td>고객아이디</td>
			<td>기사이름</td>
			<td>기사아이디</td>
			<td>이사 날짜</td>
			<td>출발지</td>
			<td>출발지 옵션</td>
			<td>도착지</td>
			<td>도착지 옵션</td>
			<td>짐목록</td>
			<td>요청 박스 갯수</td>
			<td>요구사항</td>
			<td>상태</td>
			<td>작성날자</td>
		</tr>
<c:forEach items="${mainData }" var="dto" varStatus="no">
	<c:if test="${dto.req_state==1}">
        <tr align="center"> <!-- 모양  -->
            <td><input type="checkbox" id="allCheck"></td>
            <td>${dto.res_num }</td>
            <td>${dto.user_ID }</td>
            <td>${dto.user_ID }</td>
            <td>${dto.driver_ID }</td>
            <td>${dto.driver_ID }</td>
            <td>${dto.reservat_date }</td>
            <td>${dto.start_point }</td>
            <td>${dto.start_op }</td>
            <td>${dto.end_point }</td>
            <td>${dto.end_op }</td>
            <td>${dto.luggage_list }</td>
            <td>${dto.box }</td>
            <td>${dto.req_state }</td>
            <td><a href="">보기</a></td>
        </tr>
      </c:if>
</c:forEach> 
	</table>
</div>