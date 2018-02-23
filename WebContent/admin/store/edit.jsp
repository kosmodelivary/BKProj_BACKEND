<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
  	
  	<style type="text/css">
  		.col {
  			text-align: center;
  			width:30%;
  		}
  	</style>
  </head>

  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/sidebar.jsp" />

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-5 text-right">
	     			<form action="<c:url value='/ADMIN/STORE/Edit.do' />" method="post">
			     		<table class="table table-bordered text-left">
			     			<tr>
			     				<td class="col">매장 이름</td>
			     				<td><input type="text" name="name" value="${storeDto.name }"></td>
			     			</tr>
			     			<tr>
			     				<td class="col">매장 주소</td>
			     				<td><input type="text" name="address" value="${storeDto.address }" size="50" ></td>
			     			</tr>
			     			<tr>
			     				<td class="col" >연락처</td>
			     				<td><input type="text" name="tel" value="${storeDto.tel }"></td>
			     			</tr>
			     			<tr>
			     				<td class="col" >딜리버리 시간 (주중)</td>
			     				<td>
			     					<select name="weekdayon">
			     						<c:forEach var="hour" begin="6" end="12" varStatus="loop" >
				     						<option <c:if test="${hour == storeDto.weekdayon }">selected</c:if>>${hour }:00</option>
			     						</c:forEach>
			     					</select>
									~
			     					<select name="weekdayoff">
			     						<c:forEach var="hour" begin="13" end="25" varStatus="loop" >
				     						<option <c:if test="${hour == storeDto.weekdayoff }">selected</c:if>>${hour }:00</option>
			     						</c:forEach>
			     					</select>
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col" >딜리버리 시간 (주말)</td>
			     				<td>
			     					<select name="weekendon">
			     						<c:forEach var="hour" begin="6" end="12" varStatus="loop" >
				     						<option <c:if test="${hour == storeDto.weekendon }">selected</c:if>>${hour }:00</option>
			     						</c:forEach>
			     					</select>
									~
			     					<select name="weekendoff">
			     						<c:forEach var="hour" begin="13" end="25" varStatus="loop" >
				     						<option <c:if test="${hour == storeDto.weekendoff }">selected</c:if>>${hour }:00</option>
			     						</c:forEach>
			     					</select>
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col" >최소 주문 금액</td>
			     				<td><input type="text" name="minordermoney" value="${storeDto.minordermoney }">원</td>
			     			</tr>
			     		</table>
			     		<input type="hidden" name="no" value="${storeDto.no }">
			     		<input class="btn btn-primary" type="submit" value="수정">
			     		<a href="<c:url value='/ADMIN/STORE/List.do' />" class="btn btn-primary">취소</a>
		     		</form>
	     		</div>
	     	</div>
        </div>
        
      </div>
    </div>

  	<c:import url="/admin/include/bootstrap_js.jsp" />
  </body>
</html>