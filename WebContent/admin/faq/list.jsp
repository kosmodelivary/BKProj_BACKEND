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
<div id="wrapper"><!-- 페이지 전체 감싸는 div 태그 -->
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* -->  
<div id="page-wrapper" style="padding:80px 0px 0px 0px; margin:0px 0px 0px 210px">         
            
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
		<img alt="FAQ" width="100" src="${pageContext.request.contextPath}/Images/faq.png"> 
		<span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;F&nbsp;A&nbsp;Q</span>
	</div>
			
	<div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
		<!-- Table 칼럼 -->	
		<div class="col-lg-12">
			<div class="panel panel-default"><!-- Table 테두리 설정 -->
				<div class="panel-heading"><!-- Table panel 머리 -->
		  			<font size="6pt" color="gray" face="Impact">BurgerKing FAQ</font>
				</div>
				
        		<div class="panel-body" align="center"><!-- Table panel 바디 -->
        			    		
			    	<div class="row">
							    
					<!-- Table 구현부  -->
					<div class="col-sm-12" style="padding:5px 30px 5px 30px;" align="left">
						   	<table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
						   		<thead>
						   			<tr>
										<th style="width:35%">문의글</th>
					   					<th style="width:35%">답변글</th>
					   				    <th style="width:30%">분류</th>
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
							   					<td style="text-align:left;"><a href="<c:url value='/ADMIN/Faq/View.do?no=${item.faq_no}' />">${item.faq_ask}</a></td>
												<td style="text-align:left;"><a href="<c:url value='/ADMIN/Faq/View.do?no=${item.faq_no}' />">${item.faq_answer}</a></td>
												<td style="text-align:left;"><a href="<c:url value='/ADMIN/Faq/View.do?no=${item.faq_no}' />">${item.tabcon}</a></td>
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
    </div>
   	</div>	
</div>
</body>
<!-- *********************************************************** BODY *********************************************************** -->
<script type="text/javascript">
	
</script>
<!-- ******************************************* -->	  
<c:import url="/admin/include/footer.jsp" />
<!-- ******************************************* -->  
</html>