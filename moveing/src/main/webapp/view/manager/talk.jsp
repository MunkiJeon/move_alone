<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/manager/talk.css'/>">
<div class="managerWrap">
    <div class="talk">
        <div class="list">
            <button>고객</button>
            <button>직원</button>
        </div>
        <div class="line"></div>
        <table class="talkWrap">
        
        	<tr>
        		<td>고객 아이디</td>
        		<td>문의</td>
        		<td>답변</td>
        		<td>상태</td>
        	</tr>
        </table>
    </div>
</div>

<script>
$(function(){
	let index = 1;
	talkAjax(index);
	$(".managerWrap .talk .list button").click(function(){
		talkAjax($(this).index()+1);
		console.log($(this).index());
	})
	function talkAjax(index){
		$.ajax({
			url:'<c:url value="/ajax/InquiryList"/>',
			type:'POST',
			data:{index:index},
			async:false,
			dataType:'json',	//지정하지 않으면 문자열로 처리
			success:function(data){
				console.log(data)
				let str = `<tr>
					<td>no</td>
	        		<td>고객 아이디</td>
	        		<td>문의</td>
	        		<td>답변</td>
	        		<td>상태</td>
	        	</tr>`;
				for(let i = 0; i<data.length;i++){
					let answer = decodeURIComponent(data[i].answer);
					let res = "완료";
					if(data[i].answer==""){	
						answer = "<input type='text' class='answer'>";
						res = "<button class='inquiryBtn'>답변</button>";
					}
					str+="<tr><td class='inquiryNO'>"+data[i].no+
						 "</td><td class='inquiryID'>"+decodeURIComponent(data[i].id)+
						 "</td><td class='inquiryContents'>"+decodeURIComponent(data[i].contents)+
						 "</td><td class='inquiryText'>"+answer+
						 "</td><td class='inquiryTd'>"+res+
						 "</td></tr>";
				} 
				
				$(".talk .talkWrap").html(str);
				
				$(".talk .talkWrap .inquiryBtn").click(function(){
					let thisEl = $(this);
					let addData = $(this).parent().siblings(".inquiryText").find(".answer").val(); 
					let id = $(this).parent().siblings(".inquiryID").html().trim(); 
					let no = $(this).parent().siblings(".inquiryNO").html().trim(); 
					
					let contents = $(this).parent().siblings(".inquiryContents").html().trim(); 
	
				$.ajax({
					url:'<c:url value="/ajax/InquiryReg"/>',
					type:'POST',
					data:{addData:addData,id:id,no:no},
					async:false,
					dataType:'json',	//지정하지 않으면 문자열로 처리
					success:function(data){
						if(data.cnt>0){
							thisEl.parent().siblings(".inquiryText").html(addData);
							thisEl.parent().html("완료");
						}
					},
					error:function(e){
						console.log(e.responseText);
					}
					});
				})
			},
			error:function(e){
				console.log(e.responseText);
			}
		})
	}
})
</script>