<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--header start-->
<header class="header black-bg">
	<div class="sidebar-toggle-box">
		<i class="fa fa-bars" style="font-size:30px; margin:15px;" data-placement="right" data-original-title="Toggle Navigation"></i>
    </div>
	
	<a href="${pageContext.request.contextPath }/ADMIN/Order.do" class="logo" >
		<p><img src="${pageContext.request.contextPath}/Images/PREMIUM_LOGO.png"
				style="float:left; overflow:hidden; position:relative; width:85px; height:90px; padding-bottom:10px;"></p>
	</a>
	<a href="${pageContext.request.contextPath }/ADMIN/Order.do" class="logo" >
		<p><img src="${pageContext.request.contextPath}/Images/NEW_LOGO.png"
				style="float:left; overflow:hidden; position:relative; width:380px; height:70px; padding:0px 0px 3px 20px;"></p>
	</a>
	
    <div align="right">
		<a href="${pageContext.request.contextPath}/admin/login/logoutProcess.jsp"  class="logout" style="align-items:right;">
	    	<i class="fa fa-sign-out" style="font-size:40px; color:black; padding-top:35px" data-placement="right" ></i>
		</a>
    </div>                 
</header>
 <!--header end-->