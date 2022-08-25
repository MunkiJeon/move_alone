<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/estimate2.css'/>">
<script src="<c:url value='/resource/js/estimate.js'/>"></script>
<form action="Estimate?num=3" method="post">
	<!-- <input type="hidden" name="num" value="3"/> -->
        <div class="line" align="center" style="margin-top: 100px">
        <h2 class="productExplanation">짐 수량에 맞춰 아이콘을 터치해주세요</h2>
        </div>
  <!--  
    <section class="product">
      <div class="line"></div>
        <h2 class="productTitle">침실/거실가구</h2>
        <ul class="productItem productItem1">
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-1</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-2</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-3</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-4</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-5</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-6</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-7</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-8</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대1-9</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
        </ul>
    </section>
 --> 
<section class="product">
        <div class="line"></div>
		<h2 class="productTitle">침실/거실가구</h2>
		<ul class="productItem productItem1">
		<c:forEach items="${itemName[0]}" var="itemNo1" varStatus="no">
			<li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/item/'/>${itemImg[0][no.index] }" alt="">
                </figure>
                <p>${itemNo1 }</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item1">0</p>
                </div>
            </li>
		</c:forEach>
		</ul>
</section>
<section class="product">
        <div class="line"></div>
		<h2 class="productTitle">생활 가전 제품</h2>
		<ul class="productItem productItem2">
		<c:forEach items="${itemName[1]}" var="itemNo2" varStatus="no">
			<li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/item/'/>${itemImg[1][no.index] }" alt="">
                </figure>
                <p>${itemNo2 }</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
		</c:forEach>
		</ul>
</section>
<section class="product">
        <div class="line"></div>
		<h2 class="productTitle">기타 항목</h2>
		<ul class="productItem productItem3">
		<c:forEach items="${itemName[2]}" var="itemNo3" varStatus="no">
			<li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/item/'/>${itemImg[2][no.index] }" alt="">
                </figure>
                <p>${itemNo3 }</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
		</c:forEach>
		</ul>
</section>

    <section class="product">
<%--         <div class="line"></div>
        <h2 class="productTitle">생활 가전 제품</h2>
        <ul class="productItem productItem2">
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-1</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                	<img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-2</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-3</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-4</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-5</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-6</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-7</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-8</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대2-9</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item2">0</p>
                </div>
            </li>
        </ul>
    </section>

    <section class="product">
        <div class="line"></div>
        <h2 class="productTitle">기타 항목</h2>
        <ul class="productItem productItem3">
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-1</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-2</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-3</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-4</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-5</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-6</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-7</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-8</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
            <li class="productList">
                <figure class="productIcon">
                    <img src="<c:url value='/resource/image/'/>gg1.png" alt="">
                </figure>
                <p>침대3-9</p>
                <div class="productBtn">
                    <button class="productBtnM">-</button>
                    <p class="item3">0</p>
                </div>
            </li>
        </ul> --%>
        <div class="line"></div>
        <input type="hidden" name="item1" id="item1">
        <input type="hidden" name="item2" id="item2">
        <input type="hidden" name="item3" id="item3">
<!--         <input type="hidden" name="box"> -->
        
       	<button type="submit" class="detailNext">다음</button>
       	<!-- <button type="button" class="test">테스트</button> -->
    </section>
</form>
