<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- **********************************************************************************************************************************************************
      	MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
<!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered">
              	  	<a href="${pageContext.request.contextPath }/ADMIN/Order.do">
              	  		<img src="${pageContext.request.contextPath}/bootstrap/img/BurgerKing.jpg" class="img-circle" width="80"></a></p>
              	    	<h5 class="centered"><b><a href="${pageContext.request.contextPath }/ADMIN/Order.do">${sessionScope.USER_ID}님 로그인 중</a></b></h5>
              	    	
              	  
              	  <!-- 메인 화면 -->	
              	  <li class="mt" <c:if test="${fn:contains(pageContext.request.requestURI, 'admin/order') }">class="active"</c:if>>
                  	<a href="${pageContext.request.contextPath }/ADMIN/Order.do">
                  		<i class="fa fa-tv"></i>
                          <span>Main</span>
                          <c:if test="${fn:contains(pageContext.request.requestURI, 'admin/order') }"><span class="sr-only">(current)</span></c:if>
	                </a>
	              </li>
	              
	              <!-- 전체 메뉴 -->
                  <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/all') }">class="active"</c:if>>
                      <a href="${pageContext.request.contextPath }/ADMIN/MENU/All.do">
                          <i class="fa fa-map-o"></i>
                          <span>All Menus</span>
                          <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/all') }"><span class="sr-only">(current)</span></c:if>
                      </a>
                  </li>
                  
                  <!-- 이벤트 관리 -->
            	  <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/event') }">class="active"</c:if>>
                     <a href="#">
                          <i class="fa fa-star-o"></i>
                          <span>Event Management</span>
                          <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/event') }"><span class="sr-only">(current)</span></c:if>
                      </a>
                  </li>
                      
                  <!-- 회원 리스트 -->
                  <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, '/member/list') }">class="active"</c:if>>
                      <a href="${pageContext.request.contextPath }/ADMIN/MEMBER/List.do">
                          <i class="fa fa-vcard-o"></i>
                          <span>Members List</span>
                          <c:if test="${fn:contains(pageContext.request.requestURI, '/member/') }"><span class="sr-only">(current)</span></c:if>
                      </a>
                  </li>
                  
                  <!-- 매장 리스트 -->
                  <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, '/store/') and not fn:contains(pageContext.request.requestURI, 'delivery') }">class="active"</c:if>>
                     <a href="${pageContext.request.contextPath }/ADMIN/STORE/List.do?nowPage=1">
                          <i class="fa fa-home"></i>
                          <span>Store List</span>
                          <c:if test="${fn:contains(pageContext.request.requestURI, '/store/') }"><span class="sr-only">(current)</span></c:if>
                      </a>
                  </li>
                  
                  <!-- 실시간 배달현황 -->
                  <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, 'store/delivery') }">class="active"</c:if>>
                      <a href="${pageContext.request.contextPath }/ADMIN/STORE/DELIVERY/View.do">
                          <i class="fa fa-motorcycle"></i>
                          <span>Real-time Delivery</span>
                          <c:if test="${fn:contains(pageContext.request.requestURI, 'store/delivery') }"><span class="sr-only">(current)</span></c:if>
                      </a>
                  </li>
                  
                  <!-- FAQ -->
                  <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, '/faq/list') }">class="active"</c:if>>
                      <a href="${pageContext.request.contextPath }/ADMIN/Faq/List.do">
                          <i class="fa fa-commenting"></i>
                          <span>F A Q</span>
                          <c:if test="${fn:contains(pageContext.request.requestURI, '/faq/') }"><span class="sr-only">(current)</span></c:if>
                      </a>
                  </li>
                  
                   <!-- 공지사항 -->
                  <li class="sub-menu" <c:if test="${fn:contains(pageContext.request.requestURI, '/notice/list') }">class="active"</c:if>>
                      <a href="${pageContext.request.contextPath }/ADMIN/Notice/List.do">
                          <i class="fa fa-clone"></i>
                          <span>Notification</span>
                          <c:if test="${fn:contains(pageContext.request.requestURI, '/notice/') }"><span class="sr-only">(current)</span></c:if>
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->      
