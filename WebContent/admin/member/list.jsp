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
		   					<th style="width:10%">회원 일련번호</th>
		   					<th style="width:20%">이메일</th>
		   					<th style="width:20%">이름</th>
		   					<th style="width:10%">연락처</th>
		   					<th style="width:15%">SMS 수신 동의</th>
		   					<th style="width:15%">이메일 수신 동의</th>
		   					<th style="width:5%">수정</th>
		   					<th>삭제</th>
		   				</tr>
		   				<c:if test="${empty member }" var="flag">
			   				<tr>
			   					<td colspan="8">등록된 자료가 없습니다.</td>
			   				</tr>
		   				</c:if>
		   				<c:if test="${not flag }">
		   					<c:forEach var="item" items="${member }" varStatus="loop" >
				   				<tr>
				   					<td>${item.member_no }</td>
				   					<td>${item.member_email }</td>
				   					<td>${item.member_name }</td>
				   					<td>${item.member_tel }</td>
				   					<td>${item.member_agreesms }</td>
				   					<td>${item.member_agreeemail }</td>
				   					<td><a href="<c:url value='/ADMIN/MEMBER/Edit.do?no=${item.member_no }' />">수정</a></td>
				   					<td><a href="<c:url value='/ADMIN/MEMBER/Delete.do?no=${item.member_no }' />" onclick="return isDelete()">삭제</a></td>
				   				</tr>
			   				</c:forEach>
		   				</c:if>
		   			</table>
	   			</div>
	     	</div>
        </div>
        
      </div>
    </div>

  	<c:import url="/admin/include/bootstrap_js.jsp" />
  </body>
</html>