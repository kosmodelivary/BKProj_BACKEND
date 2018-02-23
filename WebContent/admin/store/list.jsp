<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
  	
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
  	
  </head>

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
		   					<th style="width:10%">매장 이름</th>
		   					<th style="width:25%">매장 주소</th>
		   					<th style="width:10%">연락처</th>
		   					<th style="width:15%">딜리버리 시간 (주중)</th>
		   					<th style="width:15%">딜리버리 시간 (주말)</th>
		   					<th style="width:10%">최소 주문 금액</th>
		   					<th style="width:5%">상세</th>
		   					<th style="width:5%">수정</th>
		   					<th>삭제</th>
		   				</tr>
		   				<c:if test="${empty store }" var="flag">
			   				<tr>
			   					<td colspan="6">등록된 자료가 없습니다.</td>
			   				</tr>
		   				</c:if>
		   				<c:if test="${not flag }">
		   					<c:forEach var="item" items="${store }" varStatus="loop" >
				   				<tr>
				   					<td>${item.name }</td>
				   					<td>${item.address }</td>
				   					<td>${item.tel }</td>
				   					<td>${item.weekdayon }:00 ~ ${item.weekdayoff }:00</td>
				   					<td>${item.weekendon }:00 ~ ${item.weekendoff }:00</td>
				   					<td>${item.minordermoney }원</td>
				   					<td><a href="<c:url value='/ADMIN/STORE/View.do?no=${item.no }' />">상세</a></td>
				   					<td><a href="<c:url value='/ADMIN/STORE/Edit.do?no=${item.no }' />">수정</a></td>
				   					<td><a href="<c:url value='/ADMIN/STORE/Delete.do?no=${item.no }' />" onclick="return isDelete()">삭제</a></td>
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