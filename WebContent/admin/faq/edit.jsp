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
<section id="container" >
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* -->  
<section id="main-content">

	<section class="wrapper">       
            
	<div class="row" style="max-width:100%; max-height:100%; padding:70px 0px 0px 30px;">
		<!-- Table 칼럼 -->	
		<div class="col-lg-12">
		
            <div class="panel panel-default">
            	<div class="panel-heading" style="vertical-align:middle;"><!-- Table panel 머리 -->
					<font size="5pt" color="gray">&nbsp;&nbsp;Edit</font>
				</div>
				
              	<div class="panel-body" align="center">
              	
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
			                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;분류</font> 
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
      <!--common script for all pages-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/common-scripts.js"></script>
   	
   	</div>	
</section>
</section>
</section>
</body>
<!-- *********************************************************** BODY *********************************************************** -->
</html>