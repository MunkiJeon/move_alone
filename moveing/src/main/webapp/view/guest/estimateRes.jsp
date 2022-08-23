<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<script src="<c:url value='/resource/js/estimate.js'/>"></script>
<style>
.managerWrap{padding:100px;}
.estimateResTable{margin:0 auto;}
.estimateResTable td{padding:10px;}
.estimateResTable .tr1{background: #eee;}
.estimateResTable td:nth-last-child(1){width:400px;}
.estimateResTable td:nth-last-child(2){width:150px;background: #eee;}
.managerWrap .resBtn {display:block;width:100px;height:60px;border-radius: 10px;margin:20px auto; }
tr, td {
	border: 1px #979797 solid;
}
.btn1detaile{position: fixed;z-index:2;bottom: -100vh;left: 50%;transform:translate(-50%,50%) ;width: 600px;background: white;padding: 30px;border-radius: 15px;}
.popupbg{position: fixed;background-color: rgba(0,0, 0, 0.3);width: 100%;height: 100%;display: none;top:0;left:0;}
</style>
<div class="managerWrap">
	<table class="estimateResTable" border="" >
		<tr class="tr1">
			<td colspan="2" align="center">
				<h1>${id } 님 견적을 보냈습니다.</h1>
			</td>
		</tr>
		
		<tr align="center">
		
			<td>예약번호</td>
            <td>${dto.res_num }</td>
		</tr>
		<tr align="center">
			<td>아이디</td>
			<td>${dto.id }</td>
		</tr>
		<tr align="center">	
			<td>이름</td>
			<td>${dto.name }</td>
		</tr>
		<tr align="center">
			<td>배송 종류</td>
			<td>${dto.SV_Type }</td>
		</tr>
		<tr align="center">
			<td>배송 날짜</td>
			<td>${dto.sel_date }</td>
		</tr>
		<tr align="center">
			<td>출발지 주소</td>
			<td>${dto.start_Point }</td>
		</tr>
		<tr align="center">
			<td>출발지 옵션</td>
			<td>${dto.start_OP }</td>
		</tr>
		<tr align="center">
			<td>도착지 주소</td>
			<td>${dto.end_Point }</td>
		</tr>
		<tr align="center">
			<td>도착지 옵션</td>
			<td>${dto.end_OP }</td>
		</tr>
		<tr align="center">
			<!-- <td>짐목록</td> -->
			<td>쇼핑리스트</td>
			<td>${dto.shopping_list }</td>
		</tr>
		<tr align="center">
			<td>요청사항</td>
			<td>${dto.request }</td>
		</tr>
		<tr align="center">
			<td>예약날짜</td>
			<td>${dto.req_date }</td>
		</tr>
		<tr align="center">
			<td>총가격</td>
			<td>${dto.price }</td>
		</tr>
	</table>
	<button class="resBtn" onclick="req()">결제하기</button>
</div>
<p class="btn1detaile"></p>
<div class="popupbg"></div>
<script>
function req(){
	IMP.init('imp77431016'); // iamport 대신 자신의 "가맹점 식별코드"를 사용하시면 됩니다
	IMP.request_pay({
	    pg : 'kakaopay', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),//TC0ONETIME
	    name : '주문명:결제테스트',
	    amount : ${dto.price }, //판매 가격
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}


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