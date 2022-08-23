<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<link rel="stylesheet" href="<c:url value='/resource/css/diary.css'/>">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	           newJquery('[class=mo_km]').val((data.routes[0].sections[0].distance)/10);
	           console.log(data.routes[0].sections[0].duration);
	           newJquery('[class=mo_time]').val((data.routes[0].sections[0].duration));
	        }
	    });
    console.log("결과 >>>>"+newJquery('[name=start]').val()+"//"+newJquery('[name=end]').val());
    console.log("거리"+newJquery('[class=mo_km]').val());
	}else{
		console.log("실패");
		console.log("결과 >>>>"+newJquery('[name=start]').val()+"//"+newJquery('[name=end]').val());
	}
}
</script>

<section class="detail">

	<section class="calc">
		<form action="Estimate?num=2" method="post">
			<!-- <input type="hidden" name="num" value="2"/> -->
			<div class="calcList">
				<ul class="calcItem">
					<li class="option">
						<h3>운송옵션을 알려주세요.</h3> 
						<label for="option1"> 
							<input type="radio" id="option1" name="option" value="일반이사"> 
							일반이사
						</label>
						<label for="option2"> 
							<input type="radio" id="option2" name="option" value="포장이사"> 
							포장이사
						</label>
					</li>
					
					<li>
						<h3>예약 날짜를 선택해 주세요.</h3>
						<div class="diary">
							<div class="wrapper"></div>
							<input type="hidden" name="sel_date" id="sel_date">
						</div>
					</li>
					
					<li class="time">
						<h3>픽업시간을 선택해 주세요.</h3>
						<div class="timeWrap">
							<input type="radio" id="time1" name="time" value="주간"> 
							<label for="time1"> 08:00 ~ 17:30 주간 </label> 
							<input type="radio" id="time2" name="time" value="야간"> 
							<label for="time2"> 18:00 ~ 07:30 야간 </label>
						</div>
						<hr/>
					</li>
					
					<li class="address">
						<div>
							<h3>출발지를 입력해 주세요.</h3> <!-- <input type="text" placeholder="여기를 눌러서 출발지 주소 검색" name="start_point"> -->
		                    <input type="text"  name="st_addr1" placeholder="여기를 눌러서 출발지 주소 검색"  onfocus="st_openZipSearch()">
		                    <input type="text"  name="st_addr2" placeholder="상세 주소 입력 : 건물 이름 혹은 동호수">
							<input type="text" name="st_addr3" style="width: 20%" placeholder="층수: ex) 2층">
							<input type="text" name="st_addr4" style="width: 20%" placeholder="방수: ex) 3개">
							<input type="hidden" name="start">
						</div>
					</li>
					
					<li class="ELWrap">
						<h3>출발지 엘레베이터 유무</h3>
						<div class="start_ELWrap">
							<input type="radio" id="st_el1" name="start_el" value="엘베있음">
							<label for="st_el1"> 있음 </label> 
							<input type="radio" id="st_el2" name="start_el" value="엘베있음">
							<label for="st_el2"> 없음 </label>
						</div>
					</li>

					<li class="PKWrap">
						<h3>출발지 주차장 유무</h3>
						<div class="start_PKWrap">
							<input type="radio" id="st_pk1" name="start_pk" value="주차가능">
							<label for="st_pk1"> 있음 </label> 
							<input type="radio" id="st_pk2" name="start_pk" value="주차불가">
							<label for="st_pk2"> 없음 </label>
						</div>
						<hr/>
					</li>
					
					<li class="address">
						<div>
							<h3>도착지를 입력해 주세요.</h3>
							<input type="text"  name="en_addr1" placeholder="여기를 눌러서 도착지 주소 검색"  onfocus="en_openZipSearch()">
                    		<input type="text"  name="en_addr2" placeholder="상세 주소 입력 : 건물 이름 혹은 동호수">
							<input type="text" name="en_addr3" style="width: 20%" placeholder="층수: ex) 3층">
							<input type="text" name="en_addr4" style="width: 20%" placeholder="방수: ex) 2개">
							<input type="hidden" name="end">
						</div>	
					</li>
					<li class="ELWrap">
						<h3>도착지 엘레베이터 유무</h3>
						<div class="end_ELWrap">
							<input type="radio" id="en_el1" name="end_el" value="엘베있음">
							<label for="en_el1"> 있음 </label> 
							<input type="radio" id="en_el2" name="end_el" value="엘베있음"> 
							<label for="en_el2"> 없음 </label>
						</div>
					</li>
					<li class="PKWrap">
						<h3>도착지 주차장 유무</h3>
						<div class="end_PKWrap">
							<input type="radio" id="en_pk1" name="end_pk" value="주차가능">
							<label for="en_pk1"> 있음 </label> 
							<input type="radio" id="en_pk2" name="end_pk" value="주차불가">
							<label for="en_pk2"> 없음 </label>
						</div>
					</li>
					<li>
					<input type="hidden" class="mo_km" name="mo_km">
					<button type="submit" class="detailNext">다음</button>
					</li>
				</ul>
				<!-- <button type="button" class="test">테스트</button> -->
			</div>
		</form>
	</section>
</section>
<script>
$(function(){
let num;
const now = new Date();
let realMonth = now.getMonth();
let realDay = now.getDate();
diaryAjax(num);
function diaryAjax(num){
	$.ajax({
		url:'<c:url value="/ajax/Diary"/>',
		type:'GET',
		data:{month:num,realMonth:realMonth,realDay:realDay},
		async:false,
		dataType:'json',	//지정하지 않으면 문자열로 처리
		success:function(dd){
			$(".diary .wrapper").show();
			$(".diary .wrapper").find("div").remove();
			$(".diary .wrapper").find(".flex-wrap").remove();
			$(".diary .wrapper").append("<div class='flex-wrap'>");
			$(".diary .wrapper").find(".flex-wrap").append("<button class='pre'>&lt;</button>");
			$(".diary .wrapper").find(".flex-wrap").append("<h2 class='month'>"+dd.title+"월</h2>");
			$(".diary .wrapper").find(".flex-wrap").append("<button class='next'>&gt;</button>");
			$(".diary .wrapper").append(dd.diary);
			if(dd.title<=realMonth+1) $(".pre").attr("disabled", true);
			if(dd.title>=12) $(".next").attr("disabled", true);
	
			
			$(".diary .pre").click(function(){
				num = $(".diary .month").html().split("월")[0]*1-1;
				diaryAjax(num);
			})
			$(".diary .next").click(function(){
				num = $(".diary .month").html().split("월")[0]*1+1;
				diaryAjax(num);
			})
			$(".diary .chk").click(function(){
				if($(".month").html().split("월")[0]*1-1<=realMonth && $(this).html().trim()*1<=realDay) return;
				$(".diary .chk").css({background:"transparent"});
				$(this).css({background:"red"});
				$(".diary .chk").removeClass("dayChk");
				$(this).addClass("dayChk");
				
				console.log($(".diary .month").html()+$(this).html()+"일");
				/* console.log((now.getYear()+1900)+ "-ㅇ-" +dd.title + "-ㅇ-" + $(this).html()); */
				$("#sel_date").val((now.getYear()+1900)+"-"+dd.title +"-"+ $(this).html());
				
			})
		},
		error:function(e){
			console.log(e.responseText);
		}
	})
	}
	
/* 	$(".detail .calc .calcList .test").click(function(){
		console.log($("#sel_date").val());
	}) */
	
	//  var newJquery = $.noConflict(true); // 다른 라이브러리랑 겹칠때 이렇게 해주면 됨.
})
function openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				newJquery('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
				newJquery('[name=addr1]').val(data.address);
				newJquery('[name=addr2]').val(data.buildingName);
				newJquery('[name=addr2]').focus();
			}
		}).open();
	}
</script>