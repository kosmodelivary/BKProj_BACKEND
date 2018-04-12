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
<!-- Table 페이지 구현에 필요 --> 
    <!-- Bootstrap Core CSS -->
   <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/bootstrap/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath}/bootstrap/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="${pageContext.request.contextPath}/bootstrap/datatables/dataTables.responsive.css" rel="stylesheet">  
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">  
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/bootstrap/vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
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
			<div class="panel panel-default"><!-- Table 테두리 설정 -->
				<div class="panel-heading" style="vertical-align:middle;"><!-- Table panel 머리 -->
					<font size="5pt" color="gray">&nbsp;&nbsp;FAQ</font>
				</div>
				
        		<div class="panel-body" align="center"><!-- Table panel 바디 -->
        			    		
			    	<div class="row">
							    
					<!-- Table 구현부  -->
					<div class="col-sm-12" style="padding:5px 30px 5px 30px;" align="left">
						   	<table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
						   		<thead>
						   			<tr>
					   				    <th style="width:30%; text-align:center;">분류</th>
										<th style="width:35%; text-align:center;">문의글</th>
					   					<th style="width:35%; text-align:center;">답변글</th>
				   				    </tr>
						   		</thead>	
						   		<tbody>
						   			<c:if test="${empty faq }" var="flag">
					   					<tr>
					   						<td>등록된 FAQ가 없습니다.</td>
					   					</tr>
						   			</c:if>
						   			<c:if test="${not flag }">
							   			<c:forEach var="item" items="${faq }" varStatus="loop" >
							   				<tr>
												<td style="text-align:center;"><a href="<c:url value='/ADMIN/Faq/View.do?no=${item.faq_no}' />">${item.tabcon}</a></td>
							   					<td style="text-align:left;"><a href="<c:url value='/ADMIN/Faq/View.do?no=${item.faq_no}' />">${item.faq_ask}</a></td>
												<td style="text-align:left;"><a href="<c:url value='/ADMIN/Faq/View.do?no=${item.faq_no}' />">${item.faq_answer}</a></td>
											</tr>
							   			</c:forEach>
						   			</c:if>
						   		</tbody>		
				   			</table>	
			   			</div>
			     	</div>
			     	
			     	<div class="row" align="center" style="padding:0px 30px 0px 0px;">
						<a href="${pageContext.request.contextPath}/ADMIN/Faq/Add.do">
								<img alt="글쓰기" width="60" src="${pageContext.request.contextPath}/Images/pencil.png">
						</a>	
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
<script type="text/javascript">
	
</script>
<!-- ******************************************* -->	  
<c:import url="/admin/include/footer.jsp" />
<!-- ******************************************* -->  
</html>