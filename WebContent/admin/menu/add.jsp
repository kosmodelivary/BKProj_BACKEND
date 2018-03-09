<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
  	
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	
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
			     				<td><input class="form-control" type="text" name="m_name"></td>
			     			</tr>
			     			<tr>
			     				<td class="col">가&nbsp;&nbsp;&nbsp;격</td>
			     				<td>
			     					<input class="form-control" type="text" name="m_price" id="m_price">
			     				</td>
			     			</tr>
			     			
			     		</table>
			     		<input class="btn btn-primary" type="submit" value="매장 추가" onclick="return isAdd()">
			     		<a href="<c:url value='/ADMIN/MENU/List.do' />" class="btn btn-primary">취소</a>
		     		</form>
	     		</div>
	     	</div>
        </div>
        
      </div>
    </div>

  	<c:import url="/admin/include/bootstrap_js.jsp" />
  </body>
</html>