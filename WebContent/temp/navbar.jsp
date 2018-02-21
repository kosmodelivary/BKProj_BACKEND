<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/include/head.jsp" />


<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">欅坂46 FANPAGE</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="${fn:contains(pageContext.request.requestURI, 'index') == true ? 'active' : '' }">
        	<a href="${pageContext.request.contextPath }/index.jsp">
        		Home
        	</a>
        </li>
        <li class="${fn:contains(pageContext.request.requestURI, 'freeboard') == true ? 'active' : '' }">
        	<a href="${pageContext.request.contextPath }/freeboard/list.jsp">
        		Freeboard
        	</a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:choose>
      		<c:when test="${USER_ID != null }">
		        <li class="nav navbar-nav ${fn:contains(pageContext.request.requestURI, 'myInfo') == true ? 'active' : '' }">
		        	<a href="${pageContext.request.contextPath }/login/myInfo.jsp">${USER_NAME }(id: ${USER_ID }) 님 로그인 중</a>
		        </li>
		        <li>
		        	<a href="${pageContext.request.contextPath }/login/logoutProcess.jsp">
		        		Logout
		        	</a>
		        </li>
      		</c:when>
      		<c:otherwise>
		        <li class="${fn:contains(pageContext.request.requestURI, 'login') == true ? 'active' : '' }">
		        	<a href="${pageContext.request.contextPath }/login/login.jsp">
		        		Login
		        	</a>
		        </li>
      		</c:otherwise>
      	</c:choose>
      </ul>      
    </div><!--/.nav-collapse -->
  </div>
</nav>
