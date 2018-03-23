package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.FAQDto;
import com.academy.delivery.service.FAQService;
import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.FAQServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class FaqEditController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FAQService	faqService	= new FAQServiceImpl();

		// get  방식	: 수정 폼 이동
		// post 방식	: 수정 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			FAQDto	faqDto		= faqService.selectOne(req.getParameter("no"));
			
			req.setAttribute("faqDto", faqDto);
			req.getRequestDispatcher("/admin/faq/edit.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");

			FAQDto	faqDto		= faqService.selectOne(req.getParameter("no"));
			faqDto.setFaq_ask(req.getParameter("ask"));
			faqDto.setFaq_answer(req.getParameter("answer"));
			faqDto.setTabcon(req.getParameter("tabcon"));
			
			
			req.setAttribute("EDIT_RESULT", faqService.update(faqDto));
			req.getRequestDispatcher("/admin/faq/process.jsp").forward(req, resp);
		}
	} // end service
	
} // end FaqEditController
