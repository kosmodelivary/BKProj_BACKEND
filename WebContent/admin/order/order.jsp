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
</head>
<!-- *********************************************************** HEAD *********************************************************** -->
<!-- *********************************************************** BODY *********************************************************** -->
<body>
<section id="container" >
<!-- ******************************************* -->  
<c:import url="/admin/include/navigator.jsp" />
<c:import url="/admin/include/leftSidebar.jsp" />
<!-- ******************************************* --> 
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12 main-chart" style="background-color:#F7F2E0;">
<!-- ******************************************************************** --> 			
<!-- ******************************************************************** --> 
				<div style="padding-top:20px;"></div>                                       
                <div class="row mt">
                      <!-- SERVER STATUS PANELS -->
                      	<div class="col-md-4 col-sm-4 mb">
                      		<div class="white-panel pn donut-chart">
                      			<div class="white-header">
						  			<h5>PRODUCT SELL RANK - CHART</h5>
                      			</div>
								<canvas id="serverstatus01" height="120" width="120"></canvas>
								<script>
									var doughnutData = [];
									$(function (){
										$(function(){
											$.ajax({
											    //url : "http://192.168.0.27:8080/delivery/menu/getTopSellProduct.whpr",		// 내부
											    url : "http://220.127.242.43:8090/delivery/menu/getTopSellProduct.whpr",			// 외부
											    dataType : "jsonp",
											    jsonp : "callback",
											    success: function(data) {
											    	successCallback(data);
											    },
											    error: function(request,status,error){
													console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
												}
											});		
										});
										
										var successCallback = function(data){
									       	doughnutData.push({
									       			color : "Red",
									       			value : (data[0].sellCount/data[0].top4SellCount) * 100
									       	});
									       	doughnutData.push({
									       			color : "Blue",
									       			value : (data[1].sellCount/data[0].top4SellCount) * 100
									       	});
									       	doughnutData.push({
									       			color : "Orange",
									       			value : (data[2].sellCount/data[0].top4SellCount) * 100
									       	});
									       	doughnutData.push({
									       			color : "Black",
									       			value : (data[3].sellCount/data[0].top4SellCount) * 100
									       	});
									       	var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
									       	var rankStr = '';
									       		rankStr +=
									       			'<span style="font-size:1em;color:Red">1st '+data[0].menu_name+'</span><br/><br/>'+
									       			'<span style="font-size:1em;color:Blue">2nd '+data[1].menu_name+'</span><br/><br/>'+
									       			'<span style="font-size:1em;color:Orange">3rd '+data[2].menu_name+'</span><br/><br/>'+
									       			'<span style="font-size:1em;color:Black">4th '+data[3].menu_name+'</span>';
									       	$('#total').html(rankStr);
										};
									});
								</script>
	                      	</div><!--/grey-panel -->
                      	</div><!-- /col-md-4-->
                      	<div class="col-md-4 col-sm-4 mb">
                      			<div class="white-panel pn donut-chart">
                      				<div class="white-header">
                      					<h5>PRODUCT SELL RANK - TEXT</h5>
                      				</div>
                      				<div id="total" class="row">
                      				</div>
                    			</div>
                    		</div>
                    </div><!-- /row -->
					<script>
						$(function (){
							window.setInterval(function(){
								console.log('1분에 한번씩 호출');
								$.ajax({
								    //url : "http://192.168.0.27:8080/delivery/mypage/rtSend.whpr",		// 내부
								    url : "http://220.127.242.43:8090/delivery/mypage/rtSend.whpr",			// 외부
								    dataType : "jsonp",
								    jsonp : "callback",
								    success: function(data,dest) {
								    	successCallback(data,$('#data'));
								    },
								    error: function(request,status,error){
										console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									}
								});		
							},10000);
							
							var successCallback = function(data,target){
					        	console.log('data : '+data+', 유형 : '+typeof data);
					        	$(target).html('');
					        	var tblString = "";
					        	$.each(data,function(index, record){
					        		tblString += 
					       				'<tr>'+
									    	'<td>'+
										    	'<font size="2em" style="vertical-align:middle;">'+record.order_no+'</font>'+ 
									    	'</td>'+
									    	'<td style="padding:10px; text-align:center; vertical-align:middle;">'+
						                		'<font size="2em" style="vertical-align:middle;">'+record.menu_name+'</font>'+ 
						                	'</td>'+
									    	'<td style="padding:10px; text-align:center; vertical-align:middle;">'+
								    			'<font size="2em" style="vertical-align:middle;">'+record.store_name+'</font>'+
									    	'</td>'+
											'<td style="padding:10px; text-align:center; vertical-align:middle;">'+
												'<font size="2em" style="vertical-align:middle;">'+record.pay_complete+'</font>'+
											'</td>'+
											'<td style="padding:10px; text-align:center; vertical-align:middle;">'+
												'<font size="2em" style="vertical-align:middle;">'+record.status+'</font>'+
											'</td>'+
									    '</tr>';
					        	});
					        	$(target).html(tblString);
							};
						});
					</script>
		 </div>
					<div class="row mt">
						<div class="border-head">
							<br/>
                          <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Real Time Order</h1>
                      </div>
						<div class="col-sm-12" style="padding:5px 30px 5px 30px;" align="left">
							<table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" 
							       id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width:100%;">	              	
							<thead>
								<tr>
								  <th style="width:15%; text-align:center;">
								  	<font size="4em" style="vertical-align:middle;">Order NO#</font>	
								  </th>
								  <th style="text-align:center;">
								  	<font size="4em" style="vertical-align:middle;">Order INFO</font>
								  </th>
								  <th style="width:20%; text-align:center;">
								  	<font size="4em" style="vertical-align:middle;">Store NAME</font>
								  </th>
								  <th style="width:10%; text-align:center;">
								  	<font size="4em" style="vertical-align:middle;">Payment</font>
								  </th>
								  <th style="width:10%; text-align:center;">
								  	<font size="3em" style="vertical-align:middle;">Order Status</font>
								  </th>
								</tr>
			           		</thead>
			           		<tbody id="data">
							    <tr>
							    	<td colspan="5">
								    	10초후 서버와 연결됩니다...
							    	</td>
							    </tr>	
			           		</tbody>	                      	
				            </table> 
						</div>
                  </div><!-- /col-lg-12 END SECTION MIDDLE -->
<!-- *************************************************************************************************************************************************** -->
<%-- <c:import url="/admin/include/rightSidebar.jsp" /><!-- rigthSidebar 추가 --> --%>
				 <script src="${pageContext.request.contextPath}/bootstrap/js/common-scripts.js"></script> 
<!-- *************************************************************************************************************************************************** -->
               
                </div>
              </section>
            </section>
	</section>
  </body> 
</html>