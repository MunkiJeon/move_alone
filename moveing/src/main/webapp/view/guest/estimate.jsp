<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<link rel="stylesheet" href="<c:url value='/resource/css/diary.css'/>">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	var newJquery = $.noConflict(true); // 다른 라이브러리랑 겹칠때 이렇게 해주면 됨.
	function st_openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				newJquery('[name=st_zip]').val(data.zonecode); // 우편번호 (5자리)
				newJquery('[name=st_addr1]').val(data.address);
				newJquery('[name=st_addr2]').val(data.buildingName);
				newJquery('[name=st_addr2]').focus();
			}
		}).open();
	}
	function en_openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				newJquery('[name=en_zip]').val(data.zonecode); // 우편번호 (5자리)
				newJquery('[name=en_addr1]').val(data.address);
				newJquery('[name=en_addr2]').val(data.buildingName);
				newJquery('[name=en_addr2]').focus();
			}
		}).open();
	}
</script>
<section class="detail">
	<!-- 날짜선택
        시간선택
        출발 도착
        서비스 종류(이사종류) -->
	<section class="calc">
		<form action="Estimate?num=2" method="post">
			<!-- <input type="hidden" name="num" value="2"/> -->
			<div class="calcList">
				<ul class="calcItem">
					<li class="option">
						<h3>운송옵션을 알려주세요.</h3> <label for="option1"> <input
							type="radio" id="option1" name="option" value="일반"> 일반이사
					</label> <label for="option2"> <input type="radio" id="option2"
							name="option" value="포장"> 포장이사
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
							<input type="radio" id="time1" name="time" value="오전"> 
							<label for="time1"> 08:00 ~ 17:30 주간 </label> 
							<input type="radio" id="time2" name="time" value="오후"> 
							<label for="time2"> 18:00 ~ 07:30 야간 </label>
						</div>
						<hr/>
					</li>
					
					<li class="address">
						<div>
							<h3>출발지를 입력해 주세요.</h3> <!-- <input type="text" placeholder="여기를 눌러서 출발지 주소 검색" name="start_point"> -->
							<input type="text" name="st_zip" style="width: 120px" readonly>
							<input type="text" name="st_addr1" style="width: 50%" readonly> 
							<input type="text" name="st_addr2" style="width: 50%">
							<input type="text" name="st_addr3" style="width: 20%" placeholder="층수: ex) 2층">
							<input type="text" name="st_addr4" style="width: 20%" placeholder="방수: ex) 3개">
							<input type="button" value="주소검색" style="width: 25%" onclick="st_openZipSearch()">
						</div>
					</li>
					
					<li class="ELWrap">
						<h3>출발지 엘레베이터 유무</h3>
						<div class="start_ELWrap">
							<input type="radio" id="st_el1" name="start_el" value="true">
							<label for="st_el1"> 있음 </label> 
							<input type="radio" id="st_el2" name="start_el" value="false">
							<label for="st_el2"> 없음 </label>
						</div>
					</li>

					<li class="PKWrap">
						<h3>출발지 주차장 유무</h3>
						<div class="start_PKWrap">
							<input type="radio" id="st_pk1" name="start_pk" value="true">
							<label for="st_pk1"> 있음 </label> 
							<input type="radio" id="st_pk2" name="start_pk" value="false">
							<label for="st_pk2"> 없음 </label>
						</div>
						<hr/>
					</li>
					
					<li class="address">
						<div>
							<h3>도착지를 입력해 주세요.</h3>
							<input type="text" name="en_zip" style="width: 120px" readonly>
							<input type="text" name="en_addr1" style="width: 50%" readonly> 
							<input type="text" name="en_addr2" style="width: 50%">
							<input type="text" name="en_addr3" style="width: 20%" placeholder="층수: ex) 3층">
							<input type="text" name="en_addr4" style="width: 20%" placeholder="방수: ex) 2개">
							<input type="button" value="주소검색" style="width: 25%" onclick="en_openZipSearch()">
						</div>	
					</li>
					<li class="ELWrap">
						<h3>도착지 엘레베이터 유무</h3>
						<div class="end_ELWrap">
							<input type="radio" id="en_el1" name="end_el" value="true">
							<label for="en_el1"> 있음 </label> 
							<input type="radio" id="en_el2" name="end_el" value="false"> 
							<label for="en_el2"> 없음 </label>
						</div>
					</li>
					<li class="PKWrap">
						<h3>도착지 주차장 유무</h3>
						<div class="end_PKWrap">
							<input type="radio" id="en_pk1" name="end_pk" value="true">
							<label for="en_pk1"> 있음 </label> 
							<input type="radio" id="en_pk2" name="end_pk" value="false">
							<label for="en_pk2"> 없음 </label>
						</div>
					</li>
					<li><button type="submit" class="detailNext">다음</button></li>
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