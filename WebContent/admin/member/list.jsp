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
		
		function openEmailForm() {
			window.open("<c:url value='/ADMIN/MEMBER/EmailForm.do' />", "_blank", 
					"toolbar=no,scrollbars=yes,resizable=yes,top=100,left=150,width=600,height=850");
		}
	</script>  
</head>
<!-- *********************************************************** HEAD *********************************************************** -->
<!-- *********************************************************** BODY *********************************************************** -->
<body>
<div id="wrapper"><!-- 페이지 전체 감싸는 div 태그 -->
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* -->  
<div id="page-wrapper" style="padding:100px 0px 0px 0px; margin:0px 0px 0px 210px">         
            
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
		<img alt="Store" width="100" src="${pageContext.request.contextPath}/Images/memberlist.png"> 
		<span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;Member</span>
	</div>

	<div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
		<!-- Table 칼럼 -->	
		<div class="col-lg-12">
			<div class="panel panel-default"><!-- Table 테두리 설정 -->
				<div class="panel-heading"><!-- Table panel 머리 -->
		  			<font size="6pt" color="gray" face="Impact">Member List</font>
				</div>
			
				<div class="panel-body" align="center"><!-- Table panel 바디 -->
        			    		
		    	<div class="row">
						    
		    	<!-- Table 구현부  -->
				<div class="col-sm-12" style="padding:5px 10px 5px10px; width:100%" align="left">
				
				<table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" 
				       role="grid" aria-describedby="dataTables-example_info">
	   				<thead>
		   				<tr style="text-align:center">
		   					<th style="width:10%">회원번호</th>
		   					<th style="width:18%">이메일</th>
		   					<th style="width:11%">이름</th>
		   					<th style="width:18%">연락처</th>
		   					<th style="width:14%">SMS 수신 동의</th>
		   					<th style="width:14%">E-mail 수신 동의</th>
		   					<th style="width:10%">수정</th>
		   				</tr>
	   				</thead>
	   				<tbody>
		   				<c:if test="${empty member }" var="flag">
			   				<tr>
			   					<td colspan="8">등록된 자료가 없습니다.</td>
			   				</tr>
		   				</c:if>
		   				<c:if test="${not flag }">
		   					<c:forEach var="item" items="${member }" varStatus="loop" >
				   				<tr>
				   					<td>${item.member_no}</td>				   		
				   					<td>${item.member_email }</td>
				   					<td>${item.member_name }</td>
				   					<td>${item.member_tel }</td>
				   					<td>${item.member_agreesms }</td>
				   					<td>${item.member_agreeemail }</td>
				   					<td>
				   						<a href="<c:url value='/ADMIN/MEMBER/Edit.do?no=${item.member_no}'/>">
				   							<img alt="수정" width="20" src="${pageContext.request.contextPath}/Images/edit.png">
				   						</a>
				   					</td>			   					
				   				</tr>
			   				</c:forEach>
		   				</c:if>
		   			</tbody>
				</table>
				<div class="row" id="email" align="center" style="padding:0px 30px 0px 0px;">
					<a href="javascript:void(0);" onclick="openEmailForm()">
						<img alt="이메일모달팝업" width="20" src="${pageContext.request.contextPath}/Images/plus.png">
						<img alt="이메일모달팝업" width="50" src="${pageContext.request.contextPath}/Images/email.png">
					</a>
				</div>

			   	</div>
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