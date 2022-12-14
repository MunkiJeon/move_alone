<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script type="text/javascript">
	var opcount = 1; // 전달할 추가한 옵션의 개수(최소는 1개)
	var opArr = [];
	opArr.push(1);
	
	$(document).ready(function(){
		$("select[name='selLargeCategory']").change(function(){
			var choicedNo = $(this).val(); // 선택된 것의 lno 값
		
			$.ajax({
				url : "<c:url value='/ajax/ReturnSCategory'/>",
				dataType : "json",
				data :{
					lno : choicedNo
				},
				success : function(responseData){		
					
					var len =Object.keys(responseData.ITEMS).length;
					var temp = "<option value='-1'>소분류 생략</option>";
					console.log(len)
					for(i = 0; i < len ; i++){
						temp += "<option value=" + JSON.stringify(decodeURIComponent(responseData.ITEMS[i].sno)) + ">" + (JSON.stringify(decodeURIComponent(responseData.ITEMS[i].sname))).replace(/"/g,"") + "</option>"			
					}
					if(len == 0){
						$("select[name='selSmallCategory']").html("<option value='-1'>소분류가 존재하지 않습니다</option>");
						//$("select[name='selSmallCategory']").parent().parent().hide();
					}else{
						$("select[name='selSmallCategory']").parent().parent().show();
						$("select[name='selSmallCategory']").html(temp);
					}
				}
			});
		});
		
		$('#optionAdd').on("click", function(){
			$(this).parent().append("<span><input type='text' value='' size='5' name='opn_" + (++opcount) + "'> <input type='text' value='' size='5' name='stock_" + opcount +"'> <input type='button' value='-' class='deleteopt'> <br></span>");
			opArr.push(opcount);
		});
		
		
		$('.deleteopt').on("click", function(){
			//name속성 뒤에 붙은 값을 분리해서 이걸 배열에서 제거하자.
			var temp = $(this).prev().attr("name"); // stock_2
			var tempArr = temp.split('_');
			//alert(tempArr[1] + "삭제");
			for(var i = 0; i < opArr.length; i++) {
				  if(opArr[i] == tempArr[1])  {
					  opArr.splice(i, 1);
				    i--;
				    break;
				  }
			}
			//alert(opArr);
			//alert($(this).parent().prev().children().attr("name"));
			
			$(this).parent().remove();
		});
	});
	
	function check(){
		if($("select[name='selLargeCategory']").val() == "선택안함"){
			alert("대분류를 선택해주세요");
			return false;
		}
		
		if($("input[name='name']").val() == ""){
			alert("상품명을 입력해주세요");
			return false;
		}
		
		if($("input[name='oriprice']").val() == ""){
			alert("도매가를 입력해주세요");
			return false;
		}
		
		if($("input[name='discprice']").val() == ""){
			alert("상품가격을 입력해주세요");
			return false;
		}
		

		
		if(isNaN($("input[name='stock_1']").val())){
			alert("재고는 숫자만 입력 가능합니다.");
			return false;
		}
		
		//alert(opcount);
		var temp = "";
		
		for(var i = 0; i < opArr.length; i++){
			temp += opArr[i] + ",";
		}
		document.f.opnums.value = temp;
		//alert(temp);
		//alert(document.f.opnums.value);
		//return false;
		
		//null로 보내면 안되므로
		//alert($("select[name='selSmallCategory']").val());
		
		
		 for(var i = 0; i<opArr.length; i++){
			if($("input[name='opn_"+ opArr[i] +"']").val() == ""){
				alert("빈칸없이 옵션명을 입력해야 합니다.");
				$("input[name='opn_"+ opArr[i] +"']").focus();
				return false;
			}
			
			if($("input[name='stock_"+ opArr[i] +"']").val() == ""){
				alert("빈칸없이 재고수량을 입력해야 합니다.");
				$("input[name='stock_"+ opArr[i] +"']").focus();
				return false;	
			}
			
			if(isNaN($("input[name='stock_"+ opArr[i] +"']").val())){
				alert("재고수량은 숫자만 입력가능합니다.");
				$("input[name='stock_"+ opArr[i] +"']").focus().select();
				return false;
			}
		 }
		
		
		
		document.f.submit();
	}
</script>
 
<style type="text/css">
	#producRegister{
		margin : auto;
		/* border : 1px solid black; */
	}
	
	#producRegister > caption{
		font-size: 19px;
	}
	
	#t2{
		width : 250px;
	}
	textarea{
		resize: none; 
		width: 100%; 
		height:70px;
	}
</style>

<form name="f" action="<c:url value='/manager/ProductInsertProc'/>" method="post" enctype="multipart/form-data">
	<table id="producRegister">
		<caption>
				<strong>상품등록</strong>
				<hr>
		</caption>
		<tr>
		 	<td>대분류</td>
		 	<td>
		 		<select name="selLargeCategory">
		 			<option value="선택안함" selected>선택안함</option>
		 			<c:forEach var="cbean" items="${list}">
		 			<c:if test="${cbean.lno != -1 }">
		 				<option value="${cbean.lno}">${ cbean.lname}</option>
		 			</c:if>
		 			</c:forEach>
		 		</select>	 	
		 	</td>
		 <tr>
		 <tr>
		 	<td>소분류</td>
		 	<td>
		 		<select name="selSmallCategory">
		 			<option value="선택안함">대분류를 먼저 선택해주세요</option>
		 		</select>	 	
		 	</td>
		 <tr>
		 <tr>
		 	<td>이름</td>
		 	<td><input type="text" name="name" value=""></td>
		 </tr>
		 <tr>
		 	<td>도매가격</td>
		 	<td><input type="text" name="oriprice" value=""></td>
		 </tr>
		 <tr>
		 	<td>상품가격</td>
		 	<td><input type="text" name="discprice" value=""></td>
		 </tr>
		 <tr>
		 	<td>상품설명</td>
		 	<td>
		 		<textarea name="info">
		 		</textarea>
			</td>
		 </tr>
		 <tr>
		 	<td>상품이미지</td>
		 	<td><input type="file" name="mainImg"></td>
		 </tr>
		 
		  <tr>
		 	<td colspan="2"><hr></td>
		 </tr>
		 
		 <tr border="1">
		 	<td>
		 	옵션/재고
		 	</td>
		 	<td> 
				<input type="button" value="추가" id="optionAdd"><br><br>
				<span><!-- <input type='text' value='S' size='5' placeholder='사이즈 등' name="opn_1">  -->
				<input type='text' value='10' size='5' placeholder='재고수량' name="stock_1"><br></span>	
		 	</td>
		 <tr>
		 <tr>
		 	<td colspan="2" align="center">
		 		<input type="hidden" value="" name="opnums">
		 		<input type="button" value="상품등록" onClick="check()">
		 		<input type="button" value="취소" onClick="location.href='ProductList'">
		 	</td>
		 </tr>
	</table>
</form>
 

