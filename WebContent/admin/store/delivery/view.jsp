<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
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
  </head>

  <body onload="initMap()">
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/sidebar.jsp" />

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-9">
		     		<table class="table table-bordered text-center">
		     			<tr>
		     				<td>
								<div id="map"></div>
		     				</td>
		     				<td class="storeList">
		     					<select class="form-control">
		     						<option>회기점</option>
		     						<option>강남점</option>
		     						<option>우리점</option>
		     					</select> 
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
		    var uluru = {lat: 37.567, lng: 126.97806};
		    var map = new google.maps.Map(document.getElementById('map'), {
		      zoom: 12,
		      center: uluru
		    });
		    /*
		    var marker = new google.maps.Marker({
		      position: uluru,
		      map: map
		    });
		    */
		}
	</script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQo9FPSR1RWpd2JWBwrhbTlIi5DzeubEM&callback=initMap">
    </script>

  	<c:import url="/admin/include/bootstrap_js.jsp" />
  </body>
</html>