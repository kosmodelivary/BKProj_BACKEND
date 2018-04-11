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
  		.col {
  			width:25%;
  		}
		#map {
			height: 400px;
			width: 100%;
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
<body onload="initMap()">
<div id="page-wrapper">
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* -->  
<div id="page-wrapper" style="padding:100px 0px 0px 0px; margin:0px 0px 0px 210px">               
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
		<img alt="매장보기" width="100" src="${pageContext.request.contextPath}/Images/image.png"> 
		<span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;View</span>
	</div>
            
    <div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
                
		<div class="col-lg-12">
			<div class="panel panel-default">
	            <div class="panel-heading">
					<font size="6pt" color="gray" face="Impact">Store View</font>
				</div>
				<div class="panel-body" align="center">
                          
                <div class="row">
				<!-- Table 구현부  -->
				<div class="col-sm-12" style="padding:5px 30px 5px 30px;">
                          
                <table class="table table-bordered">
						
					<tr>
	                	<td style="width:22%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="매장이름" width="40" src="${pageContext.request.contextPath}/Images/add_store.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;매장 이름</font> 
	                	</td>
	                	
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">${storeDto.store_name}</font>
  						</td>
	                </tr>
					
	     			<tr>
	     				<td style="width:22%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="매장주소" width="40" src="${pageContext.request.contextPath}/Images/address.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;매장 주소</font> 
	                	</td>
	                	
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">${storeDto.store_addr}</font>
  						</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:22%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="연락처" width="40" src="${pageContext.request.contextPath}/Images/memberlist.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;연락처</font> 
	                	</td>
	                	
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">${storeDto.store_tel}</font>
	     				</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:22%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="배달시간" width="40" src="${pageContext.request.contextPath}/Images/delivery.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;배달 가능시간(주중)</font> 
	                	</td>
	                	
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">${storeDto.store_weekdayon}:00 ~ ${storeDto.store_weekdayoff}:00</font>
	     				</td>
	     			</tr>
	     			<tr>
	     				<td style="width:22%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="배달시간" width="40" src="${pageContext.request.contextPath}/Images/delivery.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;배달 가능시간(주말)</font> 
	                	</td>
	                	
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">${storeDto.store_weekendon}:00 ~ ${storeDto.store_weekendoff}:00</font>
	     				</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:22%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="주문금액" width="40" src="${pageContext.request.contextPath}/Images/money.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;최소 주문금액</font> 
	                	</td>
	                	
  						<td class="text-left" style="padding:20px 20px 20px 20px;">
  							<font size="4em">${storeDto.store_minordermoney}원</font>
	     				</td>
	     			</tr>
	     			
	     			<tr>
	     				<td style="width:20%; padding:10px; text-align:left; vertical-align:middle;" class="alert alert-warning">
	                		<img alt="매장위치" width="40" src="${pageContext.request.contextPath}/Images/location.png">
	                		<font size="4em" style="vertical-align:middle;">&nbsp;&nbsp;매장 위치</font> 
	                	</td>
	     				<td>
							<div id="map"></div>
	     				</td>
	     			</tr>
	     		</table>
   				<span style="float:right">
					<a class="btn btn-default" href="<c:url value='/ADMIN/STORE/Edit.do?no=${storeDto.store_no }'/>">수정</a>
					<a class="btn btn-default" href="<c:url value='/ADMIN/STORE/Delete.do?no=${storeDto.store_no }' />" onclick="return isDelete()">삭제</a>
					<a class="btn btn-default" href="<c:url value='/ADMIN/STORE/List.do'/>" role="button">목록</a>
				</span>
    		</div>
    	</div>
      </div>
      </div>
      </div>
      </div>
      </div>
    </div>
<script>
	function initMap() {
		var storePlace = {lat: -25.363, lng: 131.044};
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 17,
			center: storePlace
		});

		var geocoder = new google.maps.Geocoder();
	    geocoder.geocode({'address': '${storeDto.store_addr }'}, function(results, status) {
	        if (status == 'OK') {
		      console.log("111111");
	          map.setCenter(results[0].geometry.location);
	          var marker = new google.maps.Marker({
	              map: map,
	              position: results[0].geometry.location
	          });
	        } else {
			  console.log("222222");
	          alert('Geocode was not successful for the following reason: ' + status);
	        }
      	});
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQo9FPSR1RWpd2JWBwrhbTlIi5DzeubEM&callback=initMap"></script>
</body>
<!-- *********************************************************** BODY *********************************************************** -->
</html>