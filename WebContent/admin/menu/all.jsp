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
  	<!-- https://jqueryui.com/toggle/ 활용하기 -->
  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/leftSidebar.jsp" /><!-- sidebar -> leftSidebar로 변경 -->
	      
	      <section id="main-content">
	          <section class="wrapper">
		        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		   		    <div class="row" style="padding-top:10px">
			   			<div class="col-md-10 col-md-offset-1">
				   			<table class="table table-bordered">
				   			<c:if test="${empty menu }" var="flag">
					   				<tr>
					   					<td>등록된 자료가 없습니다.</td>
					   				</tr>
				   				</c:if>
				   				<c:if test="${not flag }">
				   					<c:forEach var="item" items="${menu }" varStatus="loop" >
				   						<tr>
				   							<td colspan="2"><a href="<c:url value='/ADMIN/MENU/View.do?no=${item.menu_no }' />" style="cursor: pointer;"><img src="http://restapi.fs.ncloud.com/bkproject/image/menu/${item.menu_name }${item.menu_file_extension }" alt="메뉴그림"></a></td>
				   						</tr>
						   				<tr>
						   					<td colspan="2"><a href="<c:url value='/ADMIN/MENU/View.do?no=${item.menu_no }' />" style="cursor: pointer;">${item.menu_name }</a></td>
						   				</tr>
						   				<tr>
						   					<td>${item.category_name }</td>
						   					<td>${item.menu_price }</td>
					   					</tr>
					   					<tr>
						   					<td><a href="<c:url value='/ADMIN/MENU/Edit.do?no=${item.menu_no }' />">수정</a></td>
						   					<td><a href="<c:url value='/ADMIN/MENU/Delete.do?no=${item.menu_no }' />" onclick="return isDelete()">삭제</a></td>
						   				</tr>
					   				</c:forEach>
				   				</c:if>
				   			</table>
			   			</div>
			   			<div class="col-md-10 col-md-offset-1 text-right">
			   				<a href="<c:url value='/ADMIN/MENU/Add.do' />" class="btn btn-primary">메뉴 추가</a>
			   				<br/>
			   				<a href="<c:url value='/admin/menu/datepicker.jsp'/>">테스트 페이지</a>
			   			</div>
			     	</div>
		        </div>
        	</section>
        </section>
        
      </div>
    </div>

  </body>
</html>