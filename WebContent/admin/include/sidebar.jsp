<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li <c:if test="${fn:contains(pageContext.request.requestURI, 'admin/order') }">class="active"</c:if>>
            	<a href="${pageContext.request.contextPath }/ADMIN/Order.do">
            		실시간 주문 현황<c:if test="${fn:contains(pageContext.request.requestURI, 'admin/order') }"><span class="sr-only">(current)</span></c:if>
            	</a>
            </li>
            <li><a href="#">-- 추가 메뉴 --</a></li>
            <li><a href="#">-- 추가 메뉴 --</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/all') }">class="active"</c:if>>
            	<a href="${pageContext.request.contextPath }/ADMIN/MENU/All.do">전체 딜리버리 메뉴<c:if test="${fn:contains(pageContext.request.requestURI, 'menu/all') }"><span class="sr-only">(current)</span></c:if></a>
            </li>
            <li <c:if test="${fn:contains(pageContext.request.requestURI, 'menu/event') }">class="active"</c:if>>
            	<a href="#">이벤트 관리<c:if test="${fn:contains(pageContext.request.requestURI, 'menu/event') }"><span class="sr-only">(current)</span></c:if></a>
            </li>
            <li><a href="#">-- 추가 메뉴 --</a></li>
            <li><a href="#">-- 추가 메뉴 --</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li <c:if test="${fn:contains(pageContext.request.requestURI, '/member/list') }">class="active"</c:if>>
            	<a href="${pageContext.request.contextPath }/ADMIN/MEMBER/List.do">
            		회원 리스트<c:if test="${fn:contains(pageContext.request.requestURI, '/member/') }"><span class="sr-only">(current)</span></c:if>
            	</a>
            </li>
            <li><a href="#">-- 추가 메뉴 --</a></li>
            <li><a href="#">-- 추가 메뉴 --</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li <c:if test="${fn:contains(pageContext.request.requestURI, '/store/') and not fn:contains(pageContext.request.requestURI, 'delivery') }">class="active"</c:if>>
            	<a href="${pageContext.request.contextPath }/ADMIN/STORE/List.do?nowPage=1">
            		매장 리스트<c:if test="${fn:contains(pageContext.request.requestURI, '/store/') }"><span class="sr-only">(current)</span></c:if>
            	</a>
            </li>
            <li <c:if test="${fn:contains(pageContext.request.requestURI, '/faq/list') }">class="active"</c:if>>
            	<a href="${pageContext.request.contextPath }/ADMIN/Faq/List.do">
            		FAQ<c:if test="${fn:contains(pageContext.request.requestURI, '/faq/') }"><span class="sr-only">(current)</span></c:if>
            	</a>
            </li>
            <li <c:if test="${fn:contains(pageContext.request.requestURI, 'store/delivery') }">class="active"</c:if>>
            	<a href="${pageContext.request.contextPath }/ADMIN/STORE/DELIVERY/View.do">
            		딜리버리 상황판<c:if test="${fn:contains(pageContext.request.requestURI, 'store/delivery') }"><span class="sr-only">(current)</span></c:if>
            	</a>
            </li>
            <li><a href="#">-- 추가 메뉴 --</a></li>
            <li><a href="#">-- 추가 메뉴 --</a></li>
          </ul>
        </div>