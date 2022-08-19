<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
    <section class="detail">
        <section class="calc">
            <form>
            <div class="calcList">
                    <ul class="calcItem">
                    	<li class="item_ops">
                    	<h3>가구</h3>
<c:forEach items="${item1Arr }" var="itemOP">
						<h4>가구+ ${itemOP }</h4>
						<div>
	<c:forEach begin="1" end="${itemOP }">
						<input type="text" class="item1" name="item1" placeholder="가로??">
	</c:forEach>
						</div>					
							
						
	 
</c:forEach>
						</li>
                        <li class="time">
                        
                        <p>${item1Arr }</p>
                        <p>${item2Arr }</p>
                        <p>${item3Arr }</p>
                            <h3>출발지 엘레베이터 유무</h3>
                            <div class="timeWrap">
                                <p>가로</p>
                                <input type="text" class="item1" name="item1" value="aaaaaaaaaaa">
                            </div>
                        </li>

                        <li>
                            <button type="submit" class="detailNext">다음</button>
                        </li>
                    </ul>
                </div>
            </form>
            
        </section>
    </section>