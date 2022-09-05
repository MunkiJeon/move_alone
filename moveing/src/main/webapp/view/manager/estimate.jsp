<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resource'/>/css/manager/matching.css">
<style>
tr, td {
	border: 1px #979797 solid;
}
.btn1detaile{position: fixed;z-index:2;bottom: -100vh;left: 50%;transform:translate(-50%,50%) ;width: 600px;background: white;padding: 30px;border-radius: 15px;}
.popupbg{position: fixed;background-color: rgba(0,0, 0, 0.3);width: 100%;height: 100%;display: none;top:0;left:0;}
</style>
<div class="managerWrap">
	<table border="" width="100%">
		<tr>
			<td colspan="16" align="center">

				<div id="SearchBox">
					예약번호: <input type="text" id="search_resnum" name="search_resnum"placeholder="예약번호">
					이름: <input type="text" id="search_title" name="search_name"placeholder="고객 이름"> 
					아이디: <input type="text"id="search_id" name="search_id" placeholder="고객 아이디">
					이사날짜: <input type="date" id="search_date" name="search_date" placeholder="이사날짜">
				</div>
				<button id="searchBtn">검색</button>
			</td>
		</tr>
		
		<tr align="center">
			<td><input type="checkbox" id="allCheck"></td>
			<td>예약<br>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>배송<br>종류</td>
			<td>예약<br>날짜</td>
			<td>출발지<br>주소</td>
			<td>출발지<br>옵션</td>
			<td>도착지<br>주소</td>
			<td>도착지<br>옵션</td>
			<!-- <td>가구 목록</td>
			<td>가전 목록</td>-->
			<!-- <td>기타 목록</td> --> 
		
			<td>요청<br>사항</td>
			<td>예약<br>날짜</td>
			<td>총가격</td>
			<td>진행<br>상태</td>
		</tr>
<c:forEach items="${mainData }" var="dto" varStatus="no">
	<c:if test="${dto.state!=9}"><!-- 임시로 전체 나오게 하려고 9 넣음 -->
        <tr align="center"> <!-- 모양  -->
            <td><input type="checkbox" id="allCheck"></td>
            <td>${dto.res_num }</td>
            <td>${dto.id }</td>
            <td>${dto.name }</td>
            <td>${dto.SV_Type }</td>
            <td>${dto.sel_date }</td>
            <td>${dto.start_Point }</td>
            <td>${dto.start_OP }</td>
            <td>${dto.end_Point }</td>
            <td>${dto.end_OP }</td>

	   <%--     	<td class="previewbtn1" data-value="${dto.Furniture_Det }">보기</td>
            <td class="previewbtn1" data-value="${dto.Home_App_Det }">보기</td>  --%>
            <%-- <td class="previewbtn1" data-value="${dto.Other_Det }">보기</td> --%>
           	<td class="previewbtn1" data-value="${dto.request }">보기</td>
           	
            <td>${dto.req_date }</td>
            <td>${dto.price }</td> 
            <td>${dto.state }</td>     
        </tr>
      </c:if>
</c:forEach>
		
	</table>
</div>
<p class="btn1detaile"></p>
<div class="popupbg"></div>
<script>
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