<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/chatbot.css'/>">
<button class="chat">
<img src="<c:url value='/resource/image/'/>bot.png"/>
</button>
<div class="chat_ui">
	<button class="chat_close">X</button>
	<div class="chat_window">
		
	</div>
	<form id="chatBotId">
		<input type="text" name="contents" class="contents"/>
		<button type="submit" class="send">보내기</button>
	</form>
	<div class="autoList bts">자주하는 질문</div>
	
</div>
<script>
$(function(){
	
	$(".chat").click(function(){
		console.log("setsetg")
		if($(this).hasClass("show")){
			$(this).addClass("show");
			$(".chat_ui").stop().animate({right:"-400px"})
		}else{				
			$(this).removeClass("show");
			$(".chat_ui").stop().animate({right:"0"})
		}
	})

	$(".chat_close").click(function(){
		$(this).removeClass("show");
		$(".chat_ui").stop().animate({right:"-400px"})
	})

	let id = '${id}';
	$("#chatBotId").submit(function(e){
		e.preventDefault();
		let contents = $(".contents").val();
		if(contents==null||contents.length<5) return;
		$.ajax({
			url:'<c:url value='/ajax/ChatBotReg'/>',
			type:'POST',
			data:{id:id,contents:contents},
			async:false,
			dataType:'json',
			success:function(data){
				
				if(data[0]=="true"){
				let string ="<p class='user'>"+contents+"</p>";
				
				$(".chat_window").append(string);
				$(".chat_window").scrollTop = $('.chat_window').offset().top;
				$(".chat_window").animate({scrollTop:$('.chat_window').offset().top+1000},100);
				}else{
					console.log("실패")
				}
			},
			error:function(e){console.log(e)}
		});
	})
	
	
	
	chatAjax();
	function chatAjax(){
		$.ajax({
			url:'<c:url value='/ajax/ChatBot'/>',
			type:'POST',
			data:{id:id},
			async:false,
			dataType:'json',
			success:function(data){
				let string="";
				for(let i =0;i<data.length;i++){
					string+="<p class='user'>"+decodeURIComponent(data[i].inquiry)+"</p>";
					if(decodeURIComponent(data[i].answer)!="null"){	
						string +="<p class='manager'>"+decodeURIComponent(data[i].answer)+"</p>";
					}
					
				}
				
				$(".chat_window").html(string);
				$(".chat_window").scrollTop = $('.chat_window').offset().top;
				$(".chat_window").animate({scrollTop:$('.chat_window').offset().top+1000},100);
			},
			error:function(e){console.log(e)}
		});
	}
	
	/* $("#chatBotId").submit(function(e) {
		e.preventDefault();
		let contents = $(".contents").val();
		if(contents==null) return;
		 */
	//})
	
	$(".bts").click(function () {
		
		$.ajax({
				url:'<c:url value='/ajax/ChatBotAn'/>',
				type:'POST',
				data:{index:"gfg"},
				async:false,
				dataType:'json',
				success:function(data){
					let str = "<div class='manager'>";
					let str2 = "<div class='manager'>";
					let str3 = "<div class='manager'>";
					let str4 = "<div class='manager'>";
					let str5 = "<div class='manager'>";
						str +="<p id ='bts2'"+">기사질문"+"</p>"+"<p id='bts3'>"+"이사질문"+"</p>";
						for(let i = 0;i<data.length;i++ ){
							
							/*str +="<p id ='bts2' data-value="+decodeURIComponent(data[i].answer)+">질문 : "+"</p>"; */
							
						}
					str+="</div>"
					
					
					$(".chat_window").append(str)
					$(".chat_window").animate({scrollTop:$('.chat_window').offset().top+1000},100);
					
					$(".manager>#bts2").click(function() {
						for(let i =0; i<data.length; i++){
							if(data[i].staffQ!=null){
								str2 += "<p id = 'ans'>"+decodeURIComponent(data[i].staffQ)+"</p>"
							}
							
						}
						$(".chat_window").append(str2)
						$(".chat_window").animate({scrollTop:$('.chat_window').offset().top+1000},100);
						str2+="</div>"
					})
					
					
					$(".manager>#bts3").click(function() {
						for(let i =0; i<data.length; i++){
							if(data[i].moveQ!=null){
								str3 += "<p id = 'ans2'>"+decodeURIComponent(data[i].moveQ)+"</p>"
							}
							
						}
						$(".chat_window").append(str3)
						$(".chat_window").animate({scrollTop:$('.chat_window').offset().top+1000},100);
						str3+="</div>"
					})
					
					$(".manger>ans").click(function() {
						for(let i =0; i<data.length; i++){
							if(data[i].staffA!=null){
								str4 += "<p>"+decodeURIComponent(data[i].staffA)+"</p>"
							}
						}
						$(".chat_window").append(str4)
						$(".chat_window").animate({scrollTop:$('.chat_window').offset().top+1000},100);
						str4+="</div>"
					})
					
/* 					$(".manager>#bts2").click(function() {
						var str = "<div class='manager'>"+$(this).attr("data-value")+"</div>";
						console.log("답변 : "+$(this).attr("data-value"));

						$(".chat_window").append(str);
					})					 */		
				},error:function(e){console.log(e)}
			})
	})
		
		
		})
</script>