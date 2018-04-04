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
</head>
<!-- *********************************************************** HEAD *********************************************************** -->
<!-- *********************************************************** BODY *********************************************************** -->
<body>
<div id="wrapper">
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* -->  
<div id="page-wrapper" style="padding:80px 0px 0px 0px; margin:0px 0px 0px 210px">       
           
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
		<img alt="수정" width="100" src="${pageContext.request.contextPath}/Images/edit.png"> 
		<span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;Edit</span>
	</div>
		
	<div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
	
   	  	<div class="col-lg-12">
            <div class="panel panel-default">
            	<div class="panel-heading">
					<font size="6pt" color="gray" face="Impact">Edit</font>
				</div>
				
              	<div class="panel-body">
              	
	     			<form class="form-inline" action="<c:url value='/ADMIN/Faq/Edit.do' />" method="post">
	     			
			     		<table class="table table-bordered">
			     		
			     			<tr>
			     				<td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
			                		<img alt="글등록" width="40" src="${pageContext.request.contextPath}/Images/faq.png">
			                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;글 등록</font> 
			                	</td>
		  						<td class="text-left" style="padding:20px 20px 20px 20px;">
		  							<font size="4em">
		  								<input class="form-control" type="text" name="ask" style="width:100%" value="${faqDto.faq_ask }">
		  							</font>
		  						</td>
		     				</tr>
		     				
		     				<tr>
			     				<td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
			                		<img alt="답변" width="40" src="${pageContext.request.contextPath}/Images/faq.png">
			                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;답변</font> 
			                	</td>
		  						<td class="text-left" style="padding:20px 20px 20px 20px;">
		  							<font size="4em">
		  								<input class="form-control" type="text" name="answer" style="width:100%" value="${faqDto.faq_answer }">
		  							</font>
		  						</td>
		     				</tr>
		     				
		     				<tr>
			     				<td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
			                		<img alt="기타" width="40" src="${pageContext.request.contextPath}/Images/faq.png">
			                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;기타</font> 
			                	</td>
		  						<td class="text-left" style="padding:20px 20px 20px 20px;">
		  							<font size="4em">
		  								<input class="form-control" type="text" name="tabcon" style="width:100%" value="${faqDto.tabcon }">
		  							</font>
		  						</td>
		     				</tr>			     			
			     						     						     			
			     		</table>
			     		
			     		<span style="float:right">
	 						<input type="hidden" name="no" value="${faqDto.faq_no }">
				     		<input class="btn btn-default" type="submit" value="수정">
				     		<a href="<c:url value='/ADMIN/Faq/List.do' />" class="btn btn-default">취소</a>
		  				</span>
			     		
		     		</form>
		     		</div>
		     	</div>
	        </div>
		  </div>
      </div>
    </div>
  </body>
</html>