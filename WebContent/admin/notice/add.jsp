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
<script type="text/javascript">
		function isValidate(form){
			if(form.title.value.length==0){
				alert("제목을 입력하세요");
				form.title.focus();
				return false;
			}			
			if(form.content.value.length==0){
				alert("내용을 입력하세요");
				form.content.focus();
				return false;
			}
			
		}
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
        <img alt="공지사항 작성" width="100" src="${pageContext.request.contextPath}/Images/pencil.png"> 
        <span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;Write</span>
    </div>
	
    <div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
                
    <div class="col-lg-12">
    	<div class="panel panel-default">
        	<div class="panel-heading">
            	<font size="6pt" color="gray" face="Impact">Write</font>
			</div>

            <form action="<c:url value='/ADMIN/NOTICE/Add.do'/>" 
			      method="post"				      
			      onsubmit="return isValidate(this)">
             
         		<div class="panel-body" style="padding-bottom:15px">
                   <table class="table table-striped table-bordered table-hover" id="dataTables-example" style="margin-bottom:10px">
                   <thead>
		             <tr>
		                <td>
							<input value="${title}" name="title" type="text" class="form-control" width="100%" placeholder="제목을 입력하세요."/>
						</td>
		             </tr>
       			  </thead>
       			  <tbody>         
		            <tr>					
						<td>
							<textarea name="content" class="form-control" rows="20" placeholder="내용을 입력하세요.">${content}</textarea>
						</td>  						
				    </tr>
				 </tbody>
			 </table>
			 <div style="padding-top:10px">
			 	 <span style="float:left">
				<a class="btn btn-default" href="<c:url value='/ADMIN/NOTICE/List.do'/>" role="button" style="a">목록</a>
			  </span>
			  <span style="float:right">
				<button type="submit" class="btn btn-default">확인</button>
			  </span>
			 </div>
			 </div>
			</form>
		   </div>
		 </div>
		 </div>
	</div>
</div>
</body>
<!-- *********************************************************** BODY *********************************************************** -->
</html>
