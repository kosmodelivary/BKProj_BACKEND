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
<div id="wrapper">
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* -->  
<div id="page-wrapper" style="padding:80px 0px 0px 0px; margin:0px 0px 0px 210px">

	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
        <img alt="메뉴추가" width="95px" src="${pageContext.request.contextPath}/Images/shop02.png"> 
        <span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;Add Store</span>
    </div>
	
    <div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
                
    <div class="col-lg-12">
    	<div class="panel panel-default">
        	<div class="panel-heading">
            	<font size="6pt" color="gray" face="Impact">Add BurgerKing Store</font>
			</div>
					     
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
	 					
	 					<tr>
		     				<td style="width:15%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
			     				<img alt="기타" width="40" src="${pageContext.request.contextPath}/Images/faq.png">
			     				<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;기타</font>
		     				</td>
		     				<td class="text-left" style="padding:20px 20px 20px 20px;">
	 							<font size="4em">
	  								<input class="form-control" type="text" name="tabcon" style="width:100%">
	 							</font>
	 						</td>
	 					</tr>
		     			
		     		</table>
		     		
		     		<span style="float:right">
						<input class="btn btn-default" type="submit" value="글 등록" onclick="return isAdd()">
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