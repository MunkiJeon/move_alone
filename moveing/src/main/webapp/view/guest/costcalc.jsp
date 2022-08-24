<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/resource/js/jquery-3.6.0.js'/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3a234f0ef19e6838b8b6e3fda011781&libraries=services"></script>
<script>
	var newJquery = $.noConflict(true); // 다른 라이브러리랑 겹칠때 이렇게 해주면 됨.
	function st_openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				/* newJquery('[name=st_zip]').val(data.zonecode); // 우편번호 (5자리) */
				newJquery('[name=st_addr1]').val(data.zonecode+" "+data.address);
				newJquery('[name=st_addr2]').val(data.buildingName);
				newJquery('[name=st_addr2]').focus();
				
				newJquery('[name=start]').val(data.address);
				//주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				geocoder.addressSearch(data.address, function(result, status) {
					
					if (status === kakao.maps.services.Status.OK) {
					    console.log("출발지"+result[0].x+"//"+result[0].y);
					    newJquery('[name=start]').val(result[0].x+","+result[0].y);
					    cal();
					}else{
						alert("주소 오류 : 주소를 확인해 주세요. \n (작성예시 : 서울시 강남구 역삼동 824-10");
					}
				});
			}
		}).open();
	}
	let chk = false;
	function en_openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				/* newJquery('[name=en_zip]').val(data.zonecode); // 우편번호 (5자리) */
				newJquery('[name=en_addr1]').val(data.zonecode+" "+data.address);
				newJquery('[name=en_addr2]').val(data.buildingName);
				newJquery('[name=en_addr2]').focus();
				
				newJquery('[name=end]').val(data.address);
				var geocoder = new kakao.maps.services.Geocoder();
				geocoder.addressSearch(data.address, function(result, status) {
					
					if (status === kakao.maps.services.Status.OK) {
					    console.log("도착지"+result[0].x+"//"+result[0].y);
					    newJquery('[name=end]').val(result[0].x+","+result[0].y);
					    cal();
					}else{
						alert("주소 오류 : 주소를 확인해 주세요. \n (작성예시 : 서울시 강남구 역삼동 824-10");
					}
				});
			}
		}).open();
	}
	
	function cal() {
		
		let mo_km=0, tot=0;
		
		if(newJquery('[name=start]').val() != "" && newJquery('[name=end]').val() != ""){
			$.ajax({
		        type: "GET",
		        url: "https://apis-navi.kakaomobility.com/v1/directions",
		        dataType: 'json',
		        contentType: 'application/json',
		        headers: {"Authorization": "KakaoAK 93497437260de9684e83791ec345e37a"},
		        async: false,
		        data: {
		           origin: newJquery('[name=start]').val(),
		           destination: newJquery('[name=end]').val()
		        },
		        success: function (data){
		           console.log(data.routes[0].sections[0].distance);
		           newJquery('[class=mo_km]').html((data.routes[0].sections[0].distance)/1000 + "km");
		           tot += ((data.routes[0].sections[0].distance)/1000)*1000;
		           console.log(data.routes[0].sections[0].duration);
		           /* newJquery('[class=mo_time1]').html((data.routes[0].sections[0].duration)); */
		        }
		    });
		}else{
			tot += 0;
		}
		if(newJquery('[id=sv_type1]').is(":checked")||newJquery('[id=sv_type2]').is(":checked")){
			if(newJquery('[id=sv_type1]').is(":checked")){
				tot += 1000;
				newJquery('[class=mo_sv_type]').html(newJquery('[id=sv_type1]').val());
			}else if(newJquery('[id=sv_type2]').is(":checked")){
				tot += 2000
				newJquery('[class=mo_sv_type]').html(newJquery('[id=sv_type2]').val());	
			}		
		}
		if(newJquery('[id=time1]').is(":checked")||newJquery('[id=time2]').is(":checked")){
			if(newJquery('[id=time1]').is(":checked")){
				tot += 3000;
				newJquery('[class=mo_time]').html(newJquery('[id=time1]').val());	
			}else if(newJquery('[id=time2]').is(":checked")){
				tot += 5000;
				newJquery('[class=mo_time]').html(newJquery('[id=time2]').val());	
			}			
		}
		if(newJquery('[id=park1]').is(":checked")||newJquery('[id=park2]').is(":checked")){
			if(newJquery('[id=park1]').is(":checked")){
				tot += 1000
				newJquery('[class=mo_park]').html(newJquery('[id=park1]').val());	
			}else if(newJquery('[id=park2]').is(":checked")){
				tot += 6000
				newJquery('[class=mo_park]').html(newJquery('[id=park2]').val());	
			}			
		}
		if(newJquery('[id=el1]').is(":checked")||newJquery('[id=el2]').is(":checked")){
			if(newJquery('[id=el1]').is(":checked")){
				tot += 1000
				newJquery('[class=mo_el]').html(newJquery('[id=el1]').val());	
			}else if(newJquery('[id=el2]').is(":checked")){
				tot += 6000
				newJquery('[class=mo_el]').html(newJquery('[id=el2]').val());	
			}	
		}
		newJquery('[class=mo_tot]').html(tot);
	}
	$(function(){
		$(".reset").click(reset1)
		function reset1() {
			console.log("testes");
			newJquery('[class=mo_sv_type]').html("-");
			newJquery('[class=mo_time]').html("-");
			newJquery('[class=mo_km]').html("-");
			newJquery('[class=mo_park]').html("-");
			newJquery('[class=mo_el]').html("-");
			newJquery('[class=mo_tot]').html("-");
		}
	})
</script>

<section class="calc">
    <h2 class="calcTitle">용달 비용 계산하기</h2>
	
    <form name="tt">
    
    <div class="calcList">
            <ul class="calcItem">
                <li class="option">
                    <h3>운송옵션을 알려주세요.</h3>
                    <label for="sv_type1">
                        <input type="radio" id="sv_type1" name="sv_type" value="일반이사" onclick="cal()">
                        일반이사
                    </label>
                    <label for="sv_type2">
                        <input type="radio" id="sv_type2" name="sv_type" value="포장이사" onclick="cal()">
                        포장이사
                    </label>
                </li>
                <li class="time">
                    <h3>픽업시간을 선택해 주세요.</h3>
                    <div class="timeWrap">
                        <input type="radio" id="time1" name="time" value="주간" onclick="cal()">
                        <label for="time1">
                            08:00 ~ 17:30 주간
                        </label>
                        <input type="radio" id="time2" name="time" value="야간" onclick="cal()">
                        <label for="time2">
                            18:00 ~ 07:30 야간
                        </label>
                    </div>
                </li>
                <li class="address">
                    <h3>출발지를 입력해 주세요.</h3>
                    <input type="text"  name="st_addr1" placeholder="여기를 눌러서 출발지 주소 검색"  onclick="st_openZipSearch()">
                    <input type="text"  name="st_addr2" placeholder="상세 주소 입력 : 건물 이름 혹은 동호수">
                    <h3>도착지를 입력해 주세요.</h3>
                    <input type="text"  name="en_addr1" placeholder="여기를 눌러서 도착지 주소 검색"  onclick="en_openZipSearch()">
                    <input type="text"  name="en_addr2" placeholder="상세 주소 입력 : 건물 이름 혹은 동호수">
                    
                    <input type="hidden" name="start">
					<input type="hidden" name="end">			
                </li>
                <li class="time">
                    <h3>주차 가능 여부</h3>
                    <div class="timeWrap">
                        <input type="radio" id="park1" name="park" value="사용가능" onclick="cal()">
                        <label for="park1">
                           사용가능
                        </label>
                        <input type="radio" id="park2" name="park" value="사용불가" onclick="cal()">
                        <label for="park2">
                           사용불가
                        </label>
                    </div>
                    <h3>엘리베이터 사용가능 여부</h3>
                    <div class="timeWrap">
                        <input type="radio" id="el1" name="el" value="사용가능" onclick="cal()">
                        <label for="el1">
                          사용가능
                        </label>
                        <input type="radio" id="el2" name="el" value="사용불가" onclick="cal()">
                        <label for="el2">
                          사용불가
                        </label>
                    </div>
                </li>
            </ul>
            <div>
                <div class="calcBtn">
                    <h3 class="btnTitle">예상 비용 계산 결과</h3>
                    <button type="reset" class="reset">초기화</button>
                    <ul>
                        <li>
                            <p>운송 옵션</p>
                            <p class="mo_sv_type">-</p>
                        </li>
                        <li>
                            <p>예약 시간</p>
                            <p class="mo_time">-</p>
                        </li>
                        <li>
                            <p>이동 거리</p>
                            <p class="mo_km">-</p>
                        </li>
<!--                         <li>
                            <p>이사 소요 시간</p>
                            <p class="mo_time1">-</p>분
                        </li> -->
                        <li>
                            <p>주차 가능 여부</p>
                            <p class="mo_park">-</p>
                        </li>
                        <li>
                            <p>엘리베이터</p>
                            <p class="mo_el">-</p>
                        </li>
                    </ul>
                    <div class="resultchk">
                        <p>나홀로 이사 용달비용</p>
                        <p class="mo_tot">-</p>원
                    </div>
              <c:choose>
         	 	<c:when test="${id!=null }">
                    <a class="resultBtn" href="Estimate">나홀로 이사 첫 운송 할인받기</a>
                </c:when>
                <c:otherwise>
                	<a class="resultBtn" href="<c:url value='/login/Login'/>">나홀로 이사 첫 운송 할인받기</a>
                </c:otherwise>
               </c:choose>
                </div>
            </div>
        </div>
    </form>
</section>
