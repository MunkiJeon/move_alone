<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resource/js/jquery-3.6.0.js'/>"></script>

<!--   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=geocoder"></script>
<script>

naver.maps.Service.geocode({ address: '불정로 6' }, function(status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
        return alert('Something wrong!');
    }

    // 성공 시의 response 처리
});;
</script>
</head>
<body>
  <button style="width:100px;height:100px;position:fixed;top:200px;left:300px" onclick="req()">결제하기</button>
<jsp:include page="inc/${config }/top.jsp"/>
<jsp:include page="${mainUrl }"/>
<c:if test="${config!='manager'&&id!=null }">
<jsp:include page="inc/chatbot.jsp"/>
</c:if>
<c:if test="${config=='guest' }">
<jsp:include page="inc/${config }/bottom.jsp"/>
</c:if>
<script type="text/javascript">
function req(){
IMP.init('imp77431016'); // iamport 대신 자신의 "가맹점 식별코드"를 사용하시면 됩니다
IMP.request_pay({
    pg : 'kakaopay', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),//TC0ONETIME
    name : '주문명:결제테스트',
    amount : 100, //판매 가격
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


</script>
</body>
</html>