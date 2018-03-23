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
      	<c:import url="/admin/include/leftSidebar.jsp" /><!-- sidebar -> leftSidebar로 변경 -->
      	
	      <!--main content start-->
	      <section id="main-content">
	          <section class="wrapper">
      	
		        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			     	<div class="row" style="padding-top:10px">
			   			<div class="col-md-10 col-md-offset-1">
				   			<table class="table table-bordered">
				   				<tr>
				   					<th style="width:23%">문의글</th>
				   					<th style="width:23%">답변글</th>
				   				    <th style="width:23%">기타</th>				   					
				   					<th style="width:10%">상세</th>
				   					<th style="width:10%">수정</th>
				   					<th>삭제</th>
				   				</tr>
				   				<c:if test="${empty faq }" var="flag">
					   				<tr>
					   					<td colspan="9">등록된 FAQ가 없습니다.</td>
					   				</tr>
				   				</c:if>
				   				<c:if test="${not flag }">
				   					<c:forEach var="item" items="${faq }" varStatus="loop" >
						   				<tr>
						   					<td>${item.tabcon}</td>
						   					<td>${item.faq_ask}</td>
						   					<td>${item.faq_answer}</td>
						   					<td><a href="<c:url value='/ADMIN/Faq/View.do?no=${item.faq_no}' />">상세</a></td>
						   					<td><a href="<c:url value='/ADMIN/Faq/Edit.do?no=${item.faq_no}' />">수정</a></td>
						   					<td><a href="<c:url value='/ADMIN/Faq/Delete.do?no=${item.faq_no}' />" onclick="return isDelete()">삭제</a></td>
						   				</tr>
					   				</c:forEach>
				   				</c:if>
				   			</table>
			   			</div>
			   			<div class="col-md-10 col-md-offset-1 text-right">
			   				<a href="<c:url value='/ADMIN/Faq/Add.do' />" class="btn btn-primary">FAQ 추가</a>
			   			</div>
			     	</div>
			     	<div class="text-center row">
		   				${pagingString }
		   			</div>
		        </div>
		        
		     </section>
		  </section>
        
      </div>
    </div>
</body>
</html>