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
			     				<td class="col">메뉴 이름</td>
			     				<td>
			     					${menuDto.menu_name }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">카테고리</td>
			     				<td>
				     				${menuDto.category_name }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">가&nbsp;&nbsp;&nbsp;격</td>
			     				<td>
			     					${menuDto.menu_price }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">중&nbsp;&nbsp;&nbsp;량</td>
			     				<td>
			     					${menuDto.menu_weight }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">열&nbsp;&nbsp;&nbsp;량</td>
			     				<td>
			     					${menuDto.menu_calrorie }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">단&nbsp;백&nbsp;질</td>
			     				<td>
			     					${menuDto.menu_protein }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">나&nbsp;트&nbsp;륨</td>
			     				<td>
			     					${menuDto.menu_sodium }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">당&nbsp;&nbsp;&nbsp;류</td>
			     				<td>
			     					${menuDto.menu_sugars }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">포&nbsp;화&nbsp;지&nbsp;방</td>
			     				<td>
			     					${menuDto.menu_fat }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">판매종료일</td>
			     				<td>
			     					${menuDto.menu_enddate }
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col">메뉴 이미지</td>
			     				<td>
			     					
			     				</td>
			     			</tr>
			     		</table>
		     		</form>
	     		</div>
	     	</div>
        </div>
        
      </div>
    </div>

  	<c:import url="/admin/include/bootstrap_js.jsp" />
  </body>
</html>