<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
     *********************************************************************************************************************************************************** -->                  
                  
                <div class="col-md-3 ds" style="position:fixed; right:-40px; top:45px">
                  <!--COMPLETED ACTIONS DONUTS CHART-->
				<h3>Real-time Delivery Status</h3>
                                      
                    <!-- First Action -->
                    <div class="desc">
                    	<div class="thumb">
                    		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                    	</div>
                    	<div class="details">
                    		<p><muted>2 Minutes Ago</muted><br/>
                    		   <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                    		</p>
                    	</div>
                    </div>
                    <!-- Second Action -->
                    <div class="desc">
                    	<div class="thumb">
                    		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                    	</div>
                    	<div class="details">
                    		<p><muted>3 Hours Ago</muted><br/>
                    		   <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                    		</p>
                    	</div>
                    </div>
                    <!-- Third Action -->
                    <div class="desc">
                    	<div class="thumb">
                    		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                    	</div>
                    	<div class="details">
                    		<p><muted>7 Hours Ago</muted><br/>
                    		   <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                    		</p>
                    	</div>
                    </div>
                    <!-- Fourth Action -->
                    <div class="desc">
                    	<div class="thumb">
                    		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                    	</div>
                    	<div class="details">
                    		<p><muted>11 Hours Ago</muted><br/>
                    		   <a href="#">Mark Twain</a> commented your post.<br/>
                    		</p>
                    	</div>
                    </div>
                    <!-- Fifth Action -->
                    <div class="desc">
                    	<div class="thumb">
                    		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                    	</div>
                    	<div class="details">
                    		<p><muted>18 Hours Ago</muted><br/>
                    		   <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                    		</p>
                    	</div>
                    </div>
                </div><!-- /col-lg-3 -->
      <!--main content end-->

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery.js"></script>
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

  </body>
</html>
