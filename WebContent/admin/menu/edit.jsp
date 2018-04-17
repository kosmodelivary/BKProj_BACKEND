<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<!-- *********************************************************** HEAD *********************************************************** -->
<head>
<!-- ******************************************* -->	  
<c:import url="/admin/include/loginCheck.jsp" />
<c:import url="/admin/include/head.jsp" />
<!-- ******************************************* -->  
  	<style type="text/css">
  		td {
  			top: 50%;
  		}
  		
  		.col {
  			text-align: center;
  			width:20%;
  		}
  		
  		.form-control {
  			width:auto;
  		}
		/* {} is the value according to your need */
  	</style>
  	<script type="text/javascript">
		var isAdd = function() {
			
			if (confirm('정말 수정하시겠습니까?') == true) {
				alert('수정합니다.');
				return true;
			} else {
				alert('수정하지 않습니다.');
				return false;
			}
		};
  	</script>
  	<script type="text/javascript">
  		var sel_file;
  		
  		$(document).ready(function(){
  			$('#menu_image').on("change",handleImgSel);
  		});
  		
  		function handleImgSel(e){
  			var files = e.target.files;
  			var filesArr = Array.prototype.slice.call(files);
  			filesArr.forEach(function(f){
  				if(!f.type.match("image.*")){
  					alert('메뉴 이미지 파일만 업로드 가능합니다.');
  					return;
  				}
  				
  				sel_file = f;
  				
  				var reader = new FileReader();
  				reader.onload = function(e){
  					$('#menu_image_thumbnail').attr("src",e.target.result).css("visibility","visible");
  				}
  				reader.readAsDataURL(f);
  			});
  		}
  	
  	</script>
</head>
<!-- *********************************************************** HEAD *********************************************************** -->
<!-- *********************************************************** BODY *********************************************************** -->
<body>
<section id="container" >
<!-- ******************************************* -->	  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* --> 
<section id="main-content">

	<section class="wrapper">       
            
	<div class="row" style="max-width:100%; max-height:100%; padding:70px 0px 0px 30px;">
		<!-- Table 칼럼 -->	
		<div class="col-lg-12">
		
            <div class="panel panel-default">
                <div class="panel-heading" style="vertical-align:middle;">
					<font size="5pt" color="gray">&nbsp;&nbsp;${menuDto.category_name }</font>
				</div>
				
						
                <div class="panel-body" align="center">
                				     			
			     <form action="<c:url value='/ADMIN/MENU/Edit.do' />" 
			     	   method="post" enctype="multipart/form-data">
				 
				 <table class="table table-bordered">
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="메뉴 이름" width="40" src="${pageContext.request.contextPath}/Images/name.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;메뉴 이름</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input class="form-control" type="text" name="menu_name" value="${menuDto.menu_name}">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="분류" width="40" src="${pageContext.request.contextPath}/Images/category.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;메뉴 분류</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<select name="category_name" class="form-control">
			     					<option value="menu">메뉴</option>
		     					<option value="hamburger" <c:if test="${fn:indexOf(menuDto.category_name, 'ham') != -1 }">selected</c:if>>햄버거</option>
		     					<option value="side" <c:if test="${fn:indexOf(menuDto.category_name, 'side') != -1 }">selected</c:if>>사이드</option>
		     					<option value="drink" <c:if test="${fn:indexOf(menuDto.category_name, 'dri') != -1 }">selected</c:if>>드링크</option>
		     					<option value="set" <c:if test="${fn:indexOf(menuDto.category_name, 'se') != -1 }">selected</c:if>>세트</option>
			     				</select>
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="가격" width="40" src="${pageContext.request.contextPath}/Images/money.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;메뉴 가격</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input class="form-control" type="text" name="menu_price" value="${menuDto.menu_price }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="중량" width="40" src="${pageContext.request.contextPath}/Images/check.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;중&nbsp;량</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input class="form-control" type="text" name="menu_weight" value="${menuDto.menu_weight }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="열량" width="40" src="${pageContext.request.contextPath}/Images/check.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;열&nbsp;량</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input class="form-control" type="text" name="menu_calrorie"  value="${menuDto.menu_calrorie }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="단백질" width="40" src="${pageContext.request.contextPath}/Images/check.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;단&nbsp;백&nbsp;질</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input class="form-control" type="text" name="menu_protein" value="${menuDto.menu_protein }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="나트륨" width="40" src="${pageContext.request.contextPath}/Images/check.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;나&nbsp;트&nbsp;륨</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input class="form-control" type="text" name="menu_sodium" value="${menuDto.menu_sodium }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="당류" width="40" src="${pageContext.request.contextPath}/Images/check.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;당&nbsp;류</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input class="form-control" type="text" name="menu_sugars"  value="${menuDto.menu_sugars }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="포화지방" width="40" src="${pageContext.request.contextPath}/Images/check.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;포화&nbsp;지방</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input class="form-control" type="text" name="menu_fat" value="${menuDto.menu_fat }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="판매종료일" width="40" src="${pageContext.request.contextPath}/Images/date.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;판매 종료일</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input id="date" class="form-control" type="text" name="menu_enddate" value="${menuDto.menu_enddate }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="메뉴 이미지" width="40" src="${pageContext.request.contextPath}/Images/image.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;메뉴 이미지</font>
	     				</td>
	     				<td class="text-left" style="padding:40px 20px 0px 20px;">
 							<font size="4em">
  								<input class="form-control" type="file" name="menu_image" id="menu_image"/><h1></h1>
					     		<img src="http://restapi.fs.ncloud.com/bkproject/image/menu/${menuDto.menu_name }${menuDto.menu_file_extension }" 
					     		     id="menu_image_thumbnail" alt="${menuDto.menu_name }이미지" style="width:300px;height:300px;"/>
 							</font>
 						</td>
	     			</tr>
	     			
	     		</table>
	     		
	     		<span style="float:right">
					<input type="hidden" name="menu_no" value="${menuDto.menu_no }"/>
		     		<input class="btn btn-default" type="submit" value="수정" onclick="return isAdd()">
		     		<a href="<c:url value='/ADMIN/MENU/All.do' />" class="btn btn-default">취소</a>
	  			</span>	 
     		</form>
			</div>
			</div>
			</div>
		 <!--common script for all pages-->
   		 <script src="${pageContext.request.contextPath}/bootstrap/js/common-scripts.js"></script>
   		 <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css"/>
	  	 <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.1/combined/js/gijgo.min.js" type="text/javascript"></script>
	  	 <script src="${pageContext.request.contextPath }/bootstrap/js/messages.ko-kr.js" type="text/javascript"></script>
	  	 <script>
	  		 $('#date').datepicker({
	  			 uiLibrary:'bootstrap',
	  			 locale:'ko-kr',
	  			 format:'yyyy-mm-dd',
	  			 minDate: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate())
	  		 });	
	  	 </script>
	   	</div>	
	</section>
	</section>
	</section>
  </body>
</html>