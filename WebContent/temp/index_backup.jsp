<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Java King BACKEND</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/admin/css/dashboard.css' />" rel="stylesheet">

  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Java King BACKEND</a>
        </div>
      </div>
    </nav>

    <div class="container-fluid">

      <form class="form-signin" method="post" action="<c:url value='/admin/login/loginProcess.jsp' />" >
        <h2 class="form-signin-heading">Java King 관리자 로그인</h2>
        <label for="user" class="sr-only">아이디</label>
        <input type="text" id="user" name="user" value="${param.user }" class="form-control" placeholder="ID" required autofocus>
        <label for="pass" class="sr-only">비밀번호</label>
        <input type="password" id="pass" name="pass" value="${param.pass }" class="form-control" placeholder="Password" required>
        <div class="row">&nbsp;</div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      </form>
      
      <div class="row" id="error">
      	${requestScope.ERROR }
	  </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js' />"></script>
  </body>
</html>