<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.chk li{
margin: 0px auto;
font-size: 20px;
text-align: center;
}
.result .line {background: black;width: 80%; height: 2px;}
.result .tr1{background: #eee;}
.result .title{width:100px;background: #eee; colspan="2";}
.result td{width:150px;}
/* .result td:nth-last-child(1){width:300px;colspan="2";}
.result td:nth-last-child(2){width:150px;background: #eee;} */
</style>
<link rel="stylesheet" href="<c:url value='/resource'/>/css/manager/calculate.css">
<div class="managerWrap">
	<div><h2>매출 조회</h2></div>
    <div class="inquire">
    		<h3>조회하기</h3>
    		<ul class="chk">
    		<li><p style="font-size: 25px">정산 금액:</p></li>
    		<li><p class="rs"> <span>${res }</span>원</p></li>
    		</ul>
            
            <ul class="chk">
                <li class="chkItem">
                    정산 기간
                </li>
                <li class="chkItem">
                    <input type="date" name="start" id="start">
                </li>
                <li class="chkItem">
                    <input type="date" name="end" id="end">
                </li>    
            </ul>
            <div class="btnBox">
                <button class="submit">검색</button>
            </div>
    </div>
    <div class="result"><!-- 작업해야됨  -->
        <table>
        <c:forEach items="${salelist }" var="dto" >
        <tr><td colspan="8" class="line"></td></tr>
            <tr>
            	<td class="title">예약<br>날짜</td>	<td>${dto.req_date }</td>
            	<td class="title">예약<br>번호</td>	<td>${dto.res_num }</td>
            	<td class="title">주문자<br>아이디</td>	<td>${dto.id }</td>
            </tr>
            <tr>
            	<td class="title">종류</td>			<td>${dto.SV_Type }</td>
            	<td class="title">가격</td>			<td>${dto.SV_price }원</td>
            	<td class="title">이사<br>날짜</td>	<td>${dto.sel_date }</td>
            </tr>
            <tr>
            	<td class="title">출발지</td>			<td>${dto.start_Point }</td>
                <td class="title">도착지</td>			<td>${dto.end_Point }</td>
                <td class="title">거리</td>			<td>${dto.km }</td>
            	<td class="title">가격</td>			<td>${dto.km_price }원</td>
           	</tr>
            <tr>
            	<td class="title">엘리베이터</td>		<td>${dto.elevator }</td>
            	<td class="title">가격</td>			<td>${dto.elevator_price }원</td>
                <td class="title">주차장</td>			<td>${dto.parking }</td>
                <td class="title">가격</td>			<td>${dto.parking_price }원</td>
            </tr>
            <tr>
                <td class="title">짐목록</td>			<td>${dto.luggage_list }</td>
                <td class="title">가격</td>			<td>${dto.luggage_price }원</td>
            </tr>
            <tr>
                <td class="title">최종금액</td>		<td>${dto.price }원</td>
                <td class="title">생성<br>날짜</td>	<td>${dto.req_date }</td>
            </tr>
        </c:forEach>
        </table>
    </div>
</div>
<script>
	$(function(){
		$(".inquire .submit").click(function(){
            $.ajax({
            	
            	url:"<c:url value='/ajax/CalcDay'/>",
            	type:'POST',
    			data:{start:$("#start").val(),end:$("#end").val(),param:"${param.res}",type:type},
    			async:false,
    			dataType:'json',
    			success:function(data){
    				let str = `
    		            <tr>
                    <td>상품명</td>
                    <td>수량</td>
                    <td>단가</td>
                    <td>결산액</td>
                    <td>결제금액</td>
                </tr>`;
                let res = 0;
    				for (let i = 0; i < data.length; i++) {
    					str += "<tr>";
    					 
    					let rs = data[i].split(",");
    					for (let j = 0; j < rs.length; j++) {
    					
    	            	str+="<td>"+decodeURIComponent(rs[j])+"</td>"
    	            	if(j==3) res+= rs[j]*1
    					}
    	       			str+="</tr>"
					}
    				$(".managerWrap .result table").html(str);
    				$(".managerWrap .resultMoney .rs span").html(res);
    			},
    			error:function(e){console.log(e)}
            })
		})
	})
</script>