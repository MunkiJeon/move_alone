<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<link rel="stylesheet" href="<c:url value='/resource/css/diary.css'/>">
    <section class="detail">
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

                        <li>
                            <button type="submit" class="detailNext">다음</button>
                        </li>
                    </ul>
                </div>
            </form>
            
        </section>
    </section>