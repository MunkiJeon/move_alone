<%@page import="com.map.model.CategoryBean"%>
<%@page import="com.map.model.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> list = cdao.getAllCategory();
%>

<style type="text/css">
	.categoryManage{
		width : 400px;
		margin : auto;
		text-align: center;
	}
	
	.categoryManage td {
		text-align: left;
	}
	
	.categoryManage > caption{
		font-size: 19px;
	}
	
	.categoryManage a:hover{
		color : #C2674B;
	}
	
	.updateCateTd td{
		text-align: right;
	}
	
	.updateCateTd table{
		margin : auto;
	}
	
	.updateCateTd form{
		margin : auto;
	}
</style>

<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$('#showForm').live("click", function(){
			$(this).parent().parent().next().toggle();
			$(this).parent().parent().next().find('input[type="text"]').val("");
			$(this).parent().parent().next().find('input[type="text"]').focus();
		});
		
		$('#cancel').live("click", function(){
			$(this).parents('.updateCateTd').toggle(); //가장 먼저 찾아진 것 1곳에만 작용함
			/* $(this).parent().parent().next().find('input[type="text"]').val("");
			$(this).parent().parent().next().find('input[type="text"]').focus(); */
		});
	});
	
	function insertSmallCategory(lno){
		var scname = window.prompt("추가할 소분류를 입력하세요", "");
		
		if(scname == ""){
			insertSmallCategory(lno);
		}
		else if(scname != null){
			document.insertSCateform.lno.value = lno;
			document.insertSCateform.scname.value = scname;
			document.insertSCateform.submit();
			
/* 			location.href="insertSCategory.jsp?lno=" + lno + "&scname=" + scname;
 */		}
	}
	
	function insertLargeCategory(){
		var lcname = window.prompt("추가할 대분류를 입력하세요", "");
		
		if(lcname == ""){
			insertSmallCategory();
		}
		else if(lcname != null){
			document.insertLCateform.lcname.value = lcname;
			document.insertLCateform.submit();
		}
	}
	
	function checkLCname(i){
		var temp = "input[name='lcname" + i +"']";	
		if($(temp).val() == ""){
			alert("대분류명을 입력해야 합니다.");			
			return false;
		}
	}
	
	function checkSCname(i){
		var temp = "input[name='scname" + i +"']";
		if($(temp).val() == ""){
			alert("소분류명을 입력해야 합니다.");			
			return false;
		}
	}
	
	
</script>

<!-- 눈에는 보여지지 않는 form -->
<form name="insertSCateform" action="InsertSCategory">
	<input type=hidden name="lno" value="">
	<input type=hidden name="scname" value="">
</form>

<form name="insertLCateform" action="InsertLCategory">
	<input type=hidden name="lcname" value="">
</form>

<table class="categoryManage">
			<caption>
				<strong>카테고리 관리</strong>
				<hr>
			</caption>
	<%
	String beforeLname = "";
	
	for(int i = 0; i< list.size();i++){
		CategoryBean cbean = list.get(i);%>
		<%
		if(beforeLname.equals(cbean.getLname()) == false && cbean.getLno() != -1){
			
		%>
			<tr class="lcategory">
				<td style="color:green;"><b><%=cbean.getLname()%></b></td>
				<td><a href="#" id="showForm">수정</a></td>
				<td><a href="DeleteLCategory?lno=<%=cbean.getLno()%>&lstep=<%=cbean.getLstep()%>">삭제</a></td>
				<td><a href="javascript:insertSmallCategory(<%=cbean.getLno()%>)" id="showInsertSForm">+</a></td>
				<td><a href="LargeCategoryUp?lno=<%=cbean.getLno()%>&lstep=<%=cbean.getLstep()%>">▲</a> | <a href="LargeCategoryDown?lno=<%=cbean.getLno()%>&lstep=<%=cbean.getLstep()%>">▼</a></td>
			</tr>
			<tr class="updateCateTd" style="display: none;">
				<td colspan="5"> 
					<form action="UpdateLCategoryName">
						<table>
							<tr>
								<td>대분류명 : </td>
								<td>
									<input type="text" name="lcname<%=i%>" value="">
									<input type="hidden" name="i" value="<%=i%>">
									<input type="hidden" name="lno" value="<%=cbean.getLno()%>">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="수정" onClick="return checkLCname(<%=i%>)">
									<input type="button" value="취소" id="cancel">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		<%
		}%>
		
		<%
		if(cbean.getSname() != null){%>
			<tr class="scategory">
				<td>
					<!-- ./images/level.gif --><img src="" width="10" height="15">-<%=cbean.getSname()%>
				</td>
				<td><a href="#" id="showForm">수정</a></td>
				<td><a href="DeleteSCategory?sno=<%=cbean.getSno()%>&sstep=<%=cbean.getSstep()%>">삭제</a></td>
				<td></td>
				<td><a href="SmallCategoryUp?lno=<%=cbean.getLno()%>&sno=<%=cbean.getSno()%>&sstep=<%=cbean.getSstep()%>">△</a> | <a href="SmallCategoryDown?lno=<%=cbean.getLno()%>&sno=<%=cbean.getSno()%>&sstep=<%=cbean.getSstep()%>">▽</a></td>
			</tr>
			<tr class="updateCateTd" style="display: none;">
				<td colspan="5"> 
					<form action="UpdateSCategoryName">
						<table>
							<tr>
								<td>소분류명 : </td>
								<td>
									<input type="text" name="scname<%=i%>" value="">
									<input type="hidden" name="i" value="<%=i%>">
									<input type="hidden" name="sno" value="<%=cbean.getSno()%>">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="수정" onClick="return checkSCname(<%=i%>)">
									<input type="button" value="취소" id="cancel">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		<%
		}%>
		<%
		beforeLname = cbean.getLname();
	}
	%>
	<tr>
		<td>
		</td>
		<td colspan="2">
			<a href="javascript:insertLargeCategory()">+ 대분류 추가</a>
		</td>
		<td >
		</td>
		<td >	
		</td>
	</tr>
</table>