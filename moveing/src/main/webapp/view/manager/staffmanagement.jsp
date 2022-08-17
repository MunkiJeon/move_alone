<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<link rel="stylesheet" href="<c:url value='/resource'/>/css/manager/staffmanagement.css">
<style>
.stepsign{position: fixed;bottom: -100vh;left: 50%;transform:translate(-50%,50%) ;width: 600px;background: white;padding: 30px;border-radius: 15px;}
.popupbg{position: fixed;background-color: rgba(0,0, 0, 0.3);width: 100%;height: 100%;display: none;top:0;left:0;}</style>
<div class="popupbg"></div>
<div class="managerWrap">
	<h2>${title } 관리</h2>
    <table  border="" width="100%">
        <tr>
            <td colspan="5" align="center">
                <div id="SearchBox">
                    이름: <input type="text" id="search_title" name="search_name" placeholder="${title }명">
                    아이디: <input type="text"  id="search_id" name="search_id" placeholder="아이디">
                    입사일:<input type="date" id="search_date" name="search_date" placeholder="입사일">
                    <button id="searchBtn">검색</button>    
                </div>
                <button id="addBtn" class="popupbtn">추가</button>
                <button id="editBtn" class="popupbtnModify">수정</button>
                <button id="deleteBtn">삭제</button>
            </td>
        </tr>
        <tr align="center">
            <td><input type="checkbox" id="allCheck"></td>
            <td>이름</td>
            <td>아이디</td>
            <td>입사일</td>
            <td>실적보기</td>
        </tr>
<c:forEach items="${mainData }" var="dto" varStatus="no">
<%-- 	<c:if test="${dto.leval }"></c:if> --%>
        <tr class="idchktr" align="center"> <!-- 모양  -->
            <td><input type="checkbox" id="allCheck${no.index }" class="dataChk" value="${dto.id }"></td>
            <td>${dto.name }</td>
            <td>${dto.id }</td>
            <td>${dto.join_date }</td>
            <td><a href="">보기</a></td>
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
	            <td>아이디</td>
	            <td><input type="text" id="id"/></td>
	        </tr>
	        <tr>
	            <td>비번</td>
	            <td><input type="text" id="pw"/></td>
	        </tr>
	        <tr>
	            <td>전화번호</td>
	            <td><input type="text" id="tel"/></td>
	        </tr>
	        <tr>
	            <td>이름</td>
	            <td><input type="text" id="name"/></td>
	        </tr>
	        <tr>
	            <td>이메일</td>
	            <td><input type="text" id="email"/></td>
	        </tr>
	        <!--tr>
	            <td>주민등록번호</td>
	            <td><input type="text" name=""/></td>
	        </tr>
	        <tr>
	            <td>증명사진</td>
	            <td><input type="file"/></td>
	        </tr>
	        <tr>
	            <td>운전면허사진</td>
	            <td><input type="file"/></td>
	        </tr-->
	        <tr>
	            <td colspan="2"><button type="submit">등록</button></td>
	        </tr>
	    </table>
    </form>
</div>

<script>
	$(function(){
		let level = "${level}";
		let add = false;
		let modify = false;
        $(".popupbtn").click(function(e){
            e.preventDefault();

            $(".popupbg").fadeIn(500);
            $(".stepsign").stop().animate({bottom:"50%"},500)
            
            
			$("#id").val("");
			$("#pw").val("");
			$("#name").val("");
			$("#email").val("");
			$("#tel").val("");
			add = true;
            if(add){
	            $(".stepsign").submit(function(e){
	                e.preventDefault();
					$.ajax({
			          	url:"<c:url value='/ajax/Add'/>",
			          	type:'POST',
			  			data:{id:$("#id").val(),pw:$("#pw").val(),name:$("#name").val(),email:$("#email").val(),tel:$("#tel").val(),level:level},
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
	            
	        if(modify){    
		        $(".stepsign").submit(function(e){
	                e.preventDefault();
			
		            	
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