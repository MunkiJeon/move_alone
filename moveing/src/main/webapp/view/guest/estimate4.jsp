<%@page import="com.map.model.StockDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resource/css/guest/calc.css'/>">
<script src="<c:url value='/resource/js/estimate.js'/>"></script>
<style type="text/css">
	html{scroll-behavior: smooth;}
	body {
		font-family: Noto Sans Kr;
		font-size: 13px;
	}
	
	#mainList {
		margin: auto;
		margin-top : 50px;
		text-align: center;
		width: 750px;
	}
	
	#mainListInside td {
		padding-left: 10px;
		padding-right: 10px;
	}
	
	#mainListInside h3 {
		padding-top: 10px;
		padding-bottom: 10px; font-size : 13px;
		word-spacing: -1px;
		color: #000;
		border-bottom: 1px solid #D5D5D5;
		font-size: 13px
	}
	
	#mainListInside td>span {
		color: #555555;
		font-size: 12px;
	}
	
	#banner_imageTable {
		width :1550;
		height : 700;
		margin: auto;
	}
	.catagoreHeader {
	position: sticky;
	top:100px;
	max-width: 1440px;
	margin:0 auto;
	display: flex;
	
	}
	.catagoreHeader li{
		width:100%;
		border:1px solid #eee;
		height: 100px;
		line-height: 100px;
		text-align: center;
	}
	.mainList {
		max-width:1440px;
		margin: 0 auto;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$('#banner_image').show();
		/* $('#banner_image').hide();
		$('#banner_image').fadeIn(3000);
		setInterval(function(){
			$('#banner_image').hide();
			$('#banner_image').fadeIn(3000);
		}, 5000); */
	});

	$(function(){
		let cnt = 0;
		let arr = []
		for(let i=0;i<$(".lnameList").length;i++){
			if($(".lnameList").eq(i).attr("data-lname")==$(".lnameList").eq(i+1).attr("data-lname")){
				arr[cnt] = i;
				cnt++;
			}			
		}
		console.log(arr)
		for(let i=(arr.length-1);i>=0;i--){
			$(".lnameList").eq(arr[i]+1).remove();
		}
		
		for(let i=0;i<$(".catagoreHeaderItem").length;i++){
			for(let j=0;j<$(".lnameList").length;j++){
				
				if($(".catagoreHeaderItem").eq(i).attr("data-lname")==$(".lnameList").eq(j).attr("data-lname")){
					$(".lnameList").eq(j).attr("id",$(".catagoreHeaderItem").eq(i).attr("href").substring(1));
				}
				
			}
		}
	})
</script>



<table id="banner_imageTable">
	<tr>
		<td>
			<img id="banner_image" width=100% height="700" title="" rel="79-10" src="<c:url value='/resource/image/'/>gg1.png" style="display: none">
		</td>
	</tr>
	<tr>
		<td><br><br></td>
	</tr>
	<tr>
		<td align="center">
			<!-- <img width="570" height="160" src="../images/secondImage.PNG"> -->
		</td>
	</tr>
</table>
<ul class="catagoreHeader">
	<c:forEach var="cbean" items="${lcalist }">
	<c:if test="${cbean.lno != -1 }">
		<li><a class="catagoreHeaderItem" href="#test${cbean.lstep }" data-lno="${cbean.lno }" data-lname="${cbean.lname }" >${cbean.lname }</a></li>
	</c:if>
	</c:forEach>
</ul> 
<section class="shopping">
	<form action="Estimate?num=Res" method="post">
		<ul class="mainList">
            <li><h2> 추가 선택 항목(쇼핑) </h2><p class="itamnum" style="display: none">${list.size() }</p></li>
<c:forEach items="${list }" var="pbean" varStatus="no">
            	
				<li><h3  class="lnameList" data-lname="${pbean.lcname }">${pbean.lcname }</h3></li>
            <li class="itam_${no.index }">
				
            	<table id="mainListInside">
						<tr>
							<td><img src="<c:url value='/resource/productImg/'/>${ pbean.mainImgN}" width="300px" height="380px"></td>
							<td width="300px" class="item">
								<h3 class="pname">${ pbean.name}</h3>
								
								<p>${ pbean.info}</p>
 							<%--<p style="text-decoration:line-through;">${ pbean.oriprice}원</> --%>
								<p>${ pbean.discprice}원</p>
								<input type="number" class="discprice" value="${ pbean.discprice}" style="display: none">
								<p>수량선택</p>
								<div>
								<p>
									<input type="checkbox" class="Box_L" name="option${no.index }"/>대
									<button type="button" class="plus_L">[ + ]</button>
									<input type="number" class="numBox_L" min="1" max="999" size="10" value="0" readonly="readonly" style="width: 40px; text-align:right;" >
									<button type="button" class="minus_L">[ - ]</button>
								</p>
								<p>
									<input type="checkbox" class="Box_M" name="option${no.index }"/>중
									<button type="button" class="plus_M">[ + ]</button>
									<input type="number" class="numBox_M" min="1" max="999" size="10" value="0" readonly="readonly" style="width: 40px; text-align:right;" >
									<button type="button" class="minus_M">[ - ]</button>
								</p>
								<p>
									<input type="checkbox" class="Box_S" name="option${no.index }"/>소
									<button type="button" class="plus_S">[ + ]</button>
									<input type="number" class="numBox_S" min="1" max="999" size="10" value="0" readonly="readonly" style="width: 40px; text-align:right;" >
									<button type="button" class="minus_S">[ - ]</button>
								</p>
								</div>
								<%-- <div>
										<select style="width : 100%; height: 25px" id="optionSelect">
											<option value="">옵션선택</option>
											<%
											StockDao sdao = StockDao.getInstance();
											ArrayList<StockBean> slist = sdao.getAllStockByPno(pno);
											
											for(StockBean sbean : slist){%>
												<option value="<%=sbean.getOpname()%>" <%if(sbean.getCount() == 0){%> disabled <%} %>>
													<%=sbean.getOpname()%> 
													<%
														for(int i = 0; i<30 ;i++){%>
															&nbsp;		
														<%}
													
														if(sbean.getCount() == 0){
														%>
														(품절)
														<%		
														}
														else{%>
														(<%=sbean.getCount()%>개 남음)
														
														<%	
														}
													%>									
												 </option>
											<%
											}
											%>
										</select>
								</div> --%>
							</td>
						</tr>
				</table>
            </li>
</c:forEach>
			<li>
				<input type="hidden" name="item" id="item">
				<input type="hidden" name="price" id="price">

		        <button type="button" class="test">테스트</button>
                <button type="submit" class="detailNext">다음</button>
                
			</li>
        </ul>
	</form>
</section>
<!-- 해야할것?: 각항목별 박스 수량 만틐 곱한 값  -->
<%-- <table id="mainList">
	
	<c:forEach items="${list }" var="pbean" varStatus="no">
			<tr>
				<td>
					<table id="mainListInside">
						<tr>
							<td><img src="<c:url value='/resource/image/'/>${ pbean.mainImgN}" width="300px" height="380px"></td>
							<td width="300px">
								<h3>${ pbean.name}</h3>
								<p>${ pbean.info}</p>
 							<p style="text-decoration:line-through;">${ pbean.oriprice}원</>
								<p>${ pbean.discprice}원</p>
								<p>수량선택</p>
								<div>
								<p>
									<input type="checkbox" name="option${no.index }"/>대
									<button type="button" class="plus">[ + ]</button>
									<input type="number" class="numBox" min="1" max="999" size="10" value="0" readonly="readonly" style="width: 40px; text-align:right;" >
									<button type="button" class="minus">[ - ]</button>
								</p>
								<p>
									<input type="checkbox" name="option${no.index }"/>중
									<button type="button" class="plus">[ + ]</button>
									<input type="number" class="numBox" min="1" max="999" size="10" value="0" readonly="readonly" style="width: 40px; text-align:right;" >
									<button type="button" class="minus">[ - ]</button>
								</p>
								<p>
									<input type="checkbox" name="option${no.index }"/>소
									<button type="button" class="plus">[ + ]</button>
									<input type="number" class="numBox" min="1" max="999" size="10" value="0" readonly="readonly" style="width: 40px; text-align:right;" >
									<button type="button" class="minus">[ - ]</button>
								</p>
								</div>
								
							</td>
						</tr>
					</table>
				</td>
			</tr>			
	</c:forEach>
	
</table> --%>

<script>
	$(function(){
	$(".plus_L").click(function() {
		var num = $(this).siblings(".numBox_L").val();
		var plusNum = Number(num) + 1;
		$(this).siblings(".numBox_L").val(plusNum);
	});
	$(".plus_M").click(function() {
		var num = $(this).siblings(".numBox_M").val();
		var plusNum = Number(num) + 1;
		$(this).siblings(".numBox_M").val(plusNum);
	});
	$(".plus_S").click(function() {
		var num = $(this).siblings(".numBox_S").val();
		var plusNum = Number(num) + 1;
		$(this).siblings(".numBox_S").val(plusNum);
	});

	$(".minus_L").click(function() {
		var num = $(this).siblings(".numBox_L").val();
		var minusNum = Number(num) - 1;
		
		if(minusNum < 0) {
			$(this).siblings(".numBox_L").val(num);
		} 
		else {
			$(this).siblings(".numBox_L").val(minusNum);          
		}
	});
	$(".minus_M").click(function() {
		var num = $(this).siblings(".numBox_M").val();
		var minusNum = Number(num) - 1;
		
		if(minusNum < 0) {
			$(this).siblings(".numBox_M").val(num);
		} 
		else {
			$(this).siblings(".numBox_M").val(minusNum);          
		}
	});
	$(".minus_S").click(function() {
		var num = $(this).siblings(".numBox_S").val();
		var minusNum = Number(num) - 1;
		
		if(minusNum < 0) {
			$(this).siblings(".numBox_S").val(num);
		} 
		else {
			$(this).siblings(".numBox_S").val(minusNum);          
		}
	});
	})
	
</script>