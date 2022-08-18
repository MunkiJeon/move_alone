<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<link rel="stylesheet" href="<c:url value='/resource'/>/css/manager/staffmanagement.css">
<style>
.stepsign{position: fixed;bottom: -100vh;left: 50%;transform:translate(-50%,50%) ;width: 600px;background: white;padding: 30px;border-radius: 15px;}
.popupbg{position: fixed;background-color: rgba(0,0, 0, 0.3);width: 100%;height: 100%;display: none;top:0;left:0;}
.managerWrap .btnList {display: flex;justify-content: center;}
.managerWrap .btnList .button {margin-right: 15px;}
.managerWrap .btnList .button:last-child {margin-right: 0;}
</style>
<div class="popupbg"></div>
<div class="managerWrap">
	<h2>${title } 관리</h2>
     <div class="btnList" align="center">
         <button id="addBtn" class="popupbtn">추가</button>
         <button id="editBtn" class="popupbtnModify">수정</button>
         <button id="deleteBtn">삭제</button>
     </div>
    <table  border="" width="100%">
        
        <tr align="center">
            <td><input type="checkbox" id="allCheck"></td>
            <td>종류</td>
            <td>문의</td>
            <td>답변</td>
        </tr>
		<c:forEach items="${mainData }" var="dto">
	        <tr class="idchktr" align="center"> <!-- 모양  -->
	            <td><input type="checkbox" class="dataChk" value="${dto.no }"></td>
	            <td>${dto.type }</td>
	            <td>${dto.questions }</td>
	            <td>${dto.answer }</td>
	        </tr>
		</c:forEach>        
    </table>
</div>
<div class="delete">
	<p>삭제 하시겠습니까?</p>
	<button class="deletebtn">삭제</button>
	<button class="cencelbtn">취소</button>
</div>
<div class="stepsign">
    <form>
	    <table>
	        <tr>
	            <td>종류</td>
	            <td><input type="text" id="type"/></td>
	        </tr>
	        <tr>
	            <td>문의</td>
	            <td><input type="text" id="questions"/></td>
	        </tr>
	        <tr>
	            <td>답변</td>
	            <td><input type="text" id="answer"/></td>
	        </tr>
	        <tr>
	            <td colspan="2"><button type="submit">등록</button></td>
	        </tr>
	    </table>
    </form>
</div>

<script>
	$(function(){
		let add = false;
		let modify = false;
        $(".popupbtn").click(function(e){
            e.preventDefault();

            $(".popupbg").fadeIn(500);
            $(".stepsign").stop().animate({bottom:"50%"},500)
            
            
			$("#type").val("");
			$("#questions").val("");
			$("#answer").val("");
			add = true;
            if(add){
	            $(".stepsign").submit(function(e){
	                e.preventDefault();
					$.ajax({
			          	url:"<c:url value='/ajax/AutoTalkAdd'/>",
			          	type:'POST',
			  			data:{type:$("#type").val(),questions:$("#questions").val(),answer:$("#answer").val()},
			  			async:false,
			  			//dataType:'json',
			  			success:function(data){
			  				console.log(data.chk);
			  				if(data[0]=="false"){alert("실패")}
			  				else{alert("성공");
			  					location.href="?level="+level;
			  				}
			  			},
			  			error:function(e){console.log(e)}
		        	}) 
		            	
		        })
            }
	    })
        $(".popupbg").click(function(){
            $(this).fadeOut(500);
            $(".stepsign").stop().animate({bottom:"-100vh"},500)
            add=false;
            modify=false;
        })
        
        

        
        $(".popupbtnModify").click(function(e){
            e.preventDefault();
            let cnt = 0;
            let id = "";
            for(let i=0;i<$(".idchktr").length;i++){
            	if($(".idchktr").eq(i).find(".dataChk").is(':checked')){
            		cnt++;
            		id = $(".idchktr").eq(i).find(".dataChk").val()
            	}
            }
            if(cnt!=1){
            	return alert("하나만 체크해 주세요");
            }
            
            modify = true;
            console.log(id);
            $(".popupbg").fadeIn(500);
            $(".stepsign").stop().animate({bottom:"50%"},500)
            $("#id").attr("readonly","readonly");

			
            $.ajax({
         	
	         	url:"<c:url value='/ajax/AutoTalkModify'/>",
	         	type:'POST',
	 			data:{id:id},
	 			async:false,
	 			dataType:'json',
	 			success:function(data){
	 				
	 				$("#id").val(decodeURIComponent(data.id));
	 				$("#pw").val(decodeURIComponent(data.pw));
	 				$("#name").val(decodeURIComponent(data.name));
	 				$("#email").val(decodeURIComponent(data.email));
	 				$("#tel").val(decodeURIComponent(data.tel));
	 				
	 			},
	 			error:function(e){console.log(e)}
	    	})  
	            
	        if(modify){    
		        $(".stepsign").submit(function(e){
	                e.preventDefault();
	                $.ajax({
	                 	
	    	         	url:"<c:url value='/ajax/AutoTalkModify'/>",
	    	         	type:'POST',
	    	 			data:{id:id,pw:$("#pw").val(),name:$("#name").val(),
		 				email:$("#email").val(),
		 				tel:$("#tel").val()},
	    	 			async:false,
	    	 			dataType:'json',
	    	 			success:function(data){
			  				console.log(data.chk);
			  				if(data[0]=="false"){alert("실패")}
			  				else{alert("성공");
			  					location.href="?level="+level;
			  				}
	    	 				
	    	 			},
	    	 			error:function(e){console.log(e)}
	    	    	})  
		            	
		        })
	        }
        })
        
        
        
	    $(".delete").click(function(e){
	           e.preventDefault();
	           let id = "";
	           for(let i=0;i<$(".idchktr").length;i++){
	           	if($(".idchktr").eq(i).find(".dataChk").is(':checked')){
	           		cnt++;
	           		id += $(".idchktr").eq(i).find(".dataChk").val()+","
	           	}
	           }
	
	        $(".stepsign").submit(function(e){
	               e.preventDefault();
	
	            $.ajax({
	         	
		         	url:"<c:url value='/ajax/Modify'/>",
		         	type:'POST',
		 			data:{id:id},
		 			async:false,
		 			dataType:'json',
		 			success:function(data){
		 				
		 				$("#id").val(decodeURIComponent(data.id));
		 				$("#pw").val(decodeURIComponent(data.pw));
		 				$("#name").val(decodeURIComponent(data.name));
		 				$("#email").val(decodeURIComponent(data.email));
		 				$("#tel").val(decodeURIComponent(data.tel));
		 				
		 			},
		 			error:function(e){console.log(e)}
		    	})
	            	
	        })
    	 })
	})
</script>