package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.FAQDto;
import com.academy.delivery.service.FAQService;
import com.academy.delivery.service.impl.FAQServiceImpl;

public class FaqViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FAQService	faqService	= new FAQServiceImpl();
		FAQDto		faqDto		= faqService.selectOne(req.getParameter("no"));
		
		req.setAttribute("faqDto", faqDto);
		req.getRequestDispatcher("/admin/faq/view.jsp").forward(req, resp);
	}
	
}
