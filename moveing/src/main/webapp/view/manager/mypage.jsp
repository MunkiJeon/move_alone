<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String uRl = "employee/employeeMat.jsp";
%>
<style>
*{
	margin:0px;
	padding:0px;
 }
 
 .toggle-switch input{
 	-webkit-appearance:none;
 	-webkit-border-redius:0;
 }
 
 #container{
 	margin-top:50px;
 	display: flex;
 	width:100%;
 	justify-content: center;
 	align-items: center;
 }
 
 .toggle-switch input[type=checkbox]{
 	display: none;
 }
 
 .toggle-track{
 	display: inline-block;
 	position: relative;
 	width:60px;
 	height: 25px;
 	border-radius: 60px;
 	background: #8b8b8b;
 }
 .toggle-track:before{
  content:'';
  display: block;
  position: absolute;
  top: -6px;
  left: -15px;
  width: 27px;
  height: 27px; 
  margin: 5px;
  background: #fff;
  border-radius:100%;
  border:1px solid #8b8b8b;
  transition:left 0.3s;
}
 
 .toggle-switch input[type=checkbox] + label .toggle-track:after{
  content:'OFF';
  display: inline-block;
  position: absolute;
  right: 8px;
  color: #fff;
}
 
 .toggle-switch input[type=checkbox]:checked + label .toggle-track{
  background: #FA9AA6;
}
.toggle-switch input[type=checkbox]:checked + label .toggle-track:before{
  left: 30px;
  border:1px solid #FA9AA6;
}
.toggle-switch input[type=checkbox]:checked + label .toggle-track:after{
  content:'ON';
  left: 5px;
}
 
 .menuI{
 	left:0px;
 	
 	width:100px;
 	height:100%;
 	background:#40699A;
 	position:fixed;
 	z-index: 1;
 	border: 1px solid black;
 	
 }
 .box{
 	left:0px;
 	top:110px;
 	width:100px;
 	height: 300px;
 	background:#40699A;
 	position:fixed;
 	z-index: 2;
 }
 .menuI2{
 	width: 95px;
 	height: 90px;
 	display:inline-block;
 	margin-top: 5px;
 	cursor:pointer;
 }
 
.in{
	display: none;
}
 .header{
 	
 	width:93%;
 	
 	border-bottom: 1px solid black;
 	margin-left: 100px;
 }
 .tableM{
 	/* border:1px solid black; */
 	margin-left:100px;
 	width:93%;
 	
 	
 	}
 hr{
	margin-top: 25px;
	margin-bottom: 25px; 
	width: 100%;
 }
 .mar{
 	 margin-left: 140px;
 	
 	height:80px;
 }
 .mar2{
 	margin-left: 100px
 }
 
 
</style>
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="<c:url value="/ggg/"/>jquery-ui.min.js"></script>
<script type="text/javascript">

$(function () {
	
	let index = 0;
	$(".tableM .section").hide();
	$(".tableM .section").eq(index).show();
	$(".menuI2").click(function() {
		index = $(this).index()

		/* $.ajax({
			url:"<c:url value='/ajax/Love'/>",
			type:"POST",
			data:{index:index},
			async:false,
			dataType:'json',
			success:function(data){
				console.log(data)
				
			},
			error:function(str){
				
			}
		})*/
		
		
		$(".tableM .section").hide();
		$(".tableM .section").eq(index).show();
	})

	$(".menuI>.box>label").each(function () {
		$(this).css({background:"url('../ff/gg"+($(this).index()+1)+".png')",
			backgroundColor:"#40699A",
			"background-size":"100px 100px",
			"background-repeat":"no-repeat",
			"background-position":"center",
			"color":"white"})
	})
	var Values = [];
	$("#chkTog4").click(function() {
		let chk = 0;
		if($(this).is(":checked")){
			chk=1;
		}
		$.ajax({
			url:'<c:url value="/ajax/AjaxOnOff"/>',
			type:"POST",
			data:{bal:chk},
			async:false,
			dataType:'json',
			success:function(data){
				console.log(data)
			},
			error:function(e){
				console.log(e)
			}
		})
	})
	
	$(".selected").click(function() {
	let info = $(this).val();
	let info2 = $(this);
	
		$.ajax({
			url:'<c:url value="/ajax/AjaxSelected"/>',
			type:"POST",
			data:{ino:info},
			async:false,
			dataType:'json',
			success:function(data){
				
				console.log(data.cnt)
				console.log(info2.parent(".btn"))
				if(data.cnt==1){
					
					console.log(data.cnt)
					$("."+info2.attr("data-btn")).remove();
					alert("????????????");
					
				}
				
			},
			error:function(e){
				console.log(e)
			}
		})
	})
	
})


</script>

<!-- <input type="checkbox" id="w1" class="in">
<input type="checkbox" id="w2" class="in">
<input type="checkbox" id="w3" class="in"> -->


<div class="menuI">
	<div id="container">
		<div class="toggle-switch">
			<input type="checkbox" id="chkTog4">
			<label for="chkTog4">
				<span class="toggle-track"></span>
		</label>
	</div>
</div>

		<div class="box">
			<label class="menuI2" id ="w1">??? ??????</label>
			<label class="menuI2" id ="w2">????????????</label>
			<label class="menuI2" id ="w3">????????????</label>
			<label class="menuI2" id ="w4">??????</label>
		</div>
</div>

<div class="mar"><jsp:include page="../inc/staff/top.jsp"/></div>

<table class="tableM">

<tr>
	<td></td>
</tr>
	<tr>
		<td>
			<table class="section">
				<tr>
					<td>
						<h2>?????????</h2>
					</td>
				</tr>
				
				<tr>
					<td>
						<table>
								<tr>
									<td align="center">?????????</td>
								</tr>
								<tr>
									<td align="center"><input class="sss" type="text" name="pid" disabled value="${dtoS.id}" readonly="readonly"/></td>
								</tr>
								<tr>
									<td align="center">????????????</td>
								</tr>
								<tr>
									<td align="center"><input type="password" name="pw" disabled value="${dtoS.pw}"/></td>
								</tr>
								<tr>
									<td align="center">??????</td>
								</tr>
								<tr>
									<td align="center"><input type="text" name="pname" disabled value="${dtoS.name}" readonly="readonly"/></td>
								</tr>
								<tr>
									<td align="center">????????????</td>
								</tr>
								<tr>
									<td align="center"><input type="text" name="number" disabled value="${dtoS.tel}"/></td>
								</tr>
								<tr>
									<td align="center">?????????</td>
								</tr>
								<tr>
									<td align="center"><input type="text" name="mail" disabled value="${dtoS.email}" /></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
					</td>
				</tr>
			</table>
			<table class="section">
				<tr>
					<td><h2>????????????</h2></td>
				</tr>
				
				<tr>
					<td>
						<table border="2">
						
							<tr>
								<td>?????????</td>
								<td>????????????</td>
								<td>?????????</td>
								<td>?????????</td>
								<td>???????????? ???</td>
								
							</tr>
							<tr><td colspan="6"><hr></td></tr>
						
								<c:forEach items="${dto4}" var="dtoaa" varStatus="no">
									
								<tr class="btn${no.index }">
									<td>${dtoaa.user_ID}</td>
									<td>${dtoaa.reservat_date }</td>
									<td>${dtoaa.start_point }</td>
									<td>${dtoaa.end_point }</td>
									<td>${dtoaa.shopping_list }</td>
									<td><button class="selected" value="${dtoaa.res_num }" data-btn="btn${no.index }">??????</button></td>
								</tr>
								</c:forEach>
								
						
						</table>
					</td>
				</tr>
			</table>
			<table class="section">
				<tr>
					<td  class="oo">
						<h1>??????</h1>
					</td>
				</tr>
				<tr>
					<td>
						<table border="2">
							
							<tr>
								<td>?????????</td>
								<td>????????????</td>
								<td>?????????</td>
								<td>?????????</td>
								<td>????????????</td>
								<td>??????</td>
							</tr>
							<tr>
								<td colspan="6"><hr></td>
							</tr>
							
							
							<c:forEach items="${dtoS3}" var="dtoa">
							<tr>
								<td>${dtoa.driver_ID}</td>
								<td>${dtoa.reservat_date}</td>
								<td>${dtoa.start_point}</td>
								<td>${dtoa.end_point}</td>
								<td>${dtoa.shopping_list}</td>
								<td>${dtoa.cost}</td>
							</tr>
							
							
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>			
	<table class="section">
				<tr>
					<td  class="oo">
						<h1>??????</h1>
					</td>
				</tr>
				<tr>
					<td>
						<table border="2">
							<tr>
								<td>?????????</td>
								<td>????????????</td>
								<td>?????????</td>
								<td>?????????</td>
								<td>????????????</td>
								<td>??????</td>
							</tr>
							<tr>
								<td colspan="6"><hr></td>
							</tr>
							<c:forEach items="${dtoS2}" var="dtoa">
							<tr>
								<td>${dtoa.user_ID}</td>
								<td>${dtoa.reservat_date}</td>
								<td>${dtoa.start_point}</td>
								<td>${dtoa.end_point}</td>
								<td>${dtoa.shopping_list}</td>
								<td>${dtoa.cost}</td>
							</tr>
							</c:forEach>
							<tr><td colspan="6">${re }</td></tr>
						</table>
					</td>
				</tr>
			</table>		
		</td>
	</tr>
</table>

<div class="mar2"><jsp:include page="../inc/staff/bottom.jsp"/></div>