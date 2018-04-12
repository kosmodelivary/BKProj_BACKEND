<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--header start-->
<header class="header black-bg">
	<!-- 토글 박스 : 사이드바 열고 닫는 기능 -->
	<div class="sidebar-toggle-box">
		<i class="fa fa-bars" style="font-size:30px; margin:7px;" 
		   data-placement="right" data-original-title="Toggle Navigation"></i>
    </div>
	<!-- 로고 : JAVA MURGER 로고 -->
	<a href="${pageContext.request.contextPath }/ADMIN/Order.do" class="logo" >
		<p><img src="${pageContext.request.contextPath}/Images/NEW_LOGO7.png"
				style="max-width100%; max-height:100%; margin:0px; padding:0px;"></p>
	</a>
	
    <div align="right">
		<a href="${pageContext.request.contextPath}/admin/login/logoutProcess.jsp"  class="logout" style="align-items:right;">
	    	<i class="fa fa-sign-out" style="font-size:35px; color:black; padding-top:25px" data-placement="right" ></i>
		</a>
    </div>                 
</header>
 <!--header end-->