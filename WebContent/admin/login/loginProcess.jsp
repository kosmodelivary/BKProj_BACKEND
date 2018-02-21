<%@page import="com.academy.delivery.service.impl.AdminServiceImpl"%>
<%@page import="com.academy.delivery.service.AdminService"%>
<%@ page import="com.academy.delivery.common.IbatisUtil"%>
<%@ page import="com.academy.delivery.service.AdminDto"%>
<%@ page import="com.academy.delivery.service.impl.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// get 방식 거부
	if (request.getMethod().equalsIgnoreCase("get")) {
		request.setAttribute("ERROR", "아이디와 비밀번호를 정상적으로 입력하셔야 합니다.");
		request.getRequestDispatcher("/").forward(request, response);
	}

	// 로그인 처리
	String		user		= request.getParameter("user").trim();	
	String		pass		= request.getParameter("pass").trim();

	AdminDto	adminDto	= new AdminDto();
	adminDto.setId(user);
	adminDto.setPass(pass);
	out.println(IbatisUtil.getMapper().toString() + "<br>");

	AdminService	adminService	= new AdminServiceImpl();
	if (adminService.login(adminDto) == true) {
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
		response.sendRedirect(request.getContextPath() + "/ADMIN/Order.do");
	} else {
		request.setAttribute("ERROR", "아이디와 비밀번호가 틀립니다.");
		request.getRequestDispatcher("/").forward(request, response);
	}
	
%>