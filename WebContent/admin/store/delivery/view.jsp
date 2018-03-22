<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script 
    	async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQo9FPSR1RWpd2JWBwrhbTlIi5DzeubEM">
    </script>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
  	
  	<style type="text/css">
		#map {
			height: 650px;
			width: 100%;
		}
		.storeList {
			width: 15%;
		}
  	</style>
  	<script type="text/javascript">
		// 배달중인 딜리버리가 있으면 갱신되는 위도, 경도 읽어서 지도에 마커 실시간 이동 
	  	if (${nowDelivery ne 0 } ) {
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
						url: '<c:url value="/admin/store/delivery/json/' + selectedDelivery + '.json" />',
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
  	</script>
  </head>

  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/leftSidebar.jsp" /><!-- sidebar -> leftSidebar로 변경 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-9">
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
				     		<table class="table table-bordered text-center">
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

  </body>
</html>