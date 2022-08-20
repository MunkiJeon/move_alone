<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource'/>/css/manager/calculate.css">
<div class="managerWrap">
	<table class="sales">
		<tr>
			<td>매입</td>
			<td>매출</td>
			<td>정산</td>
		</tr>
		<tr>
			<td class="salesMa">${ma }</td>
			<td class="salesPl">${pl }</td>
			<td class="salesRes">${pl-ma }</td>
		</tr>
	</table>
	    <div class="inquire">
            <h3>조회하기</h3>
            <ul class="chk">
                <li class="chkItem">
                    정산 예정일
                </li>
                <li class="chkItem">
                    <input type="date" name="start" id="start">
                </li>
                <li class="chkItem">
                    <input type="date" name="end" id="end">
                </li>    
            </ul>
            <div class="btnBox">
                <button class="submit">검색</button>
                <button type="reset">초기화</button>
            </div>
    </div>
    <div class="result">
        <h3>정산 내역</h3>
        <table>
            <tr>
                <td>상품명</td>
                <td>수량</td>
                <td>단가</td>
                <td>결산액</td>
                <td>결제금액</td>
            </tr>
           	<c:forEach items="${list }" var="dto" >
           	<tr>
            	<td>${dto.po_name }</td>
            	<td>${dto.quantity }</td>
            	<td>${dto.unit_price }</td>
            	<td>${dto.price }</td>
            	<td>${dto.cal_type }</td>
       		</tr>
           	</c:forEach>

        </table>
    </div>
</div>
<script>
	$(function(){
		$(".inquire .submit").click(function(){
            $.ajax({
            	
            	url:"<c:url value='/ajax/CalcDay'/>",
            	type:'POST',
    			data:{start:$("#start").val(),end:$("#end").val(),param:""},
    			async:false,
    			dataType:'json',
    			success:function(data){
    				let str = `
    		            <tr>
                    <td>상품명</td>
                    <td>수량</td>
                    <td>단가</td>
                    <td>결산액</td>
                    <td>결제금액</td>
                </tr>`;
                let res = 0;
                let pl=0;
                let ma=0;
    				for (let i = 0; i < data.length; i++) {
    					str += "<tr>";
    					 
    					let rs = data[i].split(",");
    					for (let j = 0; j < rs.length; j++) {
    					
    	            	str+="<td>"+decodeURIComponent(rs[j])+"</td>"
    	            	if(j==3) res+= rs[j]*1
    					}
    					
    					if(decodeURIComponent(rs[4])=="매출"){
    					pl+= rs[3]*1
    					}else{ma+=rs[3]*1}
    					
    	       			str+="</tr>"
					}
    				$(".managerWrap .result table").html(str);
    				$(".managerWrap .resultMoney .rs span").html(res);
    				$(".managerWrap .salesPl").html(pl*1);
    				$(".managerWrap .salesMa").html(ma*1);
    				$(".managerWrap .salesRes").html(pl*1-ma*1);
    			},
    			error:function(e){console.log(e)}
            })
		})
	})
</script>