<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<section class="calc">
    <h2 class="calcTitle">용달 비용 계산하기</h2>
    <form>
    
    <div class="calcList">
            <ul class="calcItem">
                <li class="address">
                    <h3>출/도착지를 입력해 주세요.</h3>
                    <input type="text" placeholder="여기를 눌러서 출발지 주소 검색">
                    <input type="text" placeholder="여기를 눌러서 도착지 주소 검색">
                </li>
                <li class="time">
                    <h3>픽업시간을 선택해 주세요.</h3>
                    <div class="timeWrap">
                        <input type="radio" id="time1" name="time">
                        <label for="time1">
                            08:00 ~ 17:30 주간
                        </label>
                        <input type="radio" id="time2" name="time">
                        <label for="time2">
                            18:00 ~ 07:30 야간
                        </label>
                    </div>
                </li>
                <li class="time">
                    <h3>이사</h3>
                    <div class="timeWrap">
                        <input type="radio" id="time1" name="time">
                        <label for="time1">
                            08:00 ~ 17:30 주간
                        </label>
                        <input type="radio" id="time2" name="time">
                        <label for="time2">
                            18:00 ~ 07:30 야간
                        </label>
                        <input type="radio" id="time2" name="time">
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
                    <label for="option3">
                        <input type="radio" id="option3" name="option">
                        기사님이 짐을 같이 옮겨줌
                    </label>
                    <label for="option4">
                        <input type="radio" id="option4" name="option">
                        기사님 도움 + 인부 1명 추가
                    </label>
                </li>
            </ul>
            <div>
                <div class="calcBtn">
                    <h3 class="btnTitle">비용 계산 결과</h3>
                    <button type="reset" class="reset">초기화</button>
                    <ul>
                        <li>
                            <p>이동거리</p>
                            <p>-</p>
                        </li>
                        <li>
                            <p>운송 시간</p>
                            <p>-</p>
                        </li>
                        <li>
                            <p>운송 옵션</p>
                            <p>-</p>
                        </li>
                    </ul>
                    <div class="resultchk">
                        <p>나홀로 이사 용달비용</p>
                        <p>-</p>
                    </div>
                    <a class="resultBtn" href="Estimate">나홀로 이사 첫 운송 할인받기</a>
                </div>
            </div>
        </div>
    </form>
</section>
