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
	
   	  	<div class="col-lg-12">
            <div class="panel panel-default">
            <div class="panel-heading" style="vertical-align:middle;"><!-- Table panel 머리 -->
					<font size="5pt" color="gray">&nbsp;&nbsp;Edit</font>
				</div>
				
              <div class="panel-body" align="center">
                
                <form action="<c:url value='/ADMIN/NOTICE/Edit.do'/>" method="post">
                <input type="hidden" name="no" value="${noticeDto.notice_no}"/>
                
                <table class="table table-bordered">
                          		
                	<tr>
	                	<td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="제목" width="40" src="${pageContext.request.contextPath}/Images/title.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;제&nbsp;목</font> 
	                	</td>
               	
 						<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  							<input type="text" name="title" value="${noticeDto.notice_title}" style="width:100%">
 							</font>
 						</td>
               		</tr>
               
	                <tr>
		               <td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="내용" width="40" src="${pageContext.request.contextPath}/Images/document.png">
		                	<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;내&nbsp;용</font> 
		                </td>
		                
		                <td colspan="2" class="text-left" style="padding:20px 20px 20px 20px;">
		                	<font size="4em">
	  							<textarea name="content" class="form-control" rows="10">${noticeDto.notice_content}</textarea>
	 							</font>
		                </td>
	                </tr>
         			
			 	</table>
			 	<span style="float:right">
					<input class="btn btn-default" type="submit" value="수정">
    				<a href="<c:url value='/ADMIN/NOTICE/List.do' />" class="btn btn-default">취소</a>
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