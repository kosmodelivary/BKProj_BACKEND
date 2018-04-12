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
  		td {
  			top: 50%;
  		}
  		
  		.col {
  			text-align: center;
  			width:20%;
  		}
  		
  		.form-control {
  			width:auto;
  		}
</style>
<script type="text/javascript">
	var isAdd = function() {
		if (confirm('정말 추가하시겠습니까?') == true) {
			alert('추가합니다.');
			return true;
		} else {
			alert('추가하지 않습니다.');
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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  


<section id="main-content">

	<section class="wrapper">       
            
	<div class="row" style="max-width:100%; max-height:100%; padding:70px 0px 0px 30px;">
		<!-- Table 칼럼 -->	
		<div class="col-lg-12">
		    	
		<div class="panel panel-default">
        	
        	<div class="panel-heading" style="vertical-align:middle;"><!-- Table panel 머리 -->
					<font size="5pt" color="gray">&nbsp;&nbsp;Write</font>
				</div>
					     
			<ul class="nav nav-tabs">
	
				<li class="active"><a href="#tab1" id="product" data-toggle="tab">제품/구매</a></li>
				
				<li><a href="#tab2" id="etc" data-toggle="tab">기타</a></li>
				
			</ul>

					     
			<div class="panel-body">		     		
			     			
     			<form class="form-inline" action="<c:url value='/ADMIN/Faq/Add.do' />" method="post">
		     		
		     		<table class="table table-bordered">
		     			
		     			<tr>
		     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
			     				<img alt="문의글" width="40" src="${pageContext.request.contextPath}/Images/faq.png">
			     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;문의 글</font>
		     				</td>
		     				<td class="text-left" style="padding:20px 20px 20px 20px;">
	 							<font size="4em">
	  								<input class="form-control" type="text" name="ask" style="width:100%">
	 							</font>
	 						</td>
	 					</tr>
	 					
	 					<tr>
		     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
			     				<img alt="답변글" width="40" src="${pageContext.request.contextPath}/Images/faq.png">
			     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;답변 글</font>
		     				</td>
		     				<td class="text-left" style="padding:20px 20px 20px 20px;">
	 							<font size="4em">
	  								<input class="form-control" type="text" name="answer" style="width:100%">
	 							</font>
	 						</td>
	 					</tr>
	 					
		     		</table>
		     		<span id="tabcon"></span>
		     		<script type="text/javascript">

		     		$(document).ready(function(){
		     			$('input[type="submit"]').on('click',function(){
			     			var flag = $('ul .active a').attr('id');
			     			if(flag == 'product'){
			     				$('#tabcon').append("<input type='hidden' name='tabcon' value='product'/> ");
			     			}
			     			else{
			     				$('#tabcon').append("<input type='hidden' name='tabcon' value='etc'/> ");
				     		}
		     			});
		     		});
					</script>
		     		<span style="float:right">
						<input class="btn btn-default" type="submit" value="글 등록" onclick="return isAdd()">
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