<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
<section id="container" >

<!--header start-->
<header class="header black-bg">
	<div>
		<a href="${pageContext.request.contextPath }/ADMIN/Order.do" class="logo">
			<img src="${pageContext.request.contextPath}/Images/pac.png" width="45" style="padding-bottom:17px">
			<font face="Impact" style="font-size:1.8em" color="RED">&nbsp;&nbsp;JAVA Murger&nbsp;&nbsp;</font>
			<img src="${pageContext.request.contextPath}/Images/burger2.png" width="45" style="padding-bottom:17px">
		</a>
    </div>
    <div align="right">
	    <a href="${pageContext.request.contextPath}/admin/login/logoutProcess.jsp"  class="logout" style="align-items:right;">
	        <img src="${pageContext.request.contextPath}/Images/logout.png" width="45" style="padding-top:17px">
		</a>
    </div>                 
</header>
 <!--header end-->
</section>
</body>
     