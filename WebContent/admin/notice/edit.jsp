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
                
                <form action="<c:url value='/ADMIN/NOTICE/Edit.do'/>" method="post">
                <input type="hidden" name="no" value="${noticeDto.notice_no}"/>
                
                <table class="table table-bordered">
                          		
                	<tr>
	                	<td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="제목" width="40" src="${pageContext.request.contextPath}/Images/title.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;제 목</font> 
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
		                	<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;내 용</font> 
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
		 </div>
	 </div>
</div>
</body>
<!-- *********************************************************** BODY *********************************************************** -->
</html>