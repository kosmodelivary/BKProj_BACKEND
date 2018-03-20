<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
  	
    
    <!-- <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" /> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<%--   	<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-datepicker.css"/>
  	<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap-datepicker.min.js"></script> --%>
  </head>
   <style type="text/css">
  		.table th, .table td {
  			text-align: center;
  		}
   </style>
  	
  	
  	<!-- https://jqueryui.com/toggle/ 활용하기 -->
  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/sidebar.jsp" />

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
   		    <div class="row" style="padding-top:10px">
	   			<div class="col-md-10 col-md-offset-1">
		   			<input class="form-control" type="text" id="date" name="menu_enddate"/>
	   			</div>
	   			<div class="col-md-10 col-md-offset-1 text-right">
	   			</div>
	     	</div>
        	
        </div>
        
      </div>
    </div>
  	<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
  	<script>
  		$('#date').datepicker({
  			uiLibrary:'bootstrap'
  		});	
  	</script>
  </body>
</html>