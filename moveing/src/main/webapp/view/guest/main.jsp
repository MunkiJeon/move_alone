<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="<c:url value='/resource/css/guest/main.css'/>">

<section class="mainSection">
    <article>
        <p>언제 어디서든</p>
        <h2>이사할 때,나홀로 이사!</h2>
        <a class="calclink" href="<c:url value="/guest/CostCalc"/>">모의 견적</a>
    </article>
</section>
<section class="mainCnt">
    현재까지의 나홀로 이사는
    <article>
        <p>이사 요청 수</p>
        <p><span>1, 619, 737</span>건</p>
    </article>
    <article>
        <p>제공 견적 수</p>
        <p><span>6, 965, 393</span>건</p>
    </article>
    <article>
        <p>고객 리뷰 수</p>
        <p><span>133, 952</span>건</p>
    </article>
</section>
<section class="mainProcess">
    <h2>이사비용 비교부터 이사까지 한번에</h2>
    <ul>
        <li>
            <figure>
            	
                <img src="<c:url value="/resource/image/"/>icon1.png" alt="">
            </figure>
            <p>짐 정보 선택</p>
        </li>
        <li>
            <figure>
                <img src="<c:url value="/resource/image/"/>icon2.png" alt="">
            </figure>
            <p>이사 지역/날짜 입력</p>
        </li>
        <li>
            <figure>
                <img src="<c:url value="/resource/image/"/>icon3.png" alt="">
            </figure>
            <p>파트너 견적/리뷰확인</p>
        </li>
        <li>
            <figure>
                <img src="<c:url value="/resource/image/"/>icon4.png" alt="">
            </figure>
            <p>이사 확정</p>
        </li>
    </ul>
</section>
