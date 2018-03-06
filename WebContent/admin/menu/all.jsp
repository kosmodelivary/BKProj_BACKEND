<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
  </head>
   <style type="text/css">
  		.table th, .table td {
  			text-align: center;
  		}
  	</style>
  	
  	<script type="text/javascript">
		var isDelete = function() {
			if (confirm('정말 지우시겠습니까?') == true) {
				alert('지웁니다.');
				return true;
			} else {
				alert('안지웁니다.');
				return false;
			}
		};
  	</script>
  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/sidebar.jsp" />

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
   		    <div class="row" style="padding-top:10px">
	   			<div class="col-md-10 col-md-offset-1">
		   			<table class="table table-bordered">
		   				<tr>
		   					<th style="width:30%">메뉴 이름</th>
		   					<th style="width:20%">카테고리</th>
		   					<th style="width:20%">가&nbsp;&nbsp;&nbsp;격</th>
		   					<th style="width:10%">상세</th>
		   					<th style="width:10%">수정</th>
		   					<th>삭제</th>
		   				</tr>
		   				<c:if test="${empty store }" var="flag">
			   				<tr>
			   					<td colspan="6">등록된 자료가 없습니다.</td>
			   				</tr>
		   				</c:if>
		   				<c:if test="${not flag }">
		   					<c:forEach var="item" items="${menu }" varStatus="loop" >
				   				<tr>
				   					<td>${item.store_name }</td>
				   					<td>${item.store_addr }</td>
				   					<td>${item.store_tel }</td>
				   					<td>${item.store_weekdayon }:00 ~ ${item.store_weekdayoff }:00</td>
				   					<td>${item.store_weekendon }:00 ~ ${item.store_weekendoff }:00</td>
				   					<td>${item.store_minordermoney }원</td>
				   					<td><a href="<c:url value='/ADMIN/STORE/View.do?no=${item.store_no }' />">상세</a></td>
				   					<td><a href="<c:url value='/ADMIN/STORE/Edit.do?no=${item.store_no }' />">수정</a></td>
				   					<td><a href="<c:url value='/ADMIN/STORE/Delete.do?no=${item.store_no }' />" onclick="return isDelete()">삭제</a></td>
				   				</tr>
			   				</c:forEach>
		   				</c:if>
		   			</table>
	   			</div>
	   			<div class="col-md-10 col-md-offset-1 text-right">
	   				<a href="<c:url value='/ADMIN/STORE/Add.do' />" class="btn btn-primary">매장 추가</a>
	   			</div>
	     	</div>
        	
        </div>
        
      </div>
    </div>

  	<c:import url="/admin/include/bootstrap_js.jsp" />
  </body>
</html>