<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
  	
  	<style type="text/css">
  		.col {
  			width:25%;
  		}
		#map {
			height: 400px;
			width: 100%;
		 }
  	</style>
  </head>

  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/sidebar.jsp" />

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-7">
		     		<table class="table table-bordered text-center">
		     			<tr>
		     				<td class="col">매장 이름</td>
		     				<td>${storeDto.name }</td>
		     			</tr>
		     			<tr>
		     				<td class="col">매장 주소</td>
		     				<td>${storeDto.address }</td>
		     			</tr>
		     			<tr>
		     				<td class="col" >연락처</td>
		     				<td>${storeDto.tel }</td>
		     			</tr>
		     			<tr>
		     				<td class="col" >딜리버리 시간 (주중)</td>
		     				<td>
								${storeDto.weekdayon }:00 ~ ${storeDto.weekdayoff }:00
		     				</td>
		     			</tr>
		     			<tr>
		     				<td class="col" >딜리버리 시간 (주말)</td>
		     				<td>
								${storeDto.weekendon }:00 ~ ${storeDto.weekendoff }:00
		     				</td>
		     			</tr>
		     			<tr>
		     				<td class="col" >최소 주문 금액</td>
		     				<td>
								${storeDto.minordermoney }원
		     				</td>
		     			</tr>
		     			<tr>
		     				<td class="col" >매장 위치</td>
		     				<td>
								<div id="map"></div>
		     				</td>
		     			</tr>
		     		</table>
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
		    geocoder.geocode({'address': '${storeDto.address }'}, function(results, status) {
		        if (status == 'OK') {
		          map.setCenter(results[0].geometry.location);
		          var marker = new google.maps.Marker({
		              map: map,
		              position: results[0].geometry.location
		          });
		        } else {
		          alert('Geocode was not successful for the following reason: ' + status);
		        }
	      	});
		}
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQo9FPSR1RWpd2JWBwrhbTlIi5DzeubEM&callback=initMap"></script>

  	<c:import url="/admin/include/bootstrap_js.jsp" />
  </body>
</html>