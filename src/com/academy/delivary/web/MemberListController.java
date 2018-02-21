package com.academy.delivary.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.MemberDto;
import com.academy.delivery.service.MemberService;
import com.academy.delivery.service.impl.MemberServiceImpl;

public class MemberListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService	memberService	= new MemberServiceImpl();
		List<MemberDto> member			= memberService.selectList();
		
		req.setAttribute("member", member);
		req.getRequestDispatcher("/admin/member/list.jsp").forward(req, resp);
	} // end service
	
} // end MemberController
