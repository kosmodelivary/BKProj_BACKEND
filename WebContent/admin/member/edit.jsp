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
  			width: 30%;
  		}
  	</style>
  </head>

  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/leftSidebar.jsp" /><!-- sidebar -> leftSidebar로 변경 -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-5 text-right">
	     			<form action="<c:url value='/ADMIN/MEMBER/Edit.do' />" method="post">
			     		<table class="table table-bordered text-left">
			     			<tr>
			     				<td class="col" >이메일</td>
			     				<td>${memberDto.member_email }</td>
			     			</tr>
			     			<tr>
			     				<td class="col" >이름</td>
			     				<td><input type="text" name="name" value="${memberDto.member_name }"></td>
			     			</tr>
			     			<tr>
			     				<td class="col" >연락처</td>
			     				<td><input type="text" name="tel" value="${memberDto.member_tel }"></td>
			     			</tr>
			     			<tr>
			     				<td class="col" >SMS 수신 동의</td>
			     				<td>
			     					<input type="radio" name="sms" id="sms_true" value="true" <c:if test="${memberDto.member_agreesms eq 'true' }">checked</c:if>>
			     					<label for="sms_true">true</label>&nbsp;&nbsp;
			     					<input type="radio" name="sms" id="sms_false" value="false" <c:if test="${memberDto.member_agreesms eq 'false' }">checked</c:if>>
			     					<label for="sms_false">false</label>
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col" >이메일 수신 동의</td>
			     				<td>
			     					<input type="radio" name="email" id="email_true" value="true" <c:if test="${memberDto.member_agreeemail eq 'true' }">checked</c:if>>
			     					<label for="email_true">true</label>&nbsp;&nbsp;
			     					<input type="radio" name="email" id="email_false" value="false" <c:if test="${memberDto.member_agreeemail eq 'false' }">checked</c:if>>
			     					<label for="email_false">false</label>
			     				</td>
			     			</tr>
			     		</table>
			     		<input type="hidden" name="no" value="${memberDto.member_no }">
			     		<input class="btn btn-primary" type="submit" value="수정">
			     		<a href="<c:url value='/ADMIN/MEMBER/List.do' />" class="btn btn-primary">취소</a>
		     		</form>
	     		</div>
	     	</div>
        </div>
        
      </div>
    </div>
  </body>
</html>