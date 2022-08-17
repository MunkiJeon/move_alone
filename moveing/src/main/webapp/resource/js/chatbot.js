/**
 * 
 */
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

$(".close").click(function(){
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
			for(let i =0;i<data.length;i++){
			
				if(data[i]!="null"){
					
					$(".chat_window").append(decodeURIComponent(data[i])+"<br/>")
				}
			}
			
			
		},
		error:function(e){console.log(e)}
	});
}
})