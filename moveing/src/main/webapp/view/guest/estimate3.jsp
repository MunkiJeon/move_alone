<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<script src="<c:url value='/resource/js/estimate.js'/>"></script>
    <section class="gim_detail">
        <section class="calc">
            <form action="Estimate?num=4" method="post">
            <div class="calcList">
                    <ul class="calcItem">
                    <li><h2> 가구 세부사항 </h2></li>
                                        
                    	<li class="item_ops">
                    	<div class="line" align="center"><h3>가구</h3></div>
<c:forEach items="${item1Arr }" var="itemOP1" varStatus="no">
	<c:if test="${itemOP1==0 }">
						<div class="item_ops1">
	<c:forEach begin="1" end="${itemOP1 }">
						<input type="hidden" class="item1" value="X">
	</c:forEach>
						</div>
	</c:if>
	<c:if test="${itemOP1>=1 }">
						<h4>${itemName[0][no.index ]} : ${itemOP1 }개</h4>
						<div class="item_ops1">
	<c:forEach begin="1" end="${itemOP1 }">
						<input type="text" class="item1" placeholder="작성 예시 가구: 가로x세로x높이 ">
	</c:forEach>
						</div>	
	</c:if>					 
</c:forEach>
						</li>
						
						<li class="item_ops">
						<div class="line" align="center"><h3>가전</h3></div>
<c:forEach items="${item2Arr }" var="itemOP2" varStatus="no">

	<c:if test="${itemOP2==0 }">
						<div class="item_ops2">
	<c:forEach begin="1" end="${itemOP2 }">
						<input type="hidden" class="item2" value="X">
	</c:forEach>
						</div>
	</c:if>
	<c:if test="${itemOP2>=1 }">
						<h4>${itemName[1][no.index ]} : ${itemOP2 }개</h4>
						<div class="item_ops2">
	<c:forEach begin="1" end="${itemOP2 }">
						<input type="text" class="item2" placeholder="작성 예시 가구: 가로x세로x높이 ">
	</c:forEach>
						</div>	
	</c:if>						 
</c:forEach>
						</li>
						
						<li class="item_ops">
						<div class="line" align="center"><h3>기타</h3></div>
<c:forEach items="${item3Arr }" var="itemOP3" varStatus="no">

	<c:if test="${itemOP3==0 }">
						<div class="item_ops3" >
	<c:forEach begin="1" end="${itemOP3 }">
						<input type="hidden" class="item3"  value="X">
	</c:forEach>
						</div>
	</c:if>
	<c:if test="${itemOP3>=1 }">
						<h4>${itemName[2][no.index ]} : ${itemOP3 }개</h4>
						<div class="item_ops3">
	<c:forEach begin="1" end="${itemOP3 }">
						<input type="text" class="item3" placeholder="작성 예시 가구: 가로x세로x높이 ">
	</c:forEach>
						</div>	
	</c:if>					 
</c:forEach>
						</li>
						<li class="item_ops item_opsReq">
						<div class="line" align="center"><h3>요구사항</h3></div>

							<input type="text"  style="height: 300px" class="req" name="req" placeholder="작성 예시 : 가구가 비싼거라 조심히 옮겨 주세요.">
						</li>
                        <li>
	                        <input type="hidden" name="item1" id="item1">
					        <input type="hidden" name="item2" id="item2">
					        <input type="hidden" name="item3" id="item3">
                            <button type="submit" class="detailNext">다음</button>
                            <button type="button" class="test">테스트</button>
                        </li>
                    </ul>
                </div>
            </form>
            
        </section>
    </section>