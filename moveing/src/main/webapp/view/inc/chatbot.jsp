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

	id = '${id}';
	let contents = "null";
	$("#chatBotId").submit(function(e){
		e.preventDefault();
		contents = $(".contents").val();
		if(contents==null||contents.length<5) return;
		chatAjax();
	})
	chatAjax();
	function chatAjax(){
		$.ajax({
			url:'/moveingAlone_proj/ajax/ChatBot',
			type:'POST',
			data:{id:id,contents:contents},
			async:false,
			dataType:'json',
			success:function(data){
				let string="";
				for(let i =0;i<data.length;i++){
					if(i%2==0){
							string+="<p class='user'>"+decodeURIComponent(data[i])+"</p>";
						
					}else{
						if(data[i]!="null"){	
							string+="<p class='manager'>"+decodeURIComponent(data[i])+"</p>";
						}
						
					}
				}
				
				$(".chat_window").html(string);
				$(".chat_window").scrollTop = $('.chat_window').offset().top;
				$(".chat_window").animate({scrollTop:$('.chat_window').offset().top+1000},100);
			},
			error:function(e){console.log(e)}
		});
	}
	})
</script>