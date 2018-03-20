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
			
			if (confirm('정말 추가하시겠습니까?') == true) {
				alert('추가합니다.');
				return true;
			} else {
				alert('추가하지 않습니다.');
				return false;
			}
		};
  	</script>
  </head>

  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/sidebar.jsp" />

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-7 text-right">
	     			<form class="form-inline" action="<c:url value='/ADMIN/MENU/Add.do' />" method="post">
			     		<table class="table table-bordered text-left">
			     			<tr>
			     				<td class="col" rowspan="10">
			     					<img src="https://s3.ap-northeast-2.amazonaws.com/bkprojserver/${menuDto.menu_name }.png" alt="${menuDto.menu_name }이미지"/>
			     				</td>
			     				<th class="col">메&nbsp;뉴&nbsp;이&nbsp;름</th>
			     				<td style="width:30%">
			     					${menuDto.menu_name }
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">카&nbsp;테&nbsp;고&nbsp;리</th>
			     				<td>
			     					<c:choose>
				     					<c:when test="${fn:indexOf(menuDto.category_name,'ham') ne -1 }">
					     					햄버거
					     				</c:when>
					     				<c:when test="${fn:indexOf(menuDto.category_name, 'si') ne -1 }">
					     					사이드
					     				</c:when>
					     				<c:otherwise>
					     					드링크
					     				</c:otherwise>
				     				</c:choose>
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격</th>
			     				<td >
			     					${menuDto.menu_price } (원)
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량</th>
			     				<td>
			     					${menuDto.menu_weight } (g)
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">열&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량</th>
			     				<td>
			     					${menuDto.menu_calrorie } (kcal)
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">단&nbsp;&nbsp;&nbsp;백&nbsp;&nbsp;&nbsp;질</th>
			     				<td>
			     					${menuDto.menu_protein } (g)
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">나&nbsp;&nbsp;&nbsp;트&nbsp;&nbsp;&nbsp;륨</th>
			     				<td>
			     					${menuDto.menu_sodium } (mg)
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">당&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</th>
			     				<td>
			     					${menuDto.menu_sugars } (g)
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">포&nbsp;화&nbsp;지&nbsp;방</th>
			     				<td>
			     					${menuDto.menu_fat } (g)
			     				</td>
			     			</tr>
			     			<tr>
			     				<th class="col">판매종료일</th>
			     				<td>
			     					${menuDto.menu_enddate }
			     				</td>
			     			</tr>
			     		</table>
		     		</form>
	     		</div>
	     	</div>
        </div>
        
      </div>
    </div>
  </body>
</html>