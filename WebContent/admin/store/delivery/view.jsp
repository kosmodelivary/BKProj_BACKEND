<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		$(function(){
			var currlocation;
			var jsondata;
			window.setInterval(function() {
				console.log('1.0초 단위로 호출');
				$.ajax({
					url:'<c:url value="/ADMIN/STORE/DELIVERY/Polling.do" />',
					type:'post',
					dataType:'json',
					success: function(data) {
						jsondata = JSON.parse(responseData);
						currlocation = {lat : jsondata.latitude, lng : jsondata.longitude};		// 함수 이름만 사용, ()는 제외
					},
					error: function (request, status, error) {
						// 비정상적인 에러 나왔을 때
						console.log("code:"+request.status + "\n"+"message:" + request.responseText + "\n" + "error:" + error);
					},
				});
			}, 1000);
		});
		
  	</script>
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
		     					<c:choose>
		     						<c:when test="${nowDelivery == 0 }">
				     					운행중인 딜리버리 없음
		     						</c:when>
		     						<c:otherwise>
				     					<select class="form-control">
				     						<option>- 배달중 전체 -</option>
				     						<option>회기점</option>
				     						<option>강남점</option>
				     						<option>우리점</option>
				     					</select> 
		     						</c:otherwise>
		     					</c:choose>
		     					\${requestScope.latitude } : ${empty requestScope.latitude }
		     				</td>
		     			</tr>
		     		</table>
	     		</div>
	     	</div>
        </div>
      </div>
    </div>
    
	<script>
		var uluru = {lat: 37.567, lng: 126.97806};
		
		function initMap() {
		    var map = new google.maps.Map(document.getElementById('map'), {
		      zoom: 12,
		      center: uluru
		    });
		    var marker = new google.maps.Marker({
		      position: currlocation,
		      map: map
		    });
		}
	</script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQo9FPSR1RWpd2JWBwrhbTlIi5DzeubEM&callback=initMap">
    </script>

  	<c:import url="/admin/include/bootstrap_js.jsp" />
  </body>
</html>