<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
     *********************************************************************************************************************************************************** -->                  
<div id="rsbContent" class="col-md-3 ds" style="padding-top:55px;">
<h3>Real-time Delivery Status</h3>
</div><!-- /col-lg-3 -->
<!--main content end-->

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/sparkline-chart.js"></script>    
    <script src="${pageContext.request.contextPath}/bootstrap/js/zabuto_calendar.js"></script>
	
	<script>
		$(function (){
			window.setInterval(function(){
				console.log('1분에 한번씩 호출');
				$.ajax({
				    // url : "http://192.168.0.27:8080/delivery/mypage/rtSend.whpr",		// 내부
				    url : "http://220.127.242.43:8090/delivery/mypage/rtSend.whpr",			// 외부
				    dataType : "jsonp",
				    jsonp : "callback",
				    success: function(data,dest) {
				    	successCallback(data,$('#rsbContent'));
				    },
				    error: function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});		
			},10000);
			
			
			
			var successCallback = function(data,target){
	        	console.log('data : '+data+', 유형 : '+typeof data);
	        	$(target).html('');
	        	var divString = "<h3>Real-time Delivery Status</h3>";
	        	$.each(data,function(index, record){
	       			divString += 
	       				'<div class="desc">'+
		       				'<div class="thumb">'+
								'<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>'+
							'</div>'+
							'<div class="details">'+
								'<ul>'+
								   '<li>Order No : #'+record.order_no+'</li>'+
								   '<li>Store No : #'+record.store_no+'</li>'+
								   '<li>Pay method :'+record.pay_complete+'</li>'+
								   '<li>Order status : '+record.status+'</li>'+
								   '<li>Orderer Address : '+record.order_addr+'</li>'+
								   '<li>Order memo : '+record.order_memo+'</li>'+
								'</ul>'+
							'</div>'+
						'</div>';
	        	});
	        	$(target).append(divString);
			};
		});
	</script>
</body>
