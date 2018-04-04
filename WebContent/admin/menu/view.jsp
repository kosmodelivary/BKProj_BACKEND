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
		/* {} is the value according to your need */
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
<!-- ******************************************* -->  
<div id="page-wrapper" style="padding:80px 0px 0px 0px; margin:0px 0px 0px 210px">               
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
		<img alt="상세보기" width="100" src="${pageContext.request.contextPath}/Images/document.png"> 
		<span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;View</span>
	</div>
            
    <div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
                
		<div class="col-lg-12">
			<div class="panel panel-default">
           		<div class="panel-heading">
					<font size="6pt" color="gray" face="Impact">${menuDto.category_name }</font>
				</div>
				<div class="panel-body" align="center">
                          
                <div class="row">
				<!-- Table 구현부  -->
				<div class="col-sm-12" style="padding:5px 30px 5px 30px;">
                          
     			<form class="form-inline" action="<c:url value='/ADMIN/MENU/Add.do' />" method="post">
					<table class="table table-bordered">
		     			<tr>
		     				<td class="col" rowspan="10">
								<img src="http://restapi.fs.ncloud.com/bkproject/image/menu/${menuDto.menu_name }${menuDto.menu_file_extension }" 
								     alt="${menuDto.menu_name }이미지"/>		     					
		     				</td>
		     				<th class="col">메&nbsp;뉴&nbsp;이&nbsp;름</th>
		     				<td style="width:30%">
		     					${menuDto.menu_name }
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">카&nbsp;테&nbsp;고&nbsp;리</th>
		     				<td>
		     					<c:choose>
			     					<c:when test="${fn:indexOf(menuDto.category_name,'ham') ne -1 }">
				     					햄버거
				     				</c:when>
				     				<c:when test="${fn:indexOf(menuDto.category_name, 'si') ne -1 }">
				     					사이드
				     				</c:when>
				     				<c:otherwise>
				     					드링크
				     				</c:otherwise>
			     				</c:choose>
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격</th>
		     				<td >
		     					${menuDto.menu_price } (원)
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량</th>
		     				<td>
		     					${menuDto.menu_weight } (g)
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">열&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량</th>
		     				<td>
		     					${menuDto.menu_calrorie } (kcal)
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">단&nbsp;&nbsp;&nbsp;백&nbsp;&nbsp;&nbsp;질</th>
		     				<td>
		     					${menuDto.menu_protein } (g)
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">나&nbsp;&nbsp;&nbsp;트&nbsp;&nbsp;&nbsp;륨</th>
		     				<td>
		     					${menuDto.menu_sodium } (mg)
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">당&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</th>
		     				<td>
		     					${menuDto.menu_sugars } (g)
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">포&nbsp;화&nbsp;지&nbsp;방</th>
		     				<td>
		     					${menuDto.menu_fat } (g)
		     				</td>
		     			</tr>
		     			<tr>
		     				<th class="col">판매종료일</th>
		     				<td>
		     					${menuDto.menu_enddate }
		     				</td>
		     			</tr>
		     		</table>
		     		<span style="float:right">
 						<a class="btn btn-default" href="<c:url value='/ADMIN/MENU/Edit.do?no=${menuDto.menu_no }'/>" role="button">수정</a>
  						<a class="btn btn-default" href="<c:url value='/ADMIN/MENU/Delete.do?no=${menuDto.menu_no }' />" onclick="return isDelete()" role="button">삭제</a>
  						<a class="btn btn-default" href="<c:url value='/ADMIN/MENU/All.do'/>" role="button">목록</a>
		  			</span>
		  		</form>
     		</div>
     	</div>
       </div>
      </div>
      </div>
      </div>
	  </div>
    </div>
  </body>
</html>