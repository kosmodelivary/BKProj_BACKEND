<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- **********************************************************************************************************************************************************
      	MAIN SIDEBAR MENU
*********************************************************************************************************************************************************** -->
<aside>
	<div id="sidebar"  class="nav-collapse ">
 	<!--leftSidebar start-->
    <ul class="sidebar-menu" id="nav-accordion" style="padding-top:60px">
    <!-- Master Log-In 중 표시-->
    	<p class="centered">
    		<a href="${pageContext.request.contextPath }/ADMIN/Order.do">
    			<img src="${pageContext.request.contextPath}/Images/MASTER.png" class="img-circle" width="80px">
    		</a>
    	</p>
        <h5 class="centered">${sessionScope.USER_ID}님 로그인 중</h5>
                         	    	
	     <!-- 메인 화면 -->	
	     <li class="mt" <c:if test="${fn:contains(pageContext.request.requestURI, 'admin/order') }">class="active"</c:if>>
	        <a href="${pageContext.request.contextPath }/ADMIN/Order.do">
	        	<span class="fa fa-tv" style="font-size:12pt" >&nbsp;&nbsp;&nbsp;Main</span>
	            <c:if test="${fn:contains(pageContext.request.requestURI, 'admin/order') }"><span class="sr-only">(current)</span></c:if>
	        </a>
	     </li>
	              
		 <!-- 전체 메뉴 -->
	     <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/all') }">class="active"</c:if>>
	        <a href="${pageContext.request.contextPath }/ADMIN/MENU/All.do">
				<span class="fa fa-map-o" style="font-size:12pt">&nbsp;&nbsp;&nbsp;All Menu</span>
		        <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/all') }"><span class="sr-only">(current)</span></c:if>
	        </a>
	     </li>
                  
	     <!-- 이벤트 관리 -->
	     <!-- 
	 	 <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/event') }">class="active"</c:if>>
	        <a href="#">
	             <span class="fa fa-star-o" style="font-size:12pt">&nbsp;&nbsp;&nbsp;Event Management</span>
	             <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/event') }"><span class="sr-only">(current)</span></c:if>
	         </a>
	     </li>
	       -->                

	     <!-- 회원 리스트 -->
	     <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, '/member/list') }">class="active"</c:if>>
	         <a href="${pageContext.request.contextPath }/ADMIN/MEMBER/List.do">
	             <span class="fa fa-vcard-o" style="font-size:12pt">&nbsp;&nbsp;&nbsp;Members List</span>
	             <c:if test="${fn:contains(pageContext.request.requestURI, '/member/') }"><span class="sr-only">(current)</span></c:if>
	         </a>
	     </li>
	                  
	     <!-- 매장 리스트 -->
	     <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, '/store/') and not fn:contains(pageContext.request.requestURI, 'delivery') }">class="active"</c:if>>
	        <a href="${pageContext.request.contextPath }/ADMIN/STORE/List.do?nowPage=1">
	             <span class="fa fa-home" style="font-size:12pt">&nbsp;&nbsp;&nbsp;Store List</span>
	             <c:if test="${fn:contains(pageContext.request.requestURI, '/store/') }"><span class="sr-only">(current)</span></c:if>
	         </a>
	     </li>
	                  
	     <!-- 실시간 배달현황 -->
	     <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, 'store/delivery') }">class="active"</c:if>>
	         <a href="${pageContext.request.contextPath }/ADMIN/STORE/DELIVERY/View.do">
	             <span class="fa fa-motorcycle" style="font-size:12pt">&nbsp;&nbsp;&nbsp;Real-time Delivery</span>
	             <c:if test="${fn:contains(pageContext.request.requestURI, 'store/delivery') }"><span class="sr-only">(current)</span></c:if>
	         </a>
	     </li>
	                  
	     <!-- FAQ -->
	     <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, '/faq/list') }">class="active"</c:if>>
	         <a href="${pageContext.request.contextPath }/ADMIN/Faq/List.do">
	             <span class="fa fa-commenting" style="font-size:12pt">&nbsp;&nbsp;&nbsp;F A Q</span>
	             <c:if test="${fn:contains(pageContext.request.requestURI, '/faq/') }"><span class="sr-only">(current)</span></c:if>
	         </a>
	     </li>
	                  
	     <!-- 공지사항 -->
	     <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, '/notice/list') }">class="active"</c:if>>
	          <a href="${pageContext.request.contextPath}/ADMIN/NOTICE/List.do">
	            <span class="fa fa-volume-up" style="font-size:12pt">&nbsp;&nbsp;&nbsp;Notification</span>
	            <c:if test="${fn:contains(pageContext.request.requestURI, '/notice/') }"><span class="sr-only">(current)</span></c:if>
	         </a>
	     </li>
     </ul>           
     </div>
</aside> 