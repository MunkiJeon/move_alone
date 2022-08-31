<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
    .menuI2 a{
	display: inline-block;
	width:100%;
	height:50%;
	color: white;
}
    .menuI{
    left: -100px;
    top: 150px;
    width: 100px;
    position: fixed;
    align-content: center;
    text-align: center;
    z-index: 3;
    display: flex;
 }
    
 .box{
 	
    top: 50%;
    width: 100px;
    height: 110px;
    background: rgb(63 82 245);
 }
 .box2{
 	top: 15%;
    right: -15%;
    width: 24px;
    height: 24px;
    border: 1px solid white;
    background: rgb(61, 81, 255);
    border-radius: 20%;
    position: absolute;
    text-align: right;
    line-height: 35%;
    cursor: pointer;
 }
 
 .menuI2{
 	width: 100%;
    display: inline-block;
    margin-top: 10px;
    padding-top:2px;
    cursor: pointer;
    align-content: center;
}
.menuI2:hover {
	background: gray;
}
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
		<label class="menuI2" id ="w2"><a href="<c:url value='/guest/'/>GuestMoveInfo">매칭 정보</a></label>
		<label class="menuI2" id ="w3"><a href="<c:url value='/guest/'/>GuestHistory">이사 내역</a></label> 
	</div>
	
	<label for="bo"class="box2">
	<button id="bo" style="color: white;">▶</button>
	</label>
</div>