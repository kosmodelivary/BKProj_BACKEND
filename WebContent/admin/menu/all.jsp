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
<style type="text/css">
  		.table th, .table td {
  			text-align: center;
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
<!-- https://jqueryui.com/toggle/ 활용하기 -->
<body>
<div id="wrapper"><!-- 페이지 전체 감싸는 div 태그 -->
<!-- ******************************************* -->	  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* --> 
<div id="page-wrapper" style="padding:80px 0px 0px 0px; margin:0px 0px 0px 210px">         
            
    <div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
       <img alt="Menu" width="100" src="${pageContext.request.contextPath}/Images/menu.png"> 
       <span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;Menu</span>
    </div>
            
	<div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">

	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<font size="6pt" color="gray" face="Impact">BurgerKing Menu</font>
			</div>
						
			<div class="panel-body" align="center">
            			    		
			<div class="row">
			
			<div class="col-sm-12" style="padding:5px 30px 5px 30px;" align="left">
				<table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" 
				       id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width:100%;">	              	
				<thead>
					<tr>
					  <th style="width:35%; text-align:center;">
					  	<font size="4em" style="vertical-align:middle;">Menu</font>	
					  </th>
					  <th style="width:15%; text-align:center;">
					  	<font size="4em" style="vertical-align:middle;">Category</font>
					  </th>
					  <th style="width:30%; text-align:center;">
					  	<font size="4em" style="vertical-align:middle;">Name</font>
					  </th>
					  <th style="width:20%; text-align:center;">
					  	<font size="4em" style="vertical-align:middle;">Price</font>
					  </th>
					</tr>
           		</thead>
           		
           		<tbody>
            		<c:if test="${empty menu }" var="flag">
						<div>등록된 자료가 없습니다.</div>
					</c:if>
					<c:if test="${not flag }">
						<c:forEach var="item" items="${menu }" varStatus="loop">
					    <tr>
					    	<td>
						    	<a href="<c:url value='/ADMIN/MENU/View.do?no=${item.menu_no }' />" style="cursor: pointer;">
						    		<img src="http://restapi.fs.ncloud.com/bkproject/image/menu/${item.menu_name}${item.menu_file_extension }" alt="메뉴그림" width="50%">
						    	</a>
					    	</td>
					    	<td style="padding:10px; text-align:center; vertical-align:middle;">
		                		<font size="4em" style="vertical-align:middle;">${item.category_name }</font> 
		                	</td>
					    	<td style="padding:10px; text-align:center; vertical-align:middle;">
					    		<a href="<c:url value='/ADMIN/MENU/View.do?no=${item.menu_no }' />" style="cursor: pointer;">
					    			<font size="4em" style="vertical-align:middle;">${item.menu_name }</font>
						    	</a>
					    	</td>
							<td style="padding:10px; text-align:center; vertical-align:middle;">
								<font size="4em" style="vertical-align:middle;">${item.menu_price }</font>
							</td>
					    </tr>	
	           			</c:forEach>
					</c:if>
           		</tbody>	                      	
	            </table> 
				</div>
		
				<div class="row" align="center" style="padding:0px 30px 0px 0px;">
					<a href="<c:url value='/ADMIN/MENU/Add.do'/>">
						<img alt="메뉴추가" width="20" src="${pageContext.request.contextPath}/Images/plus.png">
						<img alt="메뉴추가" width="50" src="${pageContext.request.contextPath}/Images/burger01.png">
					</a>
				</div>
	     	</div>
	        </div>
        	</div>
        	</div>
        	</div>
      	</div>
    </div>
  </body>
<!-- *********************************************************** BODY *********************************************************** -->
<!-- ******************************************* -->	  
<c:import url="/admin/include/footer.jsp" />
<!-- ******************************************* -->  
</html> 