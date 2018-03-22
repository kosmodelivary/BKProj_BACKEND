<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

  	<c:import url="/admin/include/head.jsp" />
  
    <title>login.jsp</title>
    
		<meta charset="utf-8">
		<link href="${pageContext.request.contextPath}/bootstrap/css/style2.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

		<!--webfonts-->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,300,600,700' rel='stylesheet' type='text/css'>
		<!--//webfonts-->
</head>

<body>
	 <!-----start-main---->
	 <div class="main">
		<div class="login-form">
			<h1>Manager Login</h1>
				<c:if test="${sessionScope.USER_ID eq null}" var="isNotLogin" >
					 <form class="form-signin" method="post" action='<c:url value="/admin/login/loginProcess.jsp" />' >
					     <input type="text" class="text" value="USERNAME" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}" id="user" name="user" value="${param.user }" placeholder="ID" required autofocus>
						 <input type="password" value="password" id="pass" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" name="pass" value="${param.pass }" class="form-control" placeholder="Password" required>
						
						 <div class="submit">
								<input type="submit" onclick="myFunction()" value="LOGIN" >
						 </div>
						 <div class="row" id="error">
					      	${requestScope.ERROR }
						 </div>
						<p><a href="#">Forgot Password ?</a></p>
					</form>
				</c:if>
				 <c:if test="${not isNotLogin }">
					<c:redirect url="/ADMIN/Order.do" />
				 </c:if>	
			</div>
			<!--//End-login-form-->
			
			 <!-----start-copyright---->
   					<div class="copy-right">
						<p>Do you like <a href="http://w3layouts.com">BurgerKing?</a></p>
					</div>
				<!-----//end-copyright---->
		</div>
			 <!-----//end-main---->
		 		
</body>
</html>