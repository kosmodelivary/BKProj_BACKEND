package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.MemberService;
import com.academy.delivery.service.impl.MemberServiceImpl;

public class MemberDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		MemberService	memberService	= new MemberServiceImpl();
		req.setAttribute("DELETE_RESULT", memberService.delete(req.getParameter("no")));
		req.getRequestDispatcher("/admin/member/process.jsp").forward(req, resp);
	} // end service

}
