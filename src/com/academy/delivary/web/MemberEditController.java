package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.MemberDto;
import com.academy.delivery.service.MemberService;
import com.academy.delivery.service.impl.MemberServiceImpl;

public class MemberEditController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService	memberService	= new MemberServiceImpl();

		// get  방식	: 수정 폼 이동
		// post 방식	: 수정 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			MemberDto		memberDto		= memberService.selectOne(req.getParameter("no"));
			
			req.setAttribute("memberDto", memberDto);
			req.getRequestDispatcher("/admin/member/edit.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");

			MemberDto		memberDto		= memberService.selectOne(req.getParameter("no"));
			memberDto.setMember_name(req.getParameter("name"));
			memberDto.setMember_tel(req.getParameter("tel"));
			memberDto.setMember_agreesms(req.getParameter("sms"));
			memberDto.setMember_agreeemail(req.getParameter("email"));
			
			req.setAttribute("EDIT_RESULT", memberService.update(memberDto));
			req.getRequestDispatcher("/admin/member/process.jsp").forward(req, resp);
		}
	} // end service
	
} // end MemberEditController 
