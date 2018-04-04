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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
  		.col {
  			text-align: center;
  			width:20%;
  		}
  		
  		.form-control {
  			width:auto;
  		}
</style>
<script type="text/javascript">
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("address").value = fullAddr;
	            }
	        }).open();
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
<div id="page-wrapper" style="padding:70px 0px 0px 210px;">         
           
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:90%; margin:20px 20px 20px 30px;">
		<img alt="수정" width="100" src="${pageContext.request.contextPath}/Images/edit.png"> 
		<span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;Edit</span>
	</div>
		
	<div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:94%; margin:3px;">
	
   	  	<div class="col-lg-12">
            <div class="panel panel-default">
            	<div class="panel-heading">
					<font size="6pt" color="gray" face="Impact">Edit</font>
				</div>
				
              	<div class="panel-body">
              	
			    <form class="form-inline" action="<c:url value='/ADMIN/STORE/Edit.do'/>" method="post">
					     		
	     		<table class="table table-bordered">
	     			
	     			<tr>
	     				<td style="width:12%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="매장이름" width="40" src="${pageContext.request.contextPath}/Images/add_store.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;매장 이름</font> 
	                	</td>
 						<td class="text-left" style="padding:20px 20px 20px 20px;">
 							<font size="4em">
  							<input class="form-control" type="text" name="name" value="${storeDto.store_name}" style="width:100%">
 							</font>
 						</td>	     		
	     			</tr>
	     			
     				<tr>
	     				<td style="width:25%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="매장주소" width="40" src="${pageContext.request.contextPath}/Images/address.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;매장 주소</font> 
	                	</td>
  						<td class="text-left" style="padding:20px 20px 20px 20px;">	  							
  							<font size="4em">
	  							<input class="form-control" type="text" name="address" id="address" size="50" value="${storeDto.store_addr }" placeholder="주소">
	     						<input class="btn btn-default" type="button" onclick="execDaumPostcode()" value="주소 검색">
  							</font>
  						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:25%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="연락처" width="40" src="${pageContext.request.contextPath}/Images/memberlist.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;연락처</font> 
	                	</td>
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">
  								<input class="form-control" type="text" name="tel" value="${storeDto.store_tel}">
  							</font>
	     				</td>	     			
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:25%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="배달시간" width="40" src="${pageContext.request.contextPath}/Images/delivery.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;배달 가능시간(주중)</font> 
	                	</td>
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">
	  							<select name="weekdayon">
		     						<c:forEach var="hour" begin="6" end="12" varStatus="loop" >
			     						<option <c:if test="${hour == storeDto.store_weekdayon }">selected</c:if>>${hour }:00</option>
		     						</c:forEach>
		     					</select>
								~
		     					<select name="weekdayoff">
		     						<c:forEach var="hour" begin="13" end="25" varStatus="loop" >
			     						<option <c:if test="${hour == storeDto.store_weekdayoff }">selected</c:if>>${hour }:00</option>
		     						</c:forEach>
		     					</select>
  							</font>
	     				</td>	     			
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:25%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="배달시간" width="40" src="${pageContext.request.contextPath}/Images/delivery.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;배달 가능시간(주말)</font> 
	                	</td>
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">
  								<select name="weekendon">
	     						<c:forEach var="hour" begin="6" end="12" varStatus="loop" >
		     						<option <c:if test="${hour == storeDto.store_weekendon }">selected</c:if>>${hour }:00</option>
	     						</c:forEach>
		     					</select>
								~
		     					<select name="weekendoff">
		     						<c:forEach var="hour" begin="13" end="25" varStatus="loop" >
			     						<option <c:if test="${hour == storeDto.store_weekendoff }">selected</c:if>>${hour }:00</option>
		     						</c:forEach>
		     					</select>
  							</font>
	     				</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:25%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="주문금액" width="40" src="${pageContext.request.contextPath}/Images/money.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;최소 주문금액</font> 
		                </td>
	                	<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">
  								<select name="minordermoney">
	     						<c:forEach var="money" begin="6000" end="10000" step="1000" varStatus="loop" >
		     						<option <c:if test="${money == storeDto.store_minordermoney }">selected</c:if>>${money }</option>
	     						</c:forEach>
	     					</select>
  							</font>
	     				</td>
	     			</tr>
	     			
	     		</table>
					
				<span style="float:right;">	     		
		     		<input type="hidden" name="no" value="${storeDto.store_no }">
		     		<input class="btn btn-default" type="submit" value="수정">
		     		<a href="<c:url value='/ADMIN/STORE/List.do' />" class="btn btn-default">취소</a>
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