<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
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

  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/leftSidebar.jsp" /><!-- sidebar -> leftSidebar로 변경 -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-7 text-right">
	     			<form class="form-inline" action="<c:url value='/ADMIN/MENU/Edit.do' />" 
	     				method="post" enctype="multipart/form-data">
			     		<table class="table table-bordered text-left">
			     			<tr>
			     				<td class="col">메뉴 이름</td>
			     				<td><input class="form-control" type="text" name="menu_name" value="${menuDto.menu_name }"></td>
			     			</tr>
			     			<tr>
			     				<td class="col">카테고리</td>
			     				<td>
				     				<select name="category_name" class="form-control">
				     					<option value="menu">메뉴</option>
				     					<option value="hamburger" <c:if test="${fn:indexOf(menuDto.category_name, 'ham') != -1 }">selected</c:if>>햄버거</option>
				     					<option value="side" <c:if test="${fn:indexOf(menuDto.category_name, 'side') != -1 }">selected</c:if>>사이드</option>
				     					<option value="drink" <c:if test="${fn:indexOf(menuDto.category_name, 'dri') != -1 }">selected</c:if>>드링크</option>
				     				</select>
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">가&nbsp;&nbsp;&nbsp;격</td>
			     				<td>
			     					<input class="form-control" type="text" name="menu_price" value="${menuDto.menu_price }">
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">중&nbsp;&nbsp;&nbsp;량</td>
			     				<td>
			     					<input class="form-control" type="text" name="menu_weight" value="${menuDto.menu_weight }">
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">열&nbsp;&nbsp;&nbsp;량</td>
			     				<td>
			     					<input class="form-control" type="text" name="menu_calrorie" value="${menuDto.menu_calrorie }">
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">단&nbsp;백&nbsp;질</td>
			     				<td>
			     					<input class="form-control" type="text" name="menu_protein" value="${menuDto.menu_protein }">
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">나&nbsp;트&nbsp;륨</td>
			     				<td>
			     					<input class="form-control" type="text" name="menu_sodium" value="${menuDto.menu_sodium }">
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">당&nbsp;&nbsp;&nbsp;류</td>
			     				<td>
			     					<input class="form-control" type="text" name="menu_sugars" value="${menuDto.menu_sugars }">
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">포&nbsp;화&nbsp;지&nbsp;방</td>
			     				<td>
			     					<input class="form-control" type="text" name="menu_fat" value="${menuDto.menu_fat }">
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">판매종료일</td>
			     				<td>
			     					<input class="form-control" type="text" name="menu_enddate" value="${menuDto.menu_enddate }"/>
			     					<!-- bootstrap으로 인해 datepicker가 충돌하는거 같네요~ 추후 방법을 찾아서 적용하겠슴돠 -->
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">메뉴 이미지</td>
			     				<td>
			     					<input class="form-control" type="file"  name="menu_image" id="menu_image"/><h1></h1>
			     					<img src="https://s3.ap-northeast-2.amazonaws.com/bkprojserver/${menuDto.menu_name }${menuDto.menu_file_extension }" id="menu_image_thumbnail" alt="img_thumbnail" style="width:300px;height:300px;"/>
			     				</td>
			     			</tr>
			     		</table>
			     		<input type="hidden" name="menu_no" value="${menuDto.menu_no }"/>
			     		<input class="btn btn-primary" type="submit" value="수정" onclick="return isAdd()">
			     		<a href="<c:url value='/ADMIN/MENU/All.do' />" class="btn btn-primary">취소</a>
		     		</form>
	     		</div>
	     	</div>
        </div>
        
      </div>
    </div>
  </body>
</html>