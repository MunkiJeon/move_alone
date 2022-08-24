<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
    a{
	display: inline-block;
	width:100%;
	height:100%;
}
    
    .menuI{
 	left:-100px;
 	top:150px;
 	width:100px;
 	height:300px;
 	/*  background:#40699A;  */
 	position:fixed;
 	z-index: 3;
 	/* border: 1px solid red; */
 	display: flex;
 }
    
 .box{
 	left:0px;
 	top:150px;
 	width:100px;
 	height:292px;
 	 background:#40699A; 
 	
 	/* border:1px solid blue; */
 }
 .box2{
 	top:120px;
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
	<div class="box">
		<label class="menuI2" id ="w1"><a href="<c:url value='/guest/'/>GuestInformation">내 정보</a></label>
		<label class="menuI2" id ="w2"><a href="<c:url value='/guest/'/>GuestMoveInfo">이사정보</a></label>
		<label class="menuI2" id ="w3"><a href="<c:url value='/guest/'/>GuestHistory">내역</a></label> 
	</div>
	
	<label for="bo"class="box2">
	<button id="bo">▶</button>
	</label>
</div>