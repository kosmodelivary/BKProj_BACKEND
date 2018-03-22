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

  <body onload="initMap()">
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/leftSidebar.jsp" /><!-- sidebar -> leftSidebar로 변경 -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-7">
		     		<table class="table table-bordered text-center">
		     			<tr>
		     				<td class="col">문의 글</td>
		     				<td>${faqDto.faq_ask}</td>
		     			</tr>
		     			<tr>
		     				<td class="col">답변 글</td>
		     				<td>${faqDto.faq_answer }</td>
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
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQo9FPSR1RWpd2JWBwrhbTlIi5DzeubEM&callback=initMap">
    </script>
  </body>
</html>