<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<!-- *********************************************************** HEAD *********************************************************** -->
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- ******************************************* -->	  
<c:import url="/admin/include/loginCheck.jsp" />
<c:import url="/admin/include/head.jsp" />
<!-- ******************************************* -->    	
<script type="text/javascript">
function initMap(){
	var map, marker, currentPosition, selectedDelivery;
// 배달중인 딜리버리가 있으면 갱신되는 위도, 경도 읽어서 지도에 마커 실시간 이동 
 	if (${nowDelivery != 0 }) {
	$(function () {
	    var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 14
		});
	    var marker = new google.maps.Marker({
			map: map
		});

		var currentPosition, selectedDelivery;
		window.setInterval(function () {
			selectedDelivery = $('select option:selected').val();
			
			$.ajax({
				// url: '<c:url value="/admin/store/delivery/json/' + selectedDelivery + '.json" />',
				url: '<c:url value="https://s3.ap-northeast-2.amazonaws.com/bkproj-json/' + selectedDelivery + '.json" />',
				type: 'post',
				dataType: 'json',
				success: function(data) {
					currentPosition = new google.maps.LatLng(data.latitude, data.longitude);
					marker.setPosition(currentPosition);
					map.panTo(currentPosition);
				},
				error: function() {
					console.log('fail');
				}
			});
				
		}, 1000);
	});
  }
}
</script>
<style type="text/css">
#map {
	  height: 650px;
	  width: 100%;
					}
.storeList {
	  width: 15%;
					}
</style>
</head>
<!-- *********************************************************** HEAD *********************************************************** -->
<!-- *********************************************************** BODY *********************************************************** -->
<body>
<div id="page-wrapper">
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* -->  
<div id="page-wrapper" style="padding:80px 0px 0px 0px; margin:0px 0px 0px 210px">               
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:96%; margin:20px 20px 20px 30px;">
		<img alt="매장보기" width="100" src="${pageContext.request.contextPath}/Images/image.png"> 
		<span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;View</span>
	</div>
            
    <div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:100%; margin:3px;">
                
		<div class="col-lg-12">
			<div class="panel panel-default">
	            <div class="panel-heading">
					<font size="6pt" color="gray" face="Impact">Delivery View</font>
				</div>
				<div class="panel-body" align="center">
                          
                <div class="row">
				<!-- Table 구현부  -->
				<div class="col-sm-12" style="padding:5px 30px 5px 30px;">

				<c:choose>
					<c:when test="${nowDelivery eq 0 }">
   					배달중인 딜리버리 없음
					</c:when>
				<c:otherwise>
		   		<!-- 
					배달중인 딜리버리 리스트 출력
					- 처음에는 무조건 가장 위의 딜리버리 배달 보여줌
					- 리스트에서 선택하면 선택한 딜리버리 배달 보여줌
				-->					
	     		<table class="table table-bordered">
	     			<tr>
	     				<td>
							<div id="map"></div>
	     				</td>
	     				<td class="storeList">
	     					<select class="form-control">
	     						<c:forEach var="item" items="${storeDelivery }" varStatus="loop">
	     							<option>${item.delivery_no }</option>
	     						</c:forEach>
	     					</select> 
	     				</td>
	     			</tr>
	     		</table>
			</c:otherwise>
		</c:choose>
   		</div>
 	</div>
   </div>
</div>
</div>
</div>
</div>
</div>

<script async defer src="http://maps.googleapis.com/map/api/js?key=AIzaSyAQo9FPSR1Wpd2JWBwrhbTlIi5DzeubEM&callback=initMap"></script>

</body>
</html>