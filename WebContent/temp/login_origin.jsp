<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <c:import url="/include/head.jsp"></c:import>
  
  <style>
  	#error {
  		text-align: center;
  		font-size: 1.3em;
  		font-weight: bold;
  	}
  
  </style>

  <body>
	<c:import url="/include/navbar.jsp" />

	<!-- content -->    
    <div class="container">
	    
      <form class="form-signin" method="post" action="${pageContext.request.contextPath }/login/loginProcess.jsp" >
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="user" class="sr-only">ID</label>
        <input type="text" id="user" name="user" value="${param.user }" class="form-control" placeholder="ID" required autofocus>
        <label for="pass" class="sr-only">Password</label>
        <input type="password" id="pass" name="pass" value="${param.pass }" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-id">Remember ID
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      </form>
      
      <div class="row" id="error">
      	${requestScope.ERROR }
	  </div>
    </div> <!-- /container -->
    
  
    <c:import url="/include/js.jsp"></c:import>
  </body>
</html>