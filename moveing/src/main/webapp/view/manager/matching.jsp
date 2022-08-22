<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resource'/>/css/manager/matching.css">
<style>
tr, td {
	border: 1px #979797 solid;
}
.stepsign{position: fixed;z-index:2;bottom: -100vh;left: 50%;transform:translate(-50%,50%) ;width: 600px;background: white;padding: 30px;border-radius: 15px;}
.popupbg{position: fixed;background-color: rgba(0,0, 0, 0.3);width: 100%;height: 100%;display: none;top:0;left:0;}
.btn1detaile{position: fixed;z-index:2;bottom: -100vh;left: 50%;transform:translate(-50%,50%) ;background: white;padding: 30px;border-radius: 15px;}
</style>

<form action="/moveing/manager/Matching" id="form" name="form" method="post">
<div class="managerWrap">
	<table border="" width="100%">
		<tr>
			<td colspan="16" align="center">

				<div id="SearchBox">
					예약번호: <input type="text" id="search_resnum" name="search_resnum"placeholder="예약번호" maxlength="11" value="<c:out value="${param.search_resnum}"/>" >
					고객아이디: <input type="text" id="search_title" name="search_name"placeholder="아이디" value="<c:out value="${param.search_name}"/>"> 
					기사아이디: <input type="text"id="search_id" name="search_id" placeholder="아이디" value="<c:out value="${param.search_id}"/>">
					이사날짜: <input type="date" id="search_date" name="search_date" placeholder="이사날짜" value="<c:out value="${param.search_date}"/>">
				</div>
				<button id="searchBtn">검색</button>
				<button id="editBtn">수정</button>
			</td>
		</tr>
		<tr>
			<td colspan="16" align="center" style="font-size: 30px;"
				bgcolor="lime">현재 매칭중</td>
		</tr>
		<tr align="center">
			<td><input class="dataChk" type="checkbox" id="allCheck"></td>
			<td>예약번호</td>
			<td>고객아이디</td>
			<td>기사아이디</td>
			<td>이사 날짜</td>
			<td>출발지 주소</td>
			<td>출발지 옵션</td>
			<td>도착주소</td>
			<td>도착지 옵션</td>
			<td>짐목록</td>
			<td>쇼핑리스트</td>
			<td>요청사항</td>
			<td>예약날짜</td>
			<td>총가격</td>
		</tr>
<c:forEach items="${mainData }" var="dto" varStatus="no">
	<c:if test="${dto.req_state==0}">
        <tr align="center" class="idchktr" > <!-- 모양  -->
            <td><input type="checkbox" id="allCheck${no.index }" class="dataChk" value="${dto.res_num }"></td>
            <td>${dto.res_num }</td>
            <td>${dto.user_ID }</td>
            <td>${dto.driver_ID }</td>
            <td>${dto.reservat_date }</td>
            <td>${dto.start_point }</td>
            <td>${dto.start_op }</td>
            <td>${dto.end_point }</td>
            <td>${dto.end_op }</td>
            <td class="previewbtn1" data-value="${dto.luggage_list }">보기</td>
            <td class="previewbtn1" data-value="${dto.shopping_list }">보기</td>
            <td class="previewbtn1" data-value="${dto.requests }">보기</td>
            <td>${dto.req_date }</td>
            <td>${dto.cost }</td>
           <!--  <td><a href="">보기</a></td> -->
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
			<td>고객아이디</td>
			<td>기사아이디</td>
			<td>이사 날짜</td>
			<td>출발지 주소</td>
			<td>출발지 옵션</td>
			<td>도착주소</td>
			<td>도착지 옵션</td>
			<td>짐목록</td>
			<td>쇼핑리스트</td>
			<td>요청사항</td>
			<td>예약날짜</td>
			<td>총가격</td>
		</tr>
<c:forEach items="${mainData }" var="dto" varStatus="no">
	<c:if test="${dto.req_state==1}">
        <tr align="center"> <!-- 모양  -->
            <td><input type="checkbox" id="allCheck"></td>
            <td>${dto.res_num }</td>
            <td>${dto.user_ID }</td>
            <td>${dto.driver_ID }</td>
            <td>${dto.reservat_date }</td>
            <td>${dto.start_point }</td>
            <td>${dto.start_op }</td>
            <td>${dto.end_point }</td>
            <td>${dto.end_op }</td>
            <td>${dto.luggage_list }</td>
            <td>${dto.shopping_list }</td>
            <td>${dto.requests }</td>
            <td>${dto.req_date }</td>
            <td>${dto.cost }</td>
            <!-- <td><a href="">보기</a></td> -->
        </tr>
      </c:if>
</c:forEach> 
	</table>
</div>
<div class="popupbg"></div>
<div class="btn1detaile"></div>

<div class="stepsign">
 <table>
     <tr>
         <td>예약번호</td>
         <td><input type="text" id="res_num"/></td>
     </tr>
     <!-- <tr>
         <td>이사날짜</td>
         <td><input type="text" id="reservat_date"/></td>
     </tr> -->
     <tr>
         <td>출발지</td>
         <td><input type="text" id="start_point"/></td>
     </tr>
     <tr>
         <td>도착지</td>
         <td><input type="text" id="end_point"/></td>
     </tr>
     
     <tr>
         <td colspan="2"><button class="submitBtn" type="submit">등록</button></td>
     </tr>
 </table>
</div>
</form>

<script type="text/javascript">
$(function(){
	$(".previewbtn1").click(function(){
        let arr = $(this).attr("data-value").split(",");
        console.log(arr[0]);
        let str ="";
        for(let i=0;i<arr.length;i++){
        	str+=arr[i]+"<br/>"
        }
        $(".popupbg").fadeIn(500);
        $(".btn1detaile").stop().animate({bottom:"50%"},500)
		$(".btn1detaile").html(str)
	})
	$(".popupbg").click(function(){
            $(this).fadeOut(500);
            $(".btn1detaile").stop().animate({bottom:"-100vh"},500)
    })
})
</script>

<script>
	$(function(){
		$(".popupbg").click(function(){
            $(this).fadeOut(500);
            $(".stepsign").stop().animate({bottom:"-100vh"},500)
        })
        
        $("#editBtn").click(function(e){
            e.preventDefault();
            let cnt = 0;
            let resnum = "";
            for(let i=0;i<$(".idchktr").length;i++){
            	if($(".idchktr").eq(i).find(".dataChk").is(':checked')){
            		cnt++;
            		id = $(".idchktr").eq(i).find(".dataChk").val()
            	}
            }
            if(cnt!=1){
            	return alert("하나만 체크해 주세요");
            }
				
            console.log(id);
            $(".popupbg").fadeIn(500);
            $(".stepsign").stop().animate({bottom:"50%"},500)
            $("#res_num").attr("readonly","readonly");

			
            $.ajax({
         	
	         	url:"<c:url value='/ajax/MatchingModify'/>",
	         	type:'POST',
	 			data:{id:id},
	 			async:false,
	 			dataType:'json',
	 			success:function(data){
	 				
	 				$("#res_num").val(decodeURIComponent(data.res_num));
//	 				$("#reservat_date").val(decodeURIComponent(data.reservat_date));
	 				$("#start_point").val(decodeURIComponent(data.start_point));
	 				$("#end_point").val(decodeURIComponent(data.end_point));
	 				
	 			},
	 			error:function(e){console.log(e)}
	    	})  
	            
	        $(".submitBtn").click(function(e){
	        	console.log("sadasrga");
                e.preventDefault();
                $.ajax({
    	         	url:"<c:url value='/ajax/MatchingModifyReg'/>",
    	         	type:'POST',
    	 			data:{id:$("#res_num").val(),start_point:$("#start_point").val(),end_point:$("#end_point").val()},
    	 			async:false,
    	 			dataType:'json',
    	 			success:function(data){
		  				if(data.chk=="false"){alert("실패")}
		  				else{alert("성공");
		  					location.href="";
		  				}
    	 				
    	 			},
    	 			error:function(e){console.log(e)}
    	    	})  
	            	
	        })
        })

        <%-- 검색하기 --%>
        $("#searchBtn").click(function(e){
        	$('#form').submit();
        })
        

	})
</script>