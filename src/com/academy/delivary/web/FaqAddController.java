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

public class FaqAddController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FAQService faqService = new FAQServiceImpl();

		// get  방식	: 추가 폼 이동
		// post 방식	: 추가 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			req.getRequestDispatcher("/admin/faq/add.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");

			FAQDto	faqDto		= new FAQDto();
			faqDto.setFaq_answer(req.getParameter("answer"));
			faqDto.setFaq_ask(req.getParameter("ask"));
			
			faqService.insert(faqDto);		
			resp.sendRedirect(req.getContextPath() + "/ADMIN/Faq/List.do");
		}
		
	} // end service
	
} // end FaqAddController 
