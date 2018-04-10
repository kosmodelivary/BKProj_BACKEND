<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<!-- *********************************************************** HEAD *********************************************************** -->
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=3e7dbc1c-12f9-4cbd-80c9-867100143377"></script>
<!-- ******************************************* -->	  
<c:import url="/admin/include/loginCheck.jsp" />
<c:import url="/admin/include/head.jsp" />
<!-- ******************************************* -->    	
<script type="text/javascript">
	if (${nowDelivery != 0 }) {
		$(function () {
			// - currentAddress: 현재 선택된 주문의 시작점 (매장)
			// - startX: 시작점 경도, startY: 시작점 위도  (매장)
			// - endX: 끝점 경도, endY: 끝점 위도 (배달지)
			
			var startX;
			var startY;
			var endX = 126.997589;
			var endY = 37.570594;
			var currentAddress;
			var idxNumber;

			// <select>의 <option>이 변경되면 새로 주소 가져오기 위한 준비 작업 처리
			$(".selector").change(function () {
				idxNumber = $(".selector option").index($(".selector option:selected"));
				var index = {"index":$(".selector option").index($(".selector option:selected")) };

				console.log("idxNumber: " + idxNumber);
				console.log(JSON.stringify(index));
				
				if (idxNumber != 0) {
					$.ajax({
						url: '<c:url value="/ADMIN/STORE/DELIVERY/Selector.do"/>',
						type: 'post',
						data: {"index":JSON.stringify(index) },
						dataType: 'json',
						async:false,
						success: function(data) {
							currentAddress = data.address;
						},
						error: function(request,status,error) {
							console.log("code : "+request.status+"\nrequest : "+request.responseText+"\nerror : "+error);
							console.log("selector fail!");
						}
					}); // $.ajax
					
				} // if

				drawMap();
			}); // $(".selector").change
			
			function drawMap() {
				idxNumber = $(".selector option").index($(".selector option:selected"));
				console.log("idxNumber: " + idxNumber);
				
				// map div에 출력된 지도 일단 모두 지우기
				document.getElementById('map').innerHTML = "";
				
				// 1. 지도 띄우기
				var map = new Tmap.Map({
					div: 'map',
					width: "100%",
					height: "510px",
				});
				
				idxNumber != 0 ? map.setCenter(new Tmap.LonLat(37.5511694, 126.9860379).transform("EPSG:4326", "EPSG:3857"), 15) 
						       : map.setCenter(new Tmap.LonLat(34.4030796, 127.3187604).transform("EPSG:4326", "EPSG:3857"), 10);
				var routeLayer = new Tmap.Layer.Vector("route");
				map.addLayer(routeLayer);

				if (idxNumber != 0) {
					// 주소로 위도 경도 가져오기
					$.ajax({
						method:"GET",
						url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
						async:false,
						data:{
							"coordType" : "WGS84GEO",//지구 위의 위치를 나타내는 좌표 타입입니다.
							"fullAddr" : currentAddress, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
							"page" : "1",//페이지 번호 입니다.
							"count" : "20",//페이지당 출력 갯수 입니다.
							"appKey" : "3e7dbc1c-12f9-4cbd-80c9-867100143377",//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
						},
						//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
						success:function(response){
							prtcl = response;
							
							var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
							xmlDoc = $.parseXML( prtclString ),
							$xml = $( xmlDoc ),
							$intRate = $xml.find("coordinate");

							//검색 결과 정보가 없을 때 처리
							if($intRate.length==0){
								//예외처리를 위한 파싱 데이터
								$intError = $xml.find("error");
										
								// 주소가 올바르지 않을 경우 예외처리
								if($intError.context.all[0].nodeName == "error"){
									$("#result").text("요청 데이터가 올바르지 않습니다.");
								}
							}	
								  		    
							if($intRate[0].getElementsByTagName("lon").length>0){//구주소
								startX = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
							   	startY = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
							}else{//신주소
								startX = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
								startY = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
							}
							
						},
						//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
						error:function(request,status,error){
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					}); // $.ajax

					// 2. 시작, 도착 심볼찍기
					// 시작
					var markerStartLayer = new Tmap.Layer.Markers("start");
					map.addLayer(markerStartLayer);

					var size = new Tmap.Size(24, 38);
					var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
					var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />", size, offset);
					var marker_s = new Tmap.Marker(new Tmap.LonLat(startX, startY).transform("EPSG:4326", "EPSG:3857"), icon);
					markerStartLayer.addMarker(marker_s);

					// 도착
					var markerEndLayer = new Tmap.Layer.Markers("end");
					map.addLayer(markerEndLayer);

					var size = new Tmap.Size(24, 38);
					var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
					var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />", size, offset);
					var marker_e = new Tmap.Marker(new Tmap.LonLat(endX, endY).transform("EPSG:4326", "EPSG:3857"), icon);
					markerEndLayer.addMarker(marker_e);
					
					// 3. 경로 탐색 API 사용요청
					var prtcl;
					var headers = {}; 
					headers["appKey"]="3e7dbc1c-12f9-4cbd-80c9-867100143377";
					
					$.ajax({
						method:"POST",
						headers : headers,
						url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",//
						async:false,
						data:{
							startX : startX,
							startY : startY,
							endX : endX,
							endY : endY,
							reqCoordType : "WGS84GEO",
							resCoordType : "EPSG3857",
							angle : "172",
						},
						success:function(response){
							console.log("startX, startY: " + startX + ", " + startY);
							console.log("endX, endY: " + endX + ", " + endY);

							prtcl = response;
							// 4. 경로 탐색  결과 Line 그리기
							//경로 탐색  결과 POINT 찍기
							/* -------------- Geometry.Point -------------- */
							var pointLayer = new Tmap.Layer.Vector("point");
							var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
							   xmlDoc = $.parseXML( prtclString ),
							   $xml = $( xmlDoc ),
							   $intRate = $xml.find("Placemark");
							   var style_red = {
							           fillColor:"#FF0000",
							           fillOpacity:0.2,
							           strokeColor: "#FF0000",
							           strokeWidth: 3,
							           strokeDashstyle: "solid",
							           pointRadius: 2,
							           title: "this is a red line"
							      };
							   $intRate.each(function(index, element) {
							   	var nodeType = element.getElementsByTagName("tmap:nodeType")[0].childNodes[0].nodeValue;
								if(nodeType == "POINT"){
									var point = element.getElementsByTagName("coordinates")[0].childNodes[0].nodeValue.split(',');
									var geoPoint =new Tmap.Geometry.Point(point[0],point[1]);
									var pointFeature = new Tmap.Feature.Vector(geoPoint, null, style_red); 
									pointLayer.addFeatures([pointFeature]);
								}
							   });
							map.addLayer(pointLayer);
							/* -------------- Geometry.Point -------------- */
							//경로 탐색  결과 Line 그리기
							routeLayer.style ={
									fillColor:"#FF0000",
							        fillOpacity:0.2,
							        strokeColor: "#FF0000",
							        strokeWidth: 3,
							        strokeDashstyle: "solid",
							        pointRadius: 2,
							        title: "this is a red line"	
							}
							var kmlForm = new Tmap.Format.KML().read(prtcl);
							routeLayer.addFeatures(kmlForm);
							
							// 5. 경로탐색 결과 반경만큼 지도 레벨 조정
							map.zoomToExtent(routeLayer.getDataExtent());
						},
						error:function(request,status,error){
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					}); // $.ajax	
				} // if (index != 0)
				
				// 6. 마커 출력
				markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
				map.addLayer(markerLayer);//map에 마커 레이어 추가
				   
				var lonlat;	// 좌표 설정 변수
				var icon;//마커 아이콘 변수
				var size = new Tmap.Size(24, 38);//아이콘 크기 설정
				var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점 설정

				// 딜리버리는 일정 시간 간격으로 마커 위치 변경
				window.setInterval(function () {
					// 출력할 범위 설정
					var from, to;
					
					if (idxNumber != 0) {
						from	= idxNumber;
						to		= from + 1;
					} else {
						from 	= 1;
						to		= $('.selector option').length;
					}
					
					markerLayer.clearMarkers();
					
					// 설정된 범위의 위도, 경도 읽어서 지도에 표시
					for (var i = from; i < to; i++) {
						selectedDelivery = $('select option:eq(' + i + ')').val();
						
						$.ajax({
							url: '<c:url value="/admin/store/delivery/deliveryLoading.jsp"/>',
							type: 'post',
							dataType: 'json',
							async:false,
							data: {"selectedDelivery":selectedDelivery},
							success: function(data) {
								icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png',size, offset);//마커 아이콘 설정
								lonlat = new Tmap.LonLat(data.longitude, data.latitude).transform("EPSG:4326", "EPSG:3857");//좌표 설정
								marker = new Tmap.Marker(lonlat, icon);//마커 생성
								markerLayer.addMarker(marker);//레이어에 마커 추가
							},
							error: function() {
								console.log('fail');
							}
						});
					} // end for	
				}, 1000); // window.setInterval(function ()
			} // drawMap
			
			drawMap();
		});  // $(function ()
		
	} // if (${nowDelivery != 0 })
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
	     					<select class="form-control selector">
	     						<option>-- 현재 배달중 딜리버리 --</option>
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


</body>
</html>