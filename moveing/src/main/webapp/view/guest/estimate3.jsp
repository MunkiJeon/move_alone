<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<link rel="stylesheet" href="<c:url value='/resource/css/diary.css'/>">
    <section class="detail">
        <!-- 날짜선택
        시간선택
        출발 도착
        서비스 종류(이사종류) -->
        <section class="calc">
            <form>
            <div class="calcList">
                    <ul class="calcItem">
                        <li class="time">
                            <h3>출발지 엘레베이터 유무</h3>
                            <div class="timeWrap">
                                <input type="radio" id="elevator1" name="time">
                                <label for="elevator1">
                                    있음
                                </label>
                                <input type="radio" id="elevator2" name="time">
                                <label for="elevator2">
                                    없음
                                </label>
                            </div>
                        </li>
                        <li class="time">
                            <h3>도착지 엘레베이터 유무</h3>
                            <div class="timeWrap">
                                <input type="radio" id="elevator3" name="time">
                                <label for="time1">
                                    08:00 ~ 17:30 주간
                                </label>
                                <input type="radio" id="elevator4" name="time">
                                <label for="time2">
                                    18:00 ~ 07:30 야간
                                </label>
                            </div>
                        </li>
                        
                        <li class="option">
                            <h3>운송옵션을 알려주세요.</h3>
                            <label for="option1">
                                <input type="radio" id="option1" name="option">
                                일반이사
                            </label>
                            <label for="option2">
                                <input type="radio" id="option2" name="option">
                                포장이사
                            </label>
                        </li>
                        <li class="option">
                            <h3>엘리베이터 유무</h3>
                            <label for="option1">
                                <input type="radio" id="option1" name="option">
                                있음
                            </label>
                            <label for="option2">
                                <input type="radio" id="option2" name="option">
                                없음
                            </label>
                            <button type="submit" class="detailNext">다음</button>
                        </li>
                    </ul>
                </div>
            </form>
            
        </section>
    </section>