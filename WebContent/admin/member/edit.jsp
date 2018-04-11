<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<!-- *********************************************************** HEAD *********************************************************** -->
<head>
<!-- ******************************************* -->	  
<c:import url="/admin/include/loginCheck.jsp" />
<c:import url="/admin/include/head.jsp" />
<!-- ******************************************* -->  
  	<style type="text/css">
  		.col {
  			text-align: center;
  			width: 30%;
  		}
  	</style>
</head>
<!-- *********************************************************** HEAD *********************************************************** -->
<!-- *********************************************************** BODY *********************************************************** -->
<body>
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* -->  
<div id="page-wrapper" style="padding:100px 0px 0px 0px; margin:0px 0px 0px 210px">
           
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
		<img alt="수정" width="100" src="${pageContext.request.contextPath}/Images/edit.png"> 
		<span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;Edit</span>
	</div>
		
	<div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
	
   	  	<div class="col-lg-12">
            <div class="panel panel-default">
            	<div class="panel-heading">
					<font size="6pt" color="gray" face="Impact">JAVA MURGER Member Edit</font>
				</div>
				
              	<div class="panel-body">

     			<form action="<c:url value='/ADMIN/MEMBER/Edit.do' />" method="post">
	     		
	     		<table class="table table-bordered">
	     		
	     			<tr>
	     				<td style="width:20%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="이메일" width="40" src="${pageContext.request.contextPath}/Images/mail.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;이메일</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								${memberDto.member_email}
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:20%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="이름" width="40" src="${pageContext.request.contextPath}/Images/member.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;이름</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input type="text" name="name" value="${memberDto.member_name }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:20%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="연락처" width="40" src="${pageContext.request.contextPath}/Images/memberlist.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;연락처</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input type="text" name="tel" value="${memberDto.member_tel }">
 							</font>
 						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:20%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="SMS 수신 동의" width="40" src="${pageContext.request.contextPath}/Images/check.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;SMS 수신 동의</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input type="radio" name="sms" id="sms_true" value="true" <c:if test="${memberDto.member_agreesms eq 'true' }">checked</c:if>>
		     					<label for="sms_true">true</label>&nbsp;&nbsp;
		     					<input type="radio" name="sms" id="sms_false" value="false" <c:if test="${memberDto.member_agreesms eq 'false' }">checked</c:if>>
		     					<label for="sms_false">false</label>
 							</font>
 						</td>	     			
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:20%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		     				<img alt="이메일 수신 동의" width="40" src="${pageContext.request.contextPath}/Images/check.png">
		     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;이메일 수신 동의</font>
	     				</td>
	     				<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  								<input type="radio" name="email" id="email_true" value="true" <c:if test="${memberDto.member_agreeemail eq 'true' }">checked</c:if>>
		     					<label for="email_true">true</label>&nbsp;&nbsp;
		     					<input type="radio" name="email" id="email_false" value="false" <c:if test="${memberDto.member_agreeemail eq 'false' }">checked</c:if>>
		     					<label for="email_false">false</label>
 							</font>
 						</td>
	     			</tr>	     			
	     		</table>
	     		<span style="float:right">
					<input type="hidden" name="no" value="${memberDto.member_no }">
		     		<input class="btn btn-default" type="submit" value="수정">
		     		<a class="btn btn-default" href="<c:url value='/ADMIN/MEMBER/List.do'/>" role="button">목록</a>
	  			</span>	 	     		
	     		</form>
	     		</div>
	     	</div>
        </div>
      </div>
    </div>
  </body>
</html>