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
					이름: <input type="text" id="search_title" name="search_name"placeholder="고객 혹은 기사"> 
					아이디: <input type="text"id="search_id" name="search_id" placeholder="고객 혹은 기사">
					이사날짜: <input type="date" id="search_date" name="search_date"
						placeholder="입사일">
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
	<c:if test="${dto.req_state==0}">
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

<div class="stepsign">
    <form>
	    <table>
	        <tr>
	            <td>아이디</td>
	            <td><input type="text" id="id"/></td>
	        </tr>
	        <tr>
	            <td>비번</td>
	            <td><input type="text" id="pw"/></td>
	        </tr>
	        <tr>
	            <td>전화번호</td>
	            <td><input type="text" id="tel"/></td>
	        </tr>
	        <tr>
	            <td>이름</td>
	            <td><input type="text" id="name"/></td>
	        </tr>
	        <tr>
	            <td>이메일</td>
	            <td><input type="text" id="email"/></td>
	        </tr>
	        
	        <tr>
	            <td colspan="2"><button type="submit">등록</button></td>
	        </tr>
	    </table>
    </form>
</div>

<script>
	$(function(){
        
        $(".popupbtnModify").click(function(e){
            e.preventDefault();
            let cnt = 0;
            let id = "";
            for(let i=0;i<$(".idchktr").length;i++){
            	if($(".idchktr").eq(i).find(".dataChk").is(':checked')){
            		cnt++;
            		id = $(".idchktr").eq(i).find(".dataChk").val()
            	}
            }
            if(cnt!=1){
            	return alert("하나만 체크해 주세요");
            }
            
            modify = true;
            console.log(id);
            $(".popupbg").fadeIn(500);
            $(".stepsign").stop().animate({bottom:"50%"},500)
            $("#id").attr("readonly","readonly");

			
            $.ajax({
         	
	         	url:"<c:url value='/ajax/Modify'/>",
	         	type:'POST',
	 			data:{id:id},
	 			async:false,
	 			dataType:'json',
	 			success:function(data){
	 				
	 				$("#id").val(decodeURIComponent(data.id));
	 				$("#pw").val(decodeURIComponent(data.pw));
	 				$("#name").val(decodeURIComponent(data.name));
	 				$("#email").val(decodeURIComponent(data.email));
	 				$("#tel").val(decodeURIComponent(data.tel));
	 				
	 			},
	 			error:function(e){console.log(e)}
	    	})  
	            
	        $(".deletebtn").submit(function(e){
	        	
                e.preventDefault();
                console.log(id+","+$("#pw").val()+","+$("#name").val()+","+$("#email").val()+","+$("#tel").val())
                $.ajax({
    	         	url:"<c:url value='/ajax/ModifyReg'/>",
    	         	type:'POST',
    	 			data:{id:id,pw:$("#pw").val(),name:$("#name").val(),email:$("#email").val(),tel:$("#tel").val(),level:level},
    	 			async:false,
    	 			dataType:'json',
    	 			success:function(data){
		  				console.log(data.chk);
		  				if(data[0]=="false"){alert("실패")}
		  				else{alert("성공");
		  					location.href="?level="+level;
		  				}
    	 				
    	 			},
    	 			error:function(e){console.log(e)}
    	    	})  
	            	
	        })
        })
        

	})
</script>