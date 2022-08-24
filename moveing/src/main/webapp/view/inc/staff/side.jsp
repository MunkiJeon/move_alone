<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
a{
	display: inline-block;
	width:100%;
	height:100%;
}
 .toggle-switch input{
 	-webkit-appearance:none;
 	-webkit-border-redius:0;
 }
 
 #container{
 	margin-top:50px;
 	display: flex;
 	width:100%;
 	justify-content: center;
 	align-items: center;
 }
 
 .toggle-switch input[type=checkbox]{
 	display: none;
 }
 
 .toggle-track{
 	display: inline-block;
 	position: relative;
 	width:60px;
 	height: 25px;
 	border-radius: 60px;
 	background: #8b8b8b;
 }
 .toggle-track:before{
  content:'';
  display: block;
  position: absolute;
  top: -6px;
  left: -15px;
  width: 27px;
  height: 27px; 
  margin: 5px;
  background: #fff;
  border-radius:100%;
  border:1px solid #8b8b8b;
  transition:left 0.3s;
}
 
 .toggle-switch input[type=checkbox] + label .toggle-track:after{
  content:'OFF';
  display: inline-block;
  position: absolute;
  right: 8px;
  color: #fff;
}
 
 .toggle-switch input[type=checkbox]:checked + label .toggle-track{
  background: #FA9AA6;
}
.toggle-switch input[type=checkbox]:checked + label .toggle-track:before{
  left: 30px;
  border:1px solid #FA9AA6;
}
.toggle-switch input[type=checkbox]:checked + label .toggle-track:after{
  content:'ON';
  left: 5px;
}
.menuI{
 	left:-100px;
 	width:100px;
 	height:400px;
 	background:#40699A;
 	position:fixed;
 	z-index: 1;
 	border: 1px solid black;
 	
 }
 .box{
 	left:0px;
 	top:90px;
 	width:100px;
 	height: 390px;
 	background:#40699A;
 	
 	
 }
 
 .box2{
 	top:171px;
 	left:90px;
 	width:30px;
 	height:40px;
 	border: 1px solid black; 
 	background:#40699A; 
 	border-radius:20%;
 	position: absolute;
 	text-align: right;
 	line-height: 35px;
 	cursor:pointer;
 }
 
 .menuI2{
 	width: 95px;
 	height: 90px;
 	display:inline-block;
 	margin-top: 5px;
 	cursor:pointer;
 }
 
  .menuI>.box2 input[type=checkbox]{
	display: none;

}
 #bo {
background: transparent;
cursor: pointer;	
}
</style>
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">
$(function () {
	$("#bo").click(function(){
		if(!$(this).hasClass("asdf")){
			$(this).addClass("asdf")
			$(".menuI").animate({left:"0"})
			$(this).html("◀");	
			
		}else{
			$(this).removeClass("asdf")
			$(".menuI").animate({left:"-100px"})
			$(this).html("▶");						
		}
	})
	
})
</script>
<div class="menuI">
	<div id="container">
		<div class="toggle-switch">
			<input type="checkbox" id="chkTog4">
			<label for="chkTog4">
				<span class="toggle-track"></span>
		</label>
	</div>
</div>

		<div class="box">
			<label class="menuI2" id ="w1"><a href="<c:url value='/staff/'/>StaffInformation">내 정보</a></label>
			<label class="menuI2" id ="w2"><a href="<c:url value='/staff/'/>StaffWorkList">매칭정보</a></label>
			<label class="menuI2" id ="w3"><a href="<c:url value='/staff/'/>StaffMatchingList">매칭현황</a></label>
			<label class="menuI2" id ="w4"><a href="<c:url value='/staff/'/>StaffWorkHistory">매출</a></label>
		</div>
		<label for="bo"class="box2">
	<button id="bo">▶</button>
	</label>
</div>