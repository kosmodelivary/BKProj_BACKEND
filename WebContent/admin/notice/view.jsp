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
  			width:25%;
  		}
		#map {
			height: 400px;
			width: 100%;
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
					<font size="5pt" color="gray">&nbsp;&nbsp;View</font>
				</div>
				<div class="panel-body" align="center">
                          
                <div class="row">
				<!-- Table 구현부  -->
				<div class="col-sm-12" style="padding:5px 30px 5px 30px;">
                          
				<table class="table table-bordered">
                    
                    <c:if test="${empty noticeDto }" var="flag">
						<tr>
							<td colspan="9">등록된 자료가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not flag }">
						<tr>
		                	<td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		                		<img alt="제목" width="40" src="${pageContext.request.contextPath}/Images/title.png">
		                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;제 목</font> 
		                	</td>
	  						<td class="text-left" style="padding:20px 20px 20px 20px;">
	  							<font size="4em"> ${noticeDto.notice_title}</font>
	  						</td>
		                </tr>
		                <tr>
			               <td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		                		<img alt="작성일" width="40" src="${pageContext.request.contextPath}/Images/date.png">
			                	<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;작성일</font> 
			                </td>
	  						<td class="text-left" style="padding:20px 20px 20px 20px;">
	  							<font size="4em"> ${noticeDto.notice_postdate}</font>
	  						</td>
		                </tr>
		                <tr>
			               <td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
		                		<img alt="내용" width="40" src="${pageContext.request.contextPath}/Images/document.png">
			                	<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;내 용</font> 
			                </td>
			                <td colspan="2" class="text-left" style="padding:20px 20px 20px 20px;">
			                	<font size="4em"> ${noticeDto.notice_content}</font>
			                </td>
		                </tr>
 					</c:if>	 
		  			</table> 
		  			<span style="float:right">
 						<a class="btn btn-default" href="<c:url value='/ADMIN/NOTICE/Edit.do?no=${noticeDto.notice_no}'/>" role="button">수정</a>
  						<a class="btn btn-default" href="<c:url value='/ADMIN/NOTICE/Delete.do?no=${noticeDto.notice_no}'/>" onclick="return isDelete()" role="button">삭제</a>
  						<a class="btn btn-default" href="<c:url value='/ADMIN/NOTICE/List.do'/>" role="button">목록</a>
		  			</span>	 						
			    	</div>
			    </div>
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