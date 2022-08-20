<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>.manager.managerList .type{height: 21px;overflow: hidden;}</style>
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
					$(".chat_window").append("<div class='manager managerList' ></div>")
					let str = "";
					let arr = [];
					let el = [];
					for(let i=0;i<data.length;i++){
						arr.push(decodeURIComponent(data[i].type));
						//str+="<div class='tabList' data-answer='"+
						//data[i].answer+"' data-type='"+data[i].type+"'>"+data[i].questions+"</div>";
					}					
					let set = new Set(arr);
					let typeArr = [...set];
					
					for(let i=0;i<typeArr.length;i++){
						$(".manager.managerList").append("<div class='type' data-type='"+typeArr[i]+"' >"+typeArr[i]+"</div>");
						
					}
					for(let i=0;i<data.length;i++){
						
						for(let j=0; j<typeArr.length;j++){
							if($(".manager.managerList .type").eq(j).attr("data-type") == decodeURIComponent(data[i].type)){
								$(".manager.managerList .type").eq(j).append("<div class='typeList' data-value='"+
										decodeURIComponent(data[i].answer)+"'>"+decodeURIComponent(data[i].questions))+"</div>";								
							}
						}	
					}
					$(".manager.managerList .type").click(function(){
						$(".manager.managerList .type").css({height:"21px"})
						$(this).stop().animate({height:"100%"});
						$(".chat_window").scrollTop = $('.chat_window').offset().top;
						$(".chat_window").animate({scrollTop:$('.chat_window').offset().top+1000},100);
					})
					console.log(typeArr);
					
					$(".manager.managerList .type .typeList").click(function(){
						
						$(".chat_window").append("<p class='user'>"+$(this).attr("data-value")+"</p>");
					});
					
				},error:function(e){console.log(e)}
			})
	})
		
		
		})
</script>